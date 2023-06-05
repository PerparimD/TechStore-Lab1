import { useEffect, useState } from "react";
import classes from './Styles/TabelaEKategorive.module.css';
import axios from "axios";
import Button from "react-bootstrap/Button";
import ShtoKategori from "./ShtoKategori";
import Mesazhi from "../../layout/Mesazhi";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBan, faPenToSquare, faPlus, faClose } from '@fortawesome/free-solid-svg-icons'
import EditoKategorin from "./EditoKategorin";
import LargoKategorin from "./LargoKategorin";
import { TailSpin } from 'react-loader-spinner';

function TabelaEKategorive(props) {
    const [kategorit, setKategorit] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [shto, setShto] = useState(false);
    const [edito, setEdito] = useState(false);
    const [fshij, setFshij] = useState(false);
    const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
    const [tipiMesazhit, setTipiMesazhit] = useState("");
    const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");
    const [id, setId] = useState(0);
    const [loading, setLoading] = useState(false);

    const getToken = localStorage.getItem("token");

    const authentikimi = {
        headers: {
            Authorization: `Bearer ${getToken}`,
        },
    };

    useEffect(() => {
        const shfaqKateogrit = async () => {
            try {
                setLoading(true);
                const kategoria = await axios.get("https://localhost:7285/api/Kategoria/shfaqKategorit", authentikimi);
                setKategorit(kategoria.data);
                setLoading(false);
            } catch (err) {
                console.log(err);
                setLoading(false);
            }
        };

        shfaqKateogrit();
    }, [perditeso]);

    const handleClose = () => {
        setShto(false);
    }
    const handleShow = () => setShto(true);

    const handleEdito = (id) => {
        setEdito(true)
        setId(id)
    };
    const handleEditoMbyll = () => setEdito(false);

    const handleFshij = (id) => {
        setFshij(true)
        setId(id)
    };
    const handleFshijMbyll = () => setFshij(false);

    return (
        <div className={classes.containerDashboardP}>
            {shto && <ShtoKategori
                shfaq={handleShow}
                largo={handleClose}
                shfaqmesazhin={() => setShfaqMesazhin(true)}
                perditesoTeDhenat={() => setPerditeso(Date.now())}
                setTipiMesazhit={setTipiMesazhit}
                setPershkrimiMesazhit={setPershkrimiMesazhit}
            />}
            {shfaqMesazhin && <Mesazhi
                setShfaqMesazhin={setShfaqMesazhin}
                pershkrimi={pershkrimiMesazhit}
                tipi={tipiMesazhit}
            />}
            {edito && <EditoKategorin
                largo={handleEditoMbyll}
                id={id}
                shfaqmesazhin={() => setShfaqMesazhin(true)}
                perditesoTeDhenat={() => setPerditeso(Date.now())}
                setTipiMesazhit={setTipiMesazhit}
                setPershkrimiMesazhit={setPershkrimiMesazhit}
            />}
            {fshij && <LargoKategorin
                largo={handleFshijMbyll}
                id={id}
                shfaqmesazhin={() => setShfaqMesazhin(true)}
                perditesoTeDhenat={() => setPerditeso(Date.now())}
                setTipiMesazhit={setTipiMesazhit}
                setPershkrimiMesazhit={setPershkrimiMesazhit}
            />}
            {loading ? (
                <div className="Loader">
                    <TailSpin
                        height="80"
                        width="80"
                        color="#009879"
                        ariaLabel="tail-spin-loading"
                        radius="1"
                        wrapperStyle={{}}
                        wrapperClass=""
                        visible={true}
                    />
                </div>
            ) : (<>
                <h1 className="title">
                    Lista e Kategorive te Produkteve
                </h1>
                <Button
                    className="mb-3 Butoni"
                    onClick={() => props.setMbyllKategorite()}

                >
                    Mbyll Kategorite <FontAwesomeIcon icon={faClose} />
                </Button>
                <Button
                    className="mb-3 Butoni"
                    onClick={handleShow}
                >
                    Shto Kategori <FontAwesomeIcon icon={faPlus} />
                </Button>


                <table className="tableBig">
                    <tr>
                        <th>ID Kategorise</th>
                        <th>Emri Kategoris</th>
                        <th>Pershkrimi Kategoris</th>
                        <th>Funksione</th>
                    </tr>

                    {kategorit.map((k) => (
                        <tr key={k.kategoriaId}>
                            <td>{k.kategoriaId}</td>
                            <td>{k.llojiKategoris}</td>
                            <td >{k.pershkrimiKategoris !== null && k.pershkrimiKategoris.trim() !== '' ? k.pershkrimiKategoris : "Nuk Ka Pershkrim"}</td>
                            <td >
                                <Button style={{ marginRight: "0.5em" }} variant="success" onClick={() => handleEdito(k.kategoriaId)}><FontAwesomeIcon icon={faPenToSquare} /></Button>
                                <Button variant="danger" onClick={() => handleFshij(k.kategoriaId)}><FontAwesomeIcon icon={faBan} /></Button>
                            </td>
                        </tr>
                    ))}
                </table>
            </>
            )}
        </div >
    );
};

export default TabelaEKategorive;

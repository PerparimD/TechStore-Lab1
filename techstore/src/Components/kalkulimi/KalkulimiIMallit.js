import { useEffect, useState } from "react";
import classes from './Styles/TabelaEKompanive.module.css';
import axios from "axios";
import Button from "react-bootstrap/Button";
import RegjistroFaturen from "./RegjistroFaturen";
import Mesazhi from "../layout/Mesazhi";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBan, faPenToSquare, faPlus } from '@fortawesome/free-solid-svg-icons'
import EditoKompanin from "./EditoKompanin";
import LargoKompanin from "./LargoKompanin";
import { TailSpin } from 'react-loader-spinner';
import Nav from 'react-bootstrap/Nav';
import { Link } from "react-router-dom";
import AdminDashboard from "../Dashboard/AdminDashboard";

function KalkulimiIMallit() {
    const [kalkulimet, setKalkulimet] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [shto, setShto] = useState(false);
    const [edito, setEdito] = useState(false);
    const [fshij, setFshij] = useState(false);
    const [mbyllFature, setMbyllFaturen] = useState(true);
    const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
    const [tipiMesazhit, setTipiMesazhit] = useState("");
    const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");
    const [id, setId] = useState(0);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        const shfaqKalkulimet = async () => {
            try {
                setLoading(true);
                const kalkulimi = await axios.get("https://localhost:7285/api/RegjistrimiStokut/shfaqRegjistrimet");
                setKalkulimet(kalkulimi.data);
                setLoading(false);
            } catch (err) {
                console.log(err);
                setLoading(false);
            }
        };

        shfaqKalkulimet();
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

    const handleRegjistroFatuern = () =>{
        setShto(true)
        setMbyllFaturen(false)
    }

    const mbyllFaturen = () => {
        setMbyllFaturen(true);
        setShto(false);
    }

    return (
        <div className={classes.containerDashboardP}>
            {shfaqMesazhin && <Mesazhi
                setShfaqMesazhin={setShfaqMesazhin}
                pershkrimi={pershkrimiMesazhit}
                tipi={tipiMesazhit}
            />}
            {shto && <RegjistroFaturen
                setShfaqMesazhin={setShfaqMesazhin}
                pershkrimi={pershkrimiMesazhit}
                tipi={tipiMesazhit}
                setMbyllFaturen={mbyllFaturen}
            />}
            {edito && <EditoKompanin
                largo={handleEditoMbyll}
                id={id}
                shfaqmesazhin={() => setShfaqMesazhin(true)}
                perditesoTeDhenat={() => setPerditeso(Date.now())}
                setTipiMesazhit={setTipiMesazhit}
                setPershkrimiMesazhit={setPershkrimiMesazhit}
            />}
            {fshij && <LargoKompanin
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
            ) : (mbyllFature && <>
                <h1 className="title">
                    Lista e Kalkulimeve
                </h1>


                <Button
                    className="mb-3 Butoni"
                    onClick={handleRegjistroFatuern}

                >
                    Regjistro Faturen <FontAwesomeIcon icon={faPlus} />
                </Button>


                <table style={{ whiteSpace: "unset", }}>
                    <tr>
                        <th>Nr. Kalkulimit</th>
                        <th>Stafi Pergjegjes</th>
                        <th>Shuma totale e fatures</th>
                        <th>Totali i Produkteve ne fature</th>
                        <th>Data Regjistrimit</th>
                        <th>Funksione</th>
                    </tr>

                    {kalkulimet.map((k) => (
                        <tr key={k.idRegjistrimit}>
                            <td>{k.idRegjistrimit}</td>
                            <td>{k.stafiId + " - " + k.username}</td>
                            <td >{k.shumaTotaleRegjistrimit.toFixed(2)} €
                            </td>
                            <td>{k.totaliProdukteveRegjistruara}</td>
                            <td >{new Date(k.dataRegjistrimit).toLocaleDateString('en-GB', { dateStyle: 'short' })}</td>
                            <td >
                                <Button style={{ marginRight: "0.5em" }} variant="success" onClick={() => handleEdito(k.kompaniaId)}><FontAwesomeIcon icon={faPenToSquare} /></Button>
                                <Button variant="danger" onClick={() => handleFshij(k.kompaniaId)}><FontAwesomeIcon icon={faBan} /></Button>
                            </td>
                        </tr>
                    ))}
                </table>
            </>
            )
            }
        </div >
    );
};

export default KalkulimiIMallit;

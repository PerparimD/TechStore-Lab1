import { useEffect, useState } from "react";
import classes from './TabelaEKompanive.module.css';
import axios from "axios";
import Button from "react-bootstrap/Button";
import ShtoKompanit from "./ShtoKompanit";
import Mesazhi from "../layout/Mesazhi";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBan, faPenToSquare } from '@fortawesome/free-solid-svg-icons'
import EditoKompanin from "./EditoKompanin";

function TabelaEKompanive() {
    const [kompanit, setKompanit] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [show, setShow] = useState(false);
    const [edito, setEdito] = useState(false);
    const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
    const [tipiMesazhit, setTipiMesazhit] = useState("");
    const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");
    const [id, setId] = useState(0);

    useEffect(() => {
        const shfaqKompanit = async () => {
            try {
                const kompania = await axios.get("https://localhost:7285/api/Kompania/shfaqKompanit");
                setKompanit(kompania.data);
            } catch (err) {
                console.log(err);
            }
        };

        shfaqKompanit();
    }, [perditeso]);

    async function fshijKomapanin(id) {
        try {
            await axios.delete(`https://localhost:7285/api/Kompania/fshijKompanin?id=${id}`);
            setTipiMesazhit("success");
            setPershkrimiMesazhit("Kompania u fshi me sukses!")
            setPerditeso(Date.now());
            setShfaqMesazhin(true);
        } catch (error) {
            console.error(error);
            setTipiMesazhit("danger");
            setPershkrimiMesazhit("Ndodhi nje gabim gjate fshirjes se kompanis!")
            setPerditeso(Date.now());
            setShfaqMesazhin(true);
        }
    }

    const handleClose = () => {
        setShow(false);
    }
    const handleShow = () => setShow(true);

    const handleEdito = (id) => {
        setEdito(true)
        setId(id)
    };
    const handleEditoMbyll = () => setEdito(false);

    return (
        <div className={classes.containerDashboardP}>
            <h1>
                Kompanit
            </h1>

            <Button
                style={{ backgroundColor: "#009879", border: "none", float: "right" }}
                className="mb-3"
                onClick={handleShow}
            >
                Shto Kompanin
            </Button>
            {show && <ShtoKompanit
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
            {edito && <EditoKompanin
                largo={handleEditoMbyll}
                id={id}
                shfaqmesazhin={() => setShfaqMesazhin(true)}
                perditesoTeDhenat={() => setPerditeso(Date.now())}
                setTipiMesazhit={setTipiMesazhit}
                setPershkrimiMesazhit={setPershkrimiMesazhit}
            />}
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Emri i Kompanis</th>
                        <th>Logo</th>
                        <th>Adresa</th>
                        <th>Funksione</th>
                    </tr>
                </thead>

                <tbody>
                    {kompanit.map((k) => (
                        <tr key={k.kompaniaId}>
                            <td>{k.kompaniaId}</td>
                            <td>{k.emriKompanis}</td>
                            <td >
                                <img
                                    src={`${process.env.PUBLIC_URL}/img/slider/sliderIcons/${k.logo}`}
                                    width="50"
                                    alt=""
                                />
                            </td>
                            <td >{k.adresa}</td>
                            <td>
                                <Button variant="success" onClick={() => handleEdito(k.kompaniaId)}><FontAwesomeIcon icon={faPenToSquare} /></Button>
                                <Button variant="danger" onClick={() => fshijKomapanin(k.kompaniaId)}><FontAwesomeIcon icon={faBan} /></Button>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div >
    );
};

export default TabelaEKompanive;

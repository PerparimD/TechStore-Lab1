import { useEffect, useState } from "react";
import classes from './Styles/TabelaEKompanive.module.css';
import axios from "axios";
import Button from "react-bootstrap/Button";
import ShtoKompanit from "./ShtoKompanit";
import Mesazhi from "../../layout/Mesazhi";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBan, faPenToSquare, faPlus, faClose } from '@fortawesome/free-solid-svg-icons'
import EditoKompanin from "./EditoKompanin";
import LargoKompanin from "./LargoKompanin";
import { TailSpin } from 'react-loader-spinner';

import data from "../../../Data/Data";

function TabelaEKompanive(props) {
    const [kompanit, setKompanit] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [shto, setShto] = useState(false);
    const [edito, setEdito] = useState(false);
    const [fshij, setFshij] = useState(false);
    const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
    const [tipiMesazhit, setTipiMesazhit] = useState("");
    const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");
    const [id, setId] = useState(0);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        const shfaqKomp = async () => {
            try {
                setLoading(true);
                setKompanit(data.shfaqKompanit);
                setLoading(false);
            } catch (err) {
                console.log(err);
                setLoading(false);
            }
        };

        shfaqKomp();
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
            {shto && <ShtoKompanit
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
            ) : (<>
                <h1 className="title">
                    Lista e Kompanive Partnere
                </h1>

                <Button
                    className="mb-3 Butoni"
                    onClick={() => props.setMbyllKompanit()}

                >
                    Mbyll Kompanite <FontAwesomeIcon icon={faClose} />
                </Button>
                <Button
                    className="mb-3 Butoni"
                    onClick={handleShow}
                >
                    Shto Kompanin <FontAwesomeIcon icon={faPlus} />
                </Button>


                <table style={{ whiteSpace: "unset", }}>
                    <tr>
                        <th>Emri i Kompanis</th>
                        <th>Logo</th>
                        <th>Adresa</th>
                        <th>Funksione</th>
                    </tr>

                    {kompanit.map((k) => (
                        <tr key={k.kompaniaId}>
                            <td>{k.emriKompanis}</td>
                            <td >
                                <img
                                    src={`${process.env.PUBLIC_URL}/img/slider/sliderIcons/${k.logo}`}
                                    width="50"
                                    alt=""
                                />
                            </td>
                            <td >{k.adresa !== null && k.adresa.trim() !== '' ? k.adresa : "Nuk Ka Adrese"}</td>
                            <td >
                                <Button style={{ marginRight: "0.5em" }} variant="success" onClick={() => handleEdito(k.kompaniaId)}><FontAwesomeIcon icon={faPenToSquare} /></Button>
                                <Button variant="danger" onClick={() => handleFshij(k.kompaniaId)}><FontAwesomeIcon icon={faBan} /></Button>
                            </td>
                        </tr>
                    ))}
                </table>
            </>
            )}
        </div >
    );
};

export default TabelaEKompanive;

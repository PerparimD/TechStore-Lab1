import { useEffect, useState } from "react";
import classes from './Styles/TabelaEKompanive.module.css';
import axios from "axios";
import Button from "react-bootstrap/Button";
import ProduktiNeZbritje from "./ProduktiNeZbritje";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlus, faClose } from '@fortawesome/free-solid-svg-icons'
import { TailSpin } from 'react-loader-spinner';
import Mesazhi from "../../layout/Mesazhi";
import FshijZbritjen from './FshijZbritjen';

import data from "../../../Data/Data";

function ZbritjetEProduktit(props) {
    const [zbritjet, setZbritjet] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [shtoZbritjen, setShtoZbritjen] = useState(false);
    const [mbyllFature, setMbyllFaturen] = useState(true);
    const [id, setId] = useState(0);
    const [loading, setLoading] = useState(false);
    const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
    const [fshij, setFshij] = useState(false);
    const [tipiMesazhit, setTipiMesazhit] = useState("");
    const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");

    const getToken = localStorage.getItem("token");

    const authentikimi = {
        headers: {
            Authorization: `Bearer ${getToken}`,
        },
    };

    useEffect(() => {
        const shfaqSale = async () => {
            try {
                setLoading(true);
                setZbritjet(data.shfaqZbritjet);
                setLoading(false);
            } catch (err) {
                console.log(err);
                setLoading(false);
            }
        };

        shfaqSale();
    }, [perditeso]);


    const fshijZbritjen = (id) => {
        setTipiMesazhit("success");
        setPershkrimiMesazhit("Zbritja u fshi me sukses");
        setShfaqMesazhin(true);
        setPerditeso(Date.now());
    }

    const handleFshij = (id) => {
        setFshij(true)
        setId(id)
    };
    const handleFshijMbyll = () => setFshij(false);


    return (
        <div className={classes.containerDashboardP}>
            {shfaqMesazhin &&
                <Mesazhi
                    setShfaqMesazhin={setShfaqMesazhin}
                    pershkrimi={pershkrimiMesazhit}
                    tipi={tipiMesazhit}
                />
            }
            {fshij && <FshijZbritjen
                largo={handleFshijMbyll}
                fshijZbritjen={() => fshijZbritjen(id)}
                shfaqmesazhin={() => setShfaqMesazhin(true)}
                setTipiMesazhit={setTipiMesazhit}
                setPershkrimiMesazhit={setPershkrimiMesazhit}
            />}
            {shtoZbritjen && <ProduktiNeZbritje
                mbyllZbritjen={() => setShtoZbritjen(false)}
                shfaq={() => setShtoZbritjen(true)}
                setPerditeso={setPerditeso}
                setTipiMesazhit={setTipiMesazhit}
                setPershkrimiMesazhit={setPershkrimiMesazhit}
                shfaqmesazhin={() => setShfaqMesazhin(true)}
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
                    Zbritjet e Produkteve
                </h1>


                <Button
                    className="mb-3 Butoni"
                    onClick={() => props.setMbyllZbritjen()}

                >
                    Mbyll Zbritjet <FontAwesomeIcon icon={faClose} />
                </Button>
                <Button
                    className="mb-3 Butoni"
                    onClick={() => setShtoZbritjen(true)}

                >
                    Shto Zbritjen <FontAwesomeIcon icon={faPlus} />
                </Button>


                <table className="tableBig">
                    <tr>
                        <th>Nr. Zbritjes</th>
                        <th>ID dhe Emri Produktit</th>
                        <th>Qmim pa Zbritje</th>
                        <th>Qmimi me Zbritje</th>
                        <th>Data e Zbritjes</th>
                        <th>Data e Skadimit</th>
                        <th>Funksione</th>
                    </tr>

                    {zbritjet.map((z, index) => (
                        <tr key={index}>
                            <td>{index + 1}</td>
                            <td>{z.produktiId + " - " + z.emriProduktit}</td>
                            <td>{parseFloat(z.qmimiPaZbritjeProduktit).toFixed(2)} €</td>
                            <td >{parseFloat(z.qmimiMeZbritjeProduktit).toFixed(2)} € </td>
                            <td >{new Date(z.dataZbritjes).toLocaleDateString('en-GB', { dateStyle: 'short' })}</td>
                            <td >{new Date(z.dataSkadimit).toLocaleDateString('en-GB', { dateStyle: 'short' })}</td>
                            <td >
                                <Button style={{ marginRight: "0.5em" }} variant="danger" onClick={() => handleFshij(z.produktiId)}><FontAwesomeIcon icon={faClose} /></Button>
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

export default ZbritjetEProduktit;

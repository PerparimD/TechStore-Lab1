import { useEffect, useState } from "react";
import classes from './Styles/TabelaEKompanive.module.css';
import axios from "axios";
import Button from "react-bootstrap/Button";
import ProduktiNeZbritje from "./ProduktiNeZbritje";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCircleInfo, faPlus, faClose } from '@fortawesome/free-solid-svg-icons'
import { TailSpin } from 'react-loader-spinner';

function ZbritjetEProduktit(props) {
    const [zbritjet, setZbritjet] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [shtoZbritjen, setShtoZbritjen] = useState(false);
    const [mbyllFature, setMbyllFaturen] = useState(true);
    const [id, setId] = useState(0);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        const shfaqZbritjet = async () => {
            try {
                setLoading(true);
                const zbritja = await axios.get("https://localhost:7285/api/ZbritjaQmimitProduktit/shfaqZbritjet");
                setZbritjet(zbritja.data);
                setLoading(false);
            } catch (err) {
                console.log(err);
                setLoading(false);
            }
        };

        shfaqZbritjet();
    }, [perditeso]);

    const handleShfaqTeDhenat = (id) => {
        setMbyllFaturen(false);
        setId(id);
    };


    return (
        <div className={classes.containerDashboardP}>
            {shtoZbritjen && <ProduktiNeZbritje
                setMbyllFaturen={() => setShtoZbritjen(false)}
                shfaq={() => setShtoZbritjen(true)}
                setPerditeso={setPerditeso}
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
                        <th>Funksione</th>
                    </tr>

                    {zbritjet.map((z, index) => (
                        <tr key={index}>
                            <td>{index + 1}</td>
                            <td>{z.produktiId + " - " + z.emriProduktit}</td>
                            <td>{parseInt(z.qmimiPaZbritjeProduktit).toFixed(2)} €</td>
                            <td >{parseInt(z.qmimiMeZbritjeProduktit).toFixed(2)} € </td>
                            <td >{new Date(z.dataZbritjes).toLocaleDateString('en-GB', { dateStyle: 'short' })}</td>
                            <td >
                                <Button style={{ marginRight: "0.5em" }} variant="success" onClick={() => handleShfaqTeDhenat(z.idRegjistrimit)}><FontAwesomeIcon icon={faCircleInfo} /></Button>
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

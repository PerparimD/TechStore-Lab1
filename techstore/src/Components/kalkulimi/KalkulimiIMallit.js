import { useEffect, useState } from "react";
import classes from './Styles/TabelaEKompanive.module.css';
import axios from "axios";
import Button from "react-bootstrap/Button";
import RegjistroFaturen from "./RegjistroFaturen";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCircleInfo, faPlus } from '@fortawesome/free-solid-svg-icons'
import TeDhenatKalkulimit from "./TeDhenatKalkulimit";
import { TailSpin } from 'react-loader-spinner';

function KalkulimiIMallit() {
    const [kalkulimet, setKalkulimet] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [shto, setShto] = useState(false);
    const [shfaqTeDhenat, setShfaqTeDhenat] = useState(false);
    const [mbyllFature, setMbyllFaturen] = useState(true);
    const [id, setId] = useState(0);
    const [loading, setLoading] = useState(false);

    const getToken = localStorage.getItem("token");

    const authentikimi = {
        headers: {
            Authorization: `Bearer ${getToken}`,
        },
    };

    useEffect(() => {
        const shfaqKalkulimet = async () => {
            try {
                setLoading(true);
                const kalkulimi = await axios.get("https://localhost:7285/api/RegjistrimiStokut/shfaqRegjistrimet", authentikimi);
                setKalkulimet(kalkulimi.data);
                setLoading(false);
            } catch (err) {
                console.log(err);
                setLoading(false);
            }
        };

        shfaqKalkulimet();
    }, [perditeso]);

    const handleRegjistroFatuern = () => {
        setShto(true)
        setMbyllFaturen(false)
    }

    const mbyllFaturen = () => {
        setMbyllFaturen(true);
        setShto(false);
    }

    const handleShfaqTeDhenat = (id) => {
        setShfaqTeDhenat(true);
        setMbyllFaturen(false);
        setId(id);
    };

    const mbyllTeDhenat = () => {
        setMbyllFaturen(true);
        setShfaqTeDhenat(false);
    }

    return (
        <div className={classes.containerDashboardP}>
            {shto && <RegjistroFaturen
                setMbyllFaturen={mbyllFaturen}
                setPerditeso={setPerditeso}
            />}
            {shfaqTeDhenat && <TeDhenatKalkulimit
                setMbyllTeDhenat={mbyllTeDhenat}
                id={id}
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
                                <Button style={{ marginRight: "0.5em" }} variant="success" onClick={() => handleShfaqTeDhenat(k.idRegjistrimit)}><FontAwesomeIcon icon={faCircleInfo} /></Button>
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

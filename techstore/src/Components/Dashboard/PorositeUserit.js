import { useEffect, useState } from "react";
import classes from './Styles/PorositeUserit.module.css';
import axios from "axios";
import Button from "react-bootstrap/Button";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBan, faPenToSquare, faPlus, faClose } from '@fortawesome/free-solid-svg-icons'
import { TailSpin } from 'react-loader-spinner';
import PagesaMeSukses from "../produktet/cart/Checkout/PagesaMeSukses";

function PorositeUserit(props) {
    const [porosite, setPorosite] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [nrFatures, setNrFatures] = useState(0);
    const [loading, setLoading] = useState(false);
    const [shfaqDetajet, setShfaqDetajet] = useState(false);

    useEffect(() => {
        const shfaqKateogrit = async () => {
            try {
                setLoading(true);
                const porosija = await axios.get(`https://localhost:7285/api/Porosia/shfaqPorositeUserit?idPerdoruesi=${props.idUseri}`);
                setPorosite(porosija.data);
                setLoading(false);
            } catch (err) {
                console.log(err);
                setLoading(false);
            }
        };

        shfaqKateogrit();
    }, [perditeso]);

    return (
        <div className={classes.containerDashboardP}>
            {shfaqDetajet && <PagesaMeSukses nrFatures={nrFatures} />}

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
                    onClick={() => props.setShfaqPorosite()}

                >
                    Mbyll Kategorite <FontAwesomeIcon icon={faClose} />
                </Button>


                <table className="tableBig">
                    <tr>
                        <th>ID Porosise</th>
                        <th>Data Porosise</th>
                        <th>Totali Produkteve ne Porosi</th>
                        <th>Totali Porosise €</th>
                        <th>Zbritja €</th>
                        <th>Statusi Porosise</th>
                        <th>Funksione</th>
                    </tr>

                    {porosite.map((k) => (
                        <tr key={k.idPorosia}>
                            <td>{k.idPorosia}</td>
                            <td>{new Date(k.dataPorosis).toLocaleDateString('en-GB', { dateStyle: 'short' })}</td>
                            <td>{k.totaliProdukteve}</td>
                            <td >{parseFloat(k.totaliPorosis).toFixed(2)}</td>
                            <td >{k.zbritja !== 0 ? parseFloat(k.zbritja).toFixed(2) : "Nuk Ka Zbritje"}</td>
                            <td >{k.statusiPorosis}</td>
                            <td >
                                <Button style={{ marginRight: "0.5em" }} variant="success" onClick={() => { setNrFatures(k.idPorosia); setShfaqDetajet(true) }}><FontAwesomeIcon icon={faPenToSquare} /></Button>
                                <Button variant="danger" ><FontAwesomeIcon icon={faBan} /></Button>
                            </td>
                        </tr>
                    ))}
                </table>
            </>
            )}
        </div >
    );
};

export default PorositeUserit;

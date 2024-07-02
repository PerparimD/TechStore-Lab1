import { useEffect, useState } from "react";
import classes from './Styles/TabelaEKompanive.module.css';
import axios from "axios";
import Button from "react-bootstrap/Button";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faClose, faPlus } from '@fortawesome/free-solid-svg-icons'
import { TailSpin } from 'react-loader-spinner';
import { Table, Container, Row, Col } from 'react-bootstrap';

import data from "../../Data/Data";

function TeDhenatKalkulimit(props) {
    const [perditeso, setPerditeso] = useState('');
    const [loading, setLoading] = useState(false);
    const [produktet, setProduktet] = useState([]);
    const [teDhenatFat, setTeDhenatFat] = useState("");

    useEffect(() => {
        const vendosTeDhenat = async () => {
            try {
                setLoading(true);
                const produktet = data.shfaqTeDhenatKalkulimit.filter((item) => item.idRegjistrimit == props.id);
                setProduktet(produktet);
                setLoading(false);
            } catch (err) {
                console.log(err);
                setLoading(false);
            }
        };

        vendosTeDhenat();
    }, [perditeso]);

    useEffect(() => {
        const shfaqTeDhenatFature = async () => {
            try {
                setLoading(true);
                const teDhenat = data.shfaqRegjistrimet.find((item) => item.idRegjistrimit == props.id);
                setTeDhenatFat(teDhenat);
                setLoading(false);
            }
            catch (err) {
                console.log(err);
                setLoading(false);
            }
        }

        shfaqTeDhenatFature();
    }, [perditeso]);


    const handleSave = () => {
        props.setMbyllTeDhenat();
    }

    const ndrroField = (e, tjetra) => {
        if (e.key === 'Enter') {
            e.preventDefault();
            document.getElementById(tjetra).focus();
        }
    }

    return (
        <div className={classes.containerDashboardP}>
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
                <Container fluid>
                    <Row>
                        <h1 className="title">
                            Te Dhenat e Fatures
                            <Button
                                className="mb-3 Butoni"
                                onClick={handleSave}
                            >
                                Mbyll Te Dhenat <FontAwesomeIcon icon={faClose} />
                            </Button>
                        </h1>
                    </Row>
                    <Row>
                        <Col className={classes.mobileResponsive}>
                            <h4>Totali Produkteve: {teDhenatFat.totaliProdukteveRegjistruara}</h4>
                            <h4>Totali Fatures: {parseFloat(teDhenatFat.shumaTotaleRegjistrimit).toFixed(2)} €</h4>
                            <h4>Profiti: {(teDhenatFat.shumaTotaleRegjistrimit - teDhenatFat.shumaTotaleBlerese).toFixed(2)} €</h4>
                            <p>Profiti: Qmimi Bleres - Qmimi Shites (Perfshihet TVSH)</p>
                        </Col>
                        <Col className={classes.mobileResponsive}>
                            <p><strong>Qmimi Bleres Pa TVSH:</strong> {(teDhenatFat.shumaTotaleBlerese - teDhenatFat.shumaTotaleBlerese * 0.152542).toFixed(2)} €</p>
                            <p><strong>Qmimi Bleres - TVSH-ja:</strong> {(teDhenatFat.shumaTotaleBlerese * 0.152542).toFixed(2)} €</p>
                            <h5><strong>Qmimi Bleres: </strong> {parseFloat(teDhenatFat.shumaTotaleBlerese).toFixed(2)} €</h5>
                        </Col>
                        <Col className={classes.mobileResponsive}>
                            <p><strong>Personi Pergjegjes:</strong> {teDhenatFat.stafiId + " - " + teDhenatFat.username}</p>
                            <p><strong>Data Regjistrimit:</strong> {new Date(teDhenatFat.dataRegjistrimit).toLocaleDateString('en-GB', { dateStyle: 'short' })}</p>
                        </Col>
                    </Row>
                    <Table striped bordered hover>
                        <thead>
                            <tr>
                                <th>Nr. Rendore</th>
                                <th>ID dhe Emri</th>
                                <th>Sasia</th>
                                <th>Qmimi Bleres</th>
                                <th>Qmimi Shites</th>
                                <th>Shuma Totale Blerese</th>
                                <th>Shuma Totale Shitese</th>
                            </tr>
                        </thead>
                        <tbody>
                            {produktet && produktet.map((produkti, index) => (
                                <tr key={index}>
                                    <td>{index + 1}</td>
                                    <td>{produkti.idProduktit + " - " + produkti.emriProduktit}</td>
                                    <td>{produkti.sasiaStokut}</td>
                                    <td>{parseFloat(produkti.qmimiBleres).toFixed(2)} €</td>
                                    <td>{parseFloat(produkti.qmimiShites).toFixed(2)} €</td>
                                    <td>{(produkti.sasiaStokut * produkti.qmimiBleres).toFixed(2)} €</td>
                                    <td>{(produkti.sasiaStokut * produkti.qmimiShites).toFixed(2)} €</td>
                                </tr>
                            ))}
                        </tbody>
                    </Table>
                </Container>
            </>
            )}
        </div >
    );
};

export default TeDhenatKalkulimit;

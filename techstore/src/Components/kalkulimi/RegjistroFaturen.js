import { useEffect, useState } from "react";
import classes from '../kodiZbritjes/Styles/TabelaEKompanive.module.css';
import axios from "axios";
import Button from "react-bootstrap/Button";
import Mesazhi from "../layout/Mesazhi";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlus } from '@fortawesome/free-solid-svg-icons'
import { TailSpin } from 'react-loader-spinner';
import { Table, Form, Container, Row, Col } from 'react-bootstrap';

function RegjistroFaturen(props) {
    const [perditeso, setPerditeso] = useState('');
    const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
    const [tipiMesazhit, setTipiMesazhit] = useState("");
    const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");
    const [loading, setLoading] = useState(false);
    const [produktetNeKalkulim, setproduktetNeKalkulim] = useState([]);
    const [emriProduktit, setemriProduktit] = useState('');
    const [produktiID, setProduktiID] = useState(0);
    const [produktet, setProduktet] = useState([]);
    const [sasia, setSasia] = useState("");
    const [qmimiBleres, setQmimiBleres] = useState("");
    const [qmimiShites, setQmimiShites] = useState("");
    const [totProdukteve, setTotProdukteve] = useState(0);
    const [totFaturesShitese, setTotFaturesShitese] = useState(0);
    const [totFaturesBlerese, setTotFaturesBlerese] = useState(0);
    const [sasiaNeStok, setSasiaNeStok] = useState(0);
    const [qmimiB, setQmimiB] = useState(0);
    const [qmimiSH, setQmimiSH] = useState(0);

    useEffect(() => {
        const vendosProduktet = async () => {
            try {
                const produktet = await axios.get(
                    `https://localhost:7285/api/Produkti/Products`
                );
                setProduktet(produktet.data);

            } catch (err) {
                console.log(err);
            }
        };

        vendosProduktet();
    }, [perditeso]);

    const handleSubmit = (event) => {
        event.preventDefault();
        const produkti = {
            emriProduktit: emriProduktit,
            produktiId: produktiID,
            sasia: sasia,
            qmimiBleres: qmimiBleres,
            qmimiShites: qmimiShites,
        };
        setproduktetNeKalkulim([...produktetNeKalkulim, produkti]);
        updateTotals([...produktetNeKalkulim, produkti]);

        setProduktiID(0);
        setQmimiBleres("");
        setSasia("");
        setQmimiShites("");
        setSasiaNeStok(0);
        setQmimiB(0);
        setQmimiSH(0);
    };

    const handleProduktiChange = (value, text, sasia, qmimiB, qmimiSH) => {
        setProduktiID(value);
        setemriProduktit(text);
        setSasiaNeStok(sasia);
        setQmimiB(qmimiB);
        setQmimiSH(qmimiSH);
    };

    const updateTotals = (newproduktetNeKalkulim) => {
        let totalProdkteve = 0;
        let totalFaturesShitese = 0;
        let totalFaturesBlerese = 0;
        newproduktetNeKalkulim.forEach((produkti) => {
            totalProdkteve += 1;
            totalFaturesShitese += produkti.sasia * produkti.qmimiShites;
            totalFaturesBlerese += produkti.sasia * produkti.qmimiBleres;
        });
        setTotProdukteve(totalProdkteve);
        setTotFaturesShitese(totalFaturesShitese);
        setTotFaturesBlerese(totalFaturesBlerese);
    };

    const handleSave = () => {
        if(totFaturesShitese > 0){
            handleMbyllFature();
            props.setMbyllFaturen();
        }
        else{
            props.setMbyllFaturen();
        }
    }

    const ndrroField = (e, tjetra) => {
        if (e.key === 'Enter') {
            e.preventDefault();
            document.getElementById(tjetra).focus();
        }
    }

    async function handleMbyllFature() {
        try {
            await axios.post('https://localhost:7285/api/RegjistrimiStokut/RuajKalkulimin', {
                totaliProdukteveRegjistruara: totProdukteve,
                shumaTotaleRegjistrimit: totFaturesShitese,
                shumaTotaleBlerese: totFaturesBlerese,
                stafiId: 2 //Duhet te ndryshohet kur te behet pjesa e authentikimit
            }).then(async (response) => {

                for (let produkti of produktetNeKalkulim) {
                    await axios.post('https://localhost:7285/api/RegjistrimiStokut/ruajKalkulimin/teDhenat', {
                        idRegjistrimit: response.data.idRegjistrimit,
                        idProduktit: produkti.produktiId,
                        sasiaStokut: produkti.sasia,
                        qmimiBleres: produkti.qmimiBleres,
                        qmimiShites: produkti.qmimiShites,
                    });
                    await axios.put(`https://localhost:7285/api/RegjistrimiStokut/ruajKalkulimin/perditesoStokunQmimin?id=${produkti.produktiId}`, {
                        produktiId: produkti.produktiId,
                        qmimiBleres: produkti.qmimiBleres,
                        qmimiProduktit: produkti.qmimiShites,
                        sasiaNeStok: produkti.sasia
                    });
                }

                props.setPerditeso(Date.now());
            })


        } catch (error) {
            console.error(error);
        }
    }


    return (
        <div className={classes.containerDashboardP}>
            {shfaqMesazhin && <Mesazhi
                setShfaqMesazhin={setShfaqMesazhin}
                pershkrimi={pershkrimiMesazhit}
                tipi={tipiMesazhit}
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
                    Kalkulimi i Mallit
                </h1>

                <Button
                    className="mb-3 Butoni"
                    onClick={handleSave}
                >
                    Mbyll Faturen <FontAwesomeIcon icon={faPlus} />
                </Button>
                <Container fluid>
                    <Row>
                        <Col>
                            <Form onSubmit={handleSubmit}>
                                <Form.Group controlId="idDheEmri">
                                    <Form.Label>Produkti</Form.Label>
                                    <select
                                        placeholder="Produkti"
                                        className="form-select"
                                        value={produktiID ? produktiID : 0}
                                        onChange={(e) =>
                                            handleProduktiChange(e.target.value,
                                                e.target.options[e.target.selectedIndex].text,
                                                e.target.options[e.target.selectedIndex].getAttribute('sasiaNeStok'),
                                                e.target.options[e.target.selectedIndex].getAttribute('qmimiBleres'),
                                                e.target.options[e.target.selectedIndex].getAttribute('qmimiShites')
                                            )
                                        }
                                        onKeyDown={(e) => { ndrroField(e, "sasia") }}
                                    >
                                        <option defaultValue value={0} key={0} disabled>
                                            Zgjedhni Produktin
                                        </option>
                                        {produktet.map((item) => {
                                            return (
                                                <option key={item.produktiId}
                                                    value={item.produktiId}
                                                    sasiaNeStok={item.sasiaNeStok}
                                                    qmimiBleres={item.qmimiBleres}
                                                    qmimiShites={item.qmimiProduktit}
                                                >
                                                    {item.produktiId + " - " + item.emriProduktit}
                                                </option>
                                            );
                                        })}
                                    </select>
                                </Form.Group>
                                <Form.Group>
                                    <Form.Label>Sasia</Form.Label>
                                    <Form.Control
                                        id="sasia"
                                        type="number"
                                        value={sasia}
                                        onChange={(e) => {
                                            if (e.target.value > 0) {
                                                setSasia(e.target.value);
                                            } else {
                                                setPershkrimiMesazhit("Sasia duhet te jete me e madhe se 0!");
                                                setTipiMesazhit("danger");
                                                setShfaqMesazhin(true);
                                            }
                                        }}
                                        onKeyDown={(e) => { ndrroField(e, "qmimiBleres") }}
                                    />
                                </Form.Group>
                                <Form.Group>
                                    <Form.Label>Qmimi Bleres</Form.Label>
                                    <Form.Control
                                        id="qmimiBleres"
                                        type="number"
                                        value={qmimiBleres}
                                        onChange={(e) => {
                                            if (e.target.value > 0) {
                                                setQmimiBleres(e.target.value);
                                            } else {
                                                setPershkrimiMesazhit("Qmimi Bleres duhet te jete me i madhe se 0!");
                                                setTipiMesazhit("danger");
                                                setShfaqMesazhin(true);
                                            }
                                        }}
                                        onKeyDown={(e) => { ndrroField(e, "qmimiShites") }}
                                    />
                                </Form.Group>
                                <Form.Group>
                                    <Form.Label>Qmimi Shites</Form.Label>
                                    <Form.Control
                                        id="qmimiShites"
                                        type="number"
                                        value={qmimiShites}
                                        onChange={(e) => {
                                            if (e.target.value > 0) {
                                                setQmimiShites(e.target.value);
                                            } else {
                                                setPershkrimiMesazhit("Qmimi Shites duhet te jete me i madhe se 0!");
                                                setTipiMesazhit("danger");
                                                setShfaqMesazhin(true);
                                            }
                                        }}
                                    />
                                </Form.Group>
                                <br />
                                <Button variant="primary" type="submit">
                                    Shto Produktin
                                </Button>


                            </Form>
                        </Col>
                        <Col>
                            <p><strong>Qmimi Bleres:</strong> {parseInt(qmimiB).toFixed(2)} €</p>
                            <p><strong>Qmimi Shites:</strong> {parseInt(qmimiSH).toFixed(2)} €</p>
                            <p><strong>Sasia aktuale ne Stok:</strong> {sasiaNeStok} copë</p>
                        </Col>
                        <Col>
                            <h4>Totali Produkteve: {totProdukteve}</h4>
                            <h4>Totali Fatures: {totFaturesShitese.toFixed(2)} €</h4>
                        </Col>
                    </Row>
                    <h1 className="title">Tabela e Produkteve te Fatures</h1>
                    <Table striped bordered hover>
                        <thead>
                            <tr>
                                <th>Nr. Rendore</th>
                                <th>ID dhe Emri</th>
                                <th>Sasia</th>
                                <th>Qmimi Bleres</th>
                                <th>Qmimi Shites</th>
                                <th>Totali Bleres</th>
                                <th>Totali Shites</th>
                            </tr>
                        </thead>
                        <tbody>
                            {produktetNeKalkulim.map((produkti, index) => (
                                <tr key={index}>
                                    <td>{index + 1}</td>
                                    <td>{produkti.emriProduktit}</td>
                                    <td>{produkti.sasia}</td>
                                    <td>{parseInt(produkti.qmimiBleres).toFixed(2)} €</td>
                                    <td>{parseInt(produkti.qmimiShites).toFixed(2)} €</td>
                                    <td>{(produkti.sasia * produkti.qmimiBleres).toFixed(2)} €</td>
                                    <td>{(produkti.sasia * produkti.qmimiShites).toFixed(2)} €</td>
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

export default RegjistroFaturen;

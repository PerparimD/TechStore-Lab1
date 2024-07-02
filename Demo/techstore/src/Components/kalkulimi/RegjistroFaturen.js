import { useEffect, useState } from "react";
import classes from '../kodiZbritjes/Styles/TabelaEKompanive.module.css';
import axios from "axios";
import Button from "react-bootstrap/Button";
import Mesazhi from "../layout/Mesazhi";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlus, faXmark, faPenToSquare } from '@fortawesome/free-solid-svg-icons'
import { TailSpin } from 'react-loader-spinner';
import { Table, Form, Container, Row, Col } from 'react-bootstrap';
import { useNavigate } from "react-router-dom";
import { Modal } from "react-bootstrap";

import data from "../../Data/Data";

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

    const [edito, setEdito] = useState(false);
    const [konfirmoMbylljenFatures, setKonfirmoMbylljenFatures] = useState(false);

    const [teDhenat, setTeDhenat] = useState([]);


    const navigate = useNavigate();

    const getID = localStorage.getItem("id");

    const getToken = localStorage.getItem("token");

    const authentikimi = {
        headers: {
            Authorization: `Bearer ${getToken}`,
        },
    };

    useEffect(() => {
        if (getID) {
            const vendosTeDhenat = async () => {
                try {
                    const perdoruesi = data.shfaqPerdoruesit.find((item) => item.perdoruesi.aspNetUserId == getID);
                    setTeDhenat(perdoruesi);
                } catch (err) {
                    console.log(err);
                } finally {
                    setLoading(false);
                }
            };

            vendosTeDhenat();
        } else {
            navigate("/login");
        }
    }, [perditeso]);

    useEffect(() => {
        const vendosProduktet = async () => {
            try {
                const produktet = data.shfaqProduktet;
                setProduktet(produktet);

            } catch (err) {
                console.log(err);
            }
        };

        vendosProduktet();
    }, [perditeso]);

    const handleSubmit = (event) => {
        if (produktiID === 0 ||
            sasia <= 0 ||
            qmimiShites <= 0 ||
            qmimiBleres <= 0) {
            event.preventDefault();
            setPershkrimiMesazhit("Ju lutem plotesoni te gjitha te dhenat!");
            setTipiMesazhit("danger");
            setShfaqMesazhin(true);
        } else {
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
        }
    };

    const handleProduktiChange = (value, text, sasia, qmimiB, qmimiSH) => {
        const kontrolloProduktin = produktetNeKalkulim.filter((item) => item.produktiId === value);

        if (kontrolloProduktin.length > 0) {
            setPershkrimiMesazhit("Produkti eshte shtuar nje here! Ju keni mundesi ta editoni ate");
            setTipiMesazhit("danger");
            setShfaqMesazhin(true);
            setProduktiID(0);
        } else {
            setProduktiID(value);
            setemriProduktit(text);
            setSasiaNeStok(sasia);
            setQmimiB(qmimiB);
            setQmimiSH(qmimiSH);
        }
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
        if (totFaturesShitese > 0) {
            handleMbyllFature();
            props.setMbyllFaturen();
        }
        else {
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
        

                props.setPerditeso(Date.now());
                props.setMbyllFaturen();
    }

    function handleFshij(id) {
        const eReja = produktetNeKalkulim.filter((item) => item.produktiId !== id);

        setproduktetNeKalkulim(eReja);
    }

    function handleEdit(id) {
        setEdito(true);
        const produkti = produktetNeKalkulim.filter((item) => item.produktiId === id);

        setProduktiID(produkti[0].produktiId);
        setemriProduktit(produkti[0].emriProduktit);
        setSasia(produkti[0].sasia);
        setQmimiBleres(produkti[0].qmimiBleres);
        setQmimiShites(produkti[0].qmimiShites);
    }

    function handleEdito(id) {
        if (produktiID === 0 ||
            sasia <= 0 ||
            qmimiShites <= 0 ||
            qmimiBleres <= 0) {
            setPershkrimiMesazhit("Ju lutem plotesoni te gjitha te dhenat!");
            setTipiMesazhit("danger");
            setShfaqMesazhin(true);
        } else {
            const eReja = produktetNeKalkulim.filter((item) => item.produktiId !== id);

            const produkti = {
                emriProduktit: emriProduktit,
                produktiId: produktiID,
                sasia: sasia,
                qmimiBleres: qmimiBleres,
                qmimiShites: qmimiShites,
            };
            setproduktetNeKalkulim([...eReja, produkti]);
            updateTotals([...eReja, produkti]);

            setProduktiID(0);
            setQmimiBleres("");
            setSasia("");
            setQmimiShites("");
            setSasiaNeStok(0);
            setQmimiB(0);
            setQmimiSH(0);
            setEdito(false);
        }
    }



    return (
        <div className={classes.containerDashboardP}>
            {shfaqMesazhin && <Mesazhi
                setShfaqMesazhin={setShfaqMesazhin}
                pershkrimi={pershkrimiMesazhit}
                tipi={tipiMesazhit}
            />}
            {konfirmoMbylljenFatures &&
                <Modal show={konfirmoMbylljenFatures} onHide={() => setKonfirmoMbylljenFatures(false)}>
                    <Modal.Header closeButton>
                        <Modal.Title as="h6">Konfirmo Mbylljen e Fatures</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <strong style={{ fontSize: "10pt" }}>
                            A jeni te sigurt qe deshironi ta mbyllni Faturen?
                        </strong>
                    </Modal.Body>
                    <Modal.Footer>
                        <Button
                            variant="secondary"
                            onClick={() => setKonfirmoMbylljenFatures(false)}
                        >
                            Edito Faturen <FontAwesomeIcon icon={faPenToSquare} />
                        </Button>
                        <Button
                            variant="warning"
                            onClick={handleMbyllFature}
                        >
                            Konfirmo <FontAwesomeIcon icon={faPlus} />
                        </Button>
                    </Modal.Footer>
                </Modal>
            }
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
                    onClick={() => setKonfirmoMbylljenFatures(true)}
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
                                        disabled={edito}
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
                                            setSasia(e.target.value);
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
                                            setQmimiBleres(e.target.value);
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
                                            setQmimiShites(e.target.value);
                                        }}
                                    />
                                </Form.Group>
                                <br />
                                <div style={{ display: "flex", gap: "0.3em" }}>
                                    <Button variant="success" type="submit" disabled={edito}>
                                        Shto Produktin <FontAwesomeIcon icon={faPlus} />
                                    </Button>
                                    {edito &&
                                        <Button variant="warning" onClick={() => handleEdito(produktiID)}>
                                            Edito Produktin <FontAwesomeIcon icon={faPenToSquare} />
                                        </Button>}
                                </div>
                            </Form>
                        </Col>
                        <Col>
                            <p><strong>Qmimi Bleres:</strong> {parseFloat(qmimiB).toFixed(2)} €</p>
                            <p><strong>Qmimi Shites:</strong> {parseFloat(qmimiSH).toFixed(2)} €</p>
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
                                <th>Funksione</th>
                            </tr>
                        </thead>
                        <tbody>
                            {produktetNeKalkulim.map((produkti, index) => (
                                <tr key={index}>
                                    <td>{index + 1}</td>
                                    <td>{produkti.emriProduktit}</td>
                                    <td>{produkti.sasia}</td>
                                    <td>{parseFloat(produkti.qmimiBleres).toFixed(2)} €</td>
                                    <td>{parseFloat(produkti.qmimiShites).toFixed(2)} €</td>
                                    <td>{(produkti.sasia * produkti.qmimiBleres).toFixed(2)} €</td>
                                    <td>{(produkti.sasia * produkti.qmimiShites).toFixed(2)} €</td>
                                    <td>
                                        <div style={{ display: "flex", gap: "0.3em" }}>
                                            <Button size="sm" variant="danger" onClick={() => handleFshij(produkti.produktiId)}><FontAwesomeIcon icon={faXmark} /></Button>
                                            <Button size="sm" variant="warning" onClick={() => handleEdit(produkti.produktiId)}><FontAwesomeIcon icon={faPenToSquare} /></Button>
                                        </div>
                                    </td>
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

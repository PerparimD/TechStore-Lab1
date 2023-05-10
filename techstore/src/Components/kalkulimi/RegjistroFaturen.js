import { useEffect, useState } from "react";
import classes from '../kodiZbritjes/Styles/TabelaEKompanive.module.css';
import axios from "axios";
import Button from "react-bootstrap/Button";
import Mesazhi from "../layout/Mesazhi";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBan, faPenToSquare, faPlus } from '@fortawesome/free-solid-svg-icons'
import EditoKompanin from "../kodiZbritjes/EditoKodin";
import LargoKompanin from "../kodiZbritjes/FshijKodin";
import { TailSpin } from 'react-loader-spinner';
import ShtoKodin from "../kodiZbritjes/ShtoKodin";
import { Table, Form, Container, Row, Col } from 'react-bootstrap';

function RegjistroFaturen(props) {
    const [kodetEZbritjeve, setKodetEZbritjeve] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [shto, setShto] = useState(false);
    const [edito, setEdito] = useState(false);
    const [fshij, setFshij] = useState(false);
    const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
    const [tipiMesazhit, setTipiMesazhit] = useState("");
    const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");
    const [id, setId] = useState(0);
    const [loading, setLoading] = useState(false);
    const [produktetNeKalkulim, setproduktetNeKalkulim] = useState([]);
    const [name, setName] = useState('');
    const [address, setAddress] = useState(0);
    const [produktet, setProduktet] = useState([]);
    const [sasia, setSasia] = useState("");
    const [qmimiBleres, setQmimiBleres] = useState("");
    const [qmimiShites, setQmimiShites] = useState("");
    const [totProdkteve, setTotProdkteve] = useState(0);
    const [totFatures, setTotFatures] = useState(0);
    const [sasiaNeStok, setSasiaNeStok] = useState(0);

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

    useEffect(() => {
        const shfaqKompanit = async () => {
            try {
                setLoading(true);
                const kodi = await axios.get("https://localhost:7285/api/KodiZbritje/shfaqKodet");
                setKodetEZbritjeve(kodi.data);
                setLoading(false);
            } catch (err) {
                console.log(err);
                setLoading(false);
            }
        };

        shfaqKompanit();
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

    const handleSubmit = (event) => {
        event.preventDefault();
        const produkti = {
            emriProduktit: name,
            produktiId: address,
            sasia: sasia,
            qmimiBleres: qmimiBleres,
            qmimiShites: qmimiShites,
        };
        setproduktetNeKalkulim([...produktetNeKalkulim, produkti]);
        updateTotals([...produktetNeKalkulim, produkti]);

        setAddress(0);
        setQmimiBleres("");
        setSasia("");
        setQmimiShites("");
        setSasiaNeStok(0);
    };

    const handleProduktiChange = (value, text, sasia) => {
        setAddress(value);
        setName(text);
        setSasiaNeStok(sasia);
    };

    const updateTotals = (newproduktetNeKalkulim) => {
        let totalProdkteve = 0;
        let totalFatures = 0;
        newproduktetNeKalkulim.forEach((produkti, index) => {
            totalProdkteve += 1;
            totalFatures += produkti.qmimiBleres * produkti.qmimiShites;
        });
        setTotProdkteve(totalProdkteve);
        setTotFatures(totalFatures);
    };

    const handleSave = () => {
        handleMbyllFature();
        props.setMbyllFaturen();
    }

    const ndrroField = (e, tjetra) => {
        if (e.key === 'Enter') {
            e.preventDefault();
            document.getElementById(tjetra).focus();
        }
    }

    async function handleMbyllFature() {
        try {
            for (let produkti of produktetNeKalkulim) {
                await axios.post('https://localhost:7285/api/RegjistrimiStokut/ruajKalkulimin/teDhenat', {
                    idRegjistrimit: 1,
                    idProduktit: produkti.produktiId,
                    sasiaStokut: produkti.sasia,
                    shumaTotale: produkti.qmimiShites * produkti.qmimiBleres,
                    qmimiBleres: produkti.qmimiBleres,
                    qmimiShites: produkti.qmimiShites,
                }).then((response) => {
                    console.log(response);
                });
                await axios.put(`https://localhost:7285/api/RegjistrimiStokut/ruajKalkulimin/perditesoStokunQmimin?id=${produkti.produktiId}`,{
                    produktiId: produkti.produktiId,
                    qmimiBleres: produkti.qmimiBleres,
                    qmimiProduktit: produkti.qmimiShites,
                    sasiaNeStok: produkti.sasia
                }).then((response) => {
                    console.log(response);
                });
            }
        } catch (error) {
            console.error(error);
        }
    }
    

    return (
        <div className={classes.containerDashboardP}>
            {shto && <ShtoKodin
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
                                        value={address ? address : 0}
                                        onChange={(e) =>
                                            handleProduktiChange(e.target.value,
                                                e.target.options[e.target.selectedIndex].text,
                                                e.target.options[e.target.selectedIndex].getAttribute('sasiaNeStok')
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
                                                    sasiaNeStok={item.sasiaNeStok}>
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

                                <Button variant="primary" type="submit">
                                    Add produkti
                                </Button>


                            </Form>
                        </Col>
                        <Col>
                            <p>Sasia aktuale ne Stok: {sasiaNeStok}</p>
                        </Col>
                        <Col>
                            <h4>Totali Produkteve: {totProdkteve}</h4>
                            <h4>Totali Fatures: {totFatures.toFixed(2)} €</h4>
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
                                <th>Totali</th>
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
                                    <td>{(produkti.qmimiBleres * produkti.qmimiShites).toFixed(2)} €</td>
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

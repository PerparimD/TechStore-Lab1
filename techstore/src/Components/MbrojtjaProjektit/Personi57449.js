import { useEffect, useState } from "react";
import classes from '../produktet/kategorit/Styles/TabelaEKategorive.module.css';
import axios from "axios";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBan, faPenToSquare, faPlus, faClose, faXmark } from '@fortawesome/free-solid-svg-icons';
import { useNavigate } from "react-router-dom";
import { Table, Button, Modal, Form } from "react-bootstrap";

function Personi57449() {
    const [klientet, setKlientet] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [shto, setShto] = useState(false);
    const [edito, setEdito] = useState(false);
    const [fshij, setFshij] = useState(false);
    const [id, setId] = useState(0);

    const navigate = useNavigate();

    useEffect(() => {
        const shfaqklientet = async () => {
            try {
                const klientet = await axios.get("https://localhost:7285/api/Personi57449/ShfaqKlientet");
                setKlientet(klientet.data);
            } catch (err) {
                console.log(err);
            }
        };

        shfaqklientet();
    }, [perditeso]);

    // SHTO
    const [bankat, setBankat] = useState([]);

    useEffect(() => {
        const shfaqBankat = async () => {
            try {
                const bankat = await axios.get("https://localhost:7285/api/Banka57449/ShfaqBankat");
                setBankat(bankat.data);
            } catch (err) {
                console.log(err);
            }
        };

        shfaqBankat();
    }, [perditeso]);

    const [emriK, setEmriK] = useState("");
    const [mbiemriK, setMbiemriK] = useState("");
    const [bankaK, setBankaK] = useState("");

    const handleEmriKChange = (value) => {
        setEmriK(value);
    };
    const handleMbiemriKChange = (value) => {
        setMbiemriK(value);
    };
    const handleBankaKChange = (value) => {
        setBankaK(value);
    };
    // SHTO

    // Edito
    const [klienti, setKlienti] = useState([]);

    const handleEmriKlientit = (value) => {
        setKlienti((prev) => ({ ...prev, emri57449: value }));
    };

    const handleMbiemriKlientit = (value) => {
        setKlienti((prev) => ({ ...prev, mbiemri57449: value }));
    };
    const handleBankaKlientit = (value) => {
        setKlienti((prev) => ({ ...prev, banka57449ID: value }));
    };

    useEffect(() => {
        const vendosTeDhenat = async () => {
            try {
                const teDhenatKlientit = await axios.get(`https://localhost:7285/api/Personi57449/ShfaqKlientinNgaID?idPersoni=${id}`)
                setKlienti(teDhenatKlientit.data);
            } catch (e) {
                console.error(e);
            }

        }

        vendosTeDhenat();
    }, [edito])
    // Edito

    const handleShow = () => setShto(true);

    const handleEdito = (id) => {
        setEdito(true)
        setId(id)
    };

    const handleFshij = (id) => {
        setFshij(true)
        setId(id)
    };

    const handleShtoKlientin = async () => {
        await axios.post("https://localhost:7285/api/Personi57449/ShtoKlientin", {
            emri57449: emriK,
            mbiemri57449: mbiemriK,
            banka57449ID: bankaK,
        })
            .then(() => {
                setShto(false);
                setPerditeso(Date.now());
            })
            .catch((e) => {
                console.error(e)
            })
    }

    const handlePerditesoKlientin = async () => {
        await axios.put(`https://localhost:7285/api/Personi57449/PerditesoKlientin?idPersoni=${id}`, klienti)
            .then(() => {
                setEdito(false);
                setPerditeso(Date.now());
            })
            .catch((e) => {
                console.error(e)
            })
    }

    const handleFshijKlientin = async () => {
        await axios.delete(`https://localhost:7285/api/Personi57449/FshijKlientin?idPersoni=${id}`)
            .then(() => {
                setFshij(false);
                setPerditeso(Date.now());
            })
            .catch((e) => {
                console.error(e)
            })
    }

    return (
        <div className={classes.containerDashboardP}>
            {shto && <Modal className="modalEditShto" show={shto} onHide={() => setShto(false)}>
                <Modal.Header closeButton>
                    <Modal.Title>Shto Klientin</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Emri Klientit</Form.Label>
                            <Form.Control
                                onChange={(e) => handleEmriKChange(e.target.value)}
                                value={emriK}
                                type="text"
                                placeholder="Emri Klientit"
                                autoFocus
                            />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Mbiemri Klientit</Form.Label>
                            <Form.Control
                                onChange={(e) => handleMbiemriKChange(e.target.value)}
                                value={mbiemriK}
                                type="text"
                                placeholder="Mbiemri i Klientit"
                                autoFocus
                            />
                        </Form.Group>
                        <Form.Group
                            className="mb-3"
                            controlId="exampleForm.ControlTextarea1"
                        >
                            <Form.Label>Banka</Form.Label>
                            <select
                                placeholder="Kompania e Produktit"
                                className="form-select"
                                value={bankaK}
                                onChange={(e) => handleBankaKChange(e.target.value)}
                            >
                                <option defaultValue disabled value="">
                                    Banka e Klientit
                                </option>
                                {bankat.map((item) => {
                                    return (
                                        <option key={item.id57449} value={item.id57449}>{item.emri57449}</option>
                                    );
                                })}
                            </select>
                        </Form.Group>
                    </Form>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => setShto(false)}>
                        Anulo <FontAwesomeIcon icon={faXmark} />
                    </Button>
                    <Button
                        style={{ backgroundColor: "#009879", border: "none" }}
                        onClick={handleShtoKlientin}
                    >
                        Shto Klientin
                    </Button>
                </Modal.Footer>
            </Modal>}
            {edito && <Modal className="modalEditShto" show={edito} onHide={() => setEdito(false)}>
                <Modal.Header closeButton>
                    <Modal.Title>Edito Klientin</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>ID Klientit</Form.Label>
                            <Form.Control
                                type="text"
                                value={klienti.id57449}
                                disabled
                            />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Emri Klientit</Form.Label>
                            <Form.Control
                                onChange={(e) => handleEmriKlientit(e.target.value)}
                                value={klienti.emri57449}
                                type="text"
                                placeholder="Emri Klientit"
                                autoFocus
                            />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Mbiemri Klientit</Form.Label>
                            <Form.Control
                                onChange={(e) => handleMbiemriKlientit(e.target.value)}
                                value={klienti.mbiemri57449}
                                type="text"
                                placeholder="Mbiemri Klientit"
                                autoFocus
                            />
                        </Form.Group>
                        <Form.Group>
                            <Form.Label>Banka Klientit</Form.Label>
                            <select
                                placeholder="Banka Klientit"
                                className="form-select"
                                value={klienti.banka57449ID}
                                onChange={(e) => handleBankaKlientit(e.target.value)}
                            >
                                <option selected disabled hidden>
                                    {klienti.banka57449 && klienti.banka57449.emri57449}
                                </option>
                                {bankat.map((item) => {
                                    return (
                                        <option key={item.id57449} value={item.id57449}>
                                            {item.emri57449}
                                        </option>
                                    );
                                })}
                            </select>
                        </Form.Group>
                    </Form>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => setEdito(false)}>
                        Anulo <FontAwesomeIcon icon={faXmark} />
                    </Button>
                    <Button
                        style={{ backgroundColor: "#009879", border: "none" }}
                        onClick={handlePerditesoKlientin}
                    >
                        Edito Klientin <FontAwesomeIcon icon={faPenToSquare} />
                    </Button>
                </Modal.Footer>
            </Modal>}
            {fshij && <Modal show={fshij} onHide={() => setFshij(false)}>
                <Modal.Header closeButton>
                    <Modal.Title style={{ color: "red" }}>Largo Klientin</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <h6 >A jeni te sigurt qe deshironi ta fshini kete Klient?</h6>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => setFshij(false)}>
                        Anulo <FontAwesomeIcon icon={faXmark} />
                    </Button>
                    <Button
                        variant="danger"
                        onClick={handleFshijKlientin}
                    >
                        Largo Klientin <FontAwesomeIcon icon={faBan} />
                    </Button>
                </Modal.Footer>
            </Modal>}
            <>
                <h1 className="title">
                    Lista e Klienteve
                </h1>
                <Button
                    className="mb-3 Butoni"
                    onClick={handleShow}
                >
                    Shto Klientin <FontAwesomeIcon icon={faPlus} />
                </Button>


                <Table>
                    <thead>
                        <tr>
                            <th>ID Klientit</th>
                            <th>Emri Klientit</th>
                            <th>Mbiemri Klientit</th>
                            <th>Banka Klientit</th>
                            <th>Funksione</th>
                        </tr>
                    </thead>
                    <tbody>
                        {klientet.map((k) => (
                            <tr key={k.id57449}>
                                <td>{k.id57449}</td>
                                <td>{k.emri57449}</td>
                                <td>{k.mbiemri57449}</td>
                                <td>{k.banka57449 && k.banka57449.emri57449}</td>
                                <td >
                                    <Button style={{ marginRight: "0.5em" }} variant="success" onClick={() => handleEdito(k.id57449)}><FontAwesomeIcon icon={faPenToSquare} /></Button>
                                    <Button variant="danger" onClick={() => handleFshij(k.id57449)}><FontAwesomeIcon icon={faBan} /></Button>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </Table>
            </>
        </div >
    );
}

export default Personi57449
import { useEffect, useState } from "react";
import classes from '../produktet/kategorit/Styles/TabelaEKategorive.module.css';
import axios from "axios";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBan, faPenToSquare, faPlus, faClose, faXmark } from '@fortawesome/free-solid-svg-icons';
import { useNavigate } from "react-router-dom";
import { Table, Button, Modal, Form } from "react-bootstrap";

function Banka57449() {
    const [bankat, setBankat] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [shto, setShto] = useState(false);
    const [edito, setEdito] = useState(false);
    const [fshij, setFshij] = useState(false);
    const [id, setId] = useState(0);

    const navigate = useNavigate();

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

    // SHTO
    const [emriP, setEmriP] = useState("");
    const handleEmriPChange = (value) => {
        setEmriP(value);
    };
    // SHTO

    // Edito
    const [banka, setBanka] = useState([]);

    const handleEmriBankes = (value) => {
        setBanka((prev) => ({ ...prev, emri57449: value }));
    };

    useEffect(() => {
        const vendosTeDhenat = async () => {
            try {
                const teDhenatBankes = await axios.get(`https://localhost:7285/api/Banka57449/ShfaqBankenNgaID?idBanka=${id}`)
                setBanka(teDhenatBankes.data);
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

    const handleShtoBanken = async () => {
        await axios.post("https://localhost:7285/api/Banka57449/ShtoBanken", { emri57449: emriP })
            .then(() => {
                setShto(false);
                setPerditeso(Date.now());
            })
            .catch((e) => {
                console.error(e)
            })
    }

    const handlePerditesoBanken = async () => {
        await axios.put(`https://localhost:7285/api/Banka57449/PerditesoBanken?idBanka=${id}`, banka)
            .then(() => {
                setEdito(false);
                setPerditeso(Date.now());
            })
            .catch((e) => {
                console.error(e)
            })
    }

    const handleFshijBanken = async () => {
        await axios.delete(`https://localhost:7285/api/Banka57449/FshijBanken?idBanka=${id}`)
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
                    <Modal.Title>Shto Banken</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Emri Bankes<span style={{ color: "red" }}>*</span></Form.Label>
                            <Form.Control
                                onChange={(e) => handleEmriPChange(e.target.value)}
                                value={emriP}
                                type="text"
                                placeholder="Emri Bankes"
                                autoFocus
                            />
                        </Form.Group>
                    </Form>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => setShto(false)}>
                        Close <FontAwesomeIcon icon={faXmark} />
                    </Button>
                    <Button
                        style={{ backgroundColor: "#009879", border: "none" }}
                        onClick={handleShtoBanken}
                    >
                        Save Changes
                    </Button>
                </Modal.Footer>
            </Modal>}
            {edito && <Modal className="modalEditShto" show={edito} onHide={() => setEdito(false)}>
                <Modal.Header closeButton>
                    <Modal.Title>Edito Banken</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>ID Bankes</Form.Label>
                            <Form.Control
                                type="text"
                                value={banka.id57449}
                                disabled
                            />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Emri Bankes</Form.Label>
                            <Form.Control
                                onChange={(e) => handleEmriBankes(e.target.value)}
                                value={banka.emri57449}
                                type="text"
                                placeholder="Emri Bankes"
                                autoFocus
                            />
                        </Form.Group>
                    </Form>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => setEdito(false)}>
                        Anulo <FontAwesomeIcon icon={faXmark} />
                    </Button>
                    <Button
                        style={{ backgroundColor: "#009879", border: "none" }}
                        onClick={handlePerditesoBanken}
                    >
                        Edito Banken <FontAwesomeIcon icon={faPenToSquare} />
                    </Button>
                </Modal.Footer>
            </Modal>}
            {fshij && <Modal show={fshij} onHide={() => setFshij(false)}>
                <Modal.Header closeButton>
                    <Modal.Title style={{ color: "red" }}>Largo Banken</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <h6 >A jeni te sigurt qe deshironi ta fshini kete Banke?</h6>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => setFshij(false)}>
                        Anulo <FontAwesomeIcon icon={faXmark} />
                    </Button>
                    <Button
                        variant="danger"
                        onClick={handleFshijBanken}
                    >
                        Largo Banken <FontAwesomeIcon icon={faBan} />
                    </Button>
                </Modal.Footer>
            </Modal>}
            <>
                <h1 className="title">
                    Lista e Bankave
                </h1>
                <Button
                    className="mb-3 Butoni"
                    onClick={handleShow}
                >
                    Shto Banken <FontAwesomeIcon icon={faPlus} />
                </Button>


                <Table>
                    <thead>
                        <tr>
                            <th>ID Bankes</th>
                            <th>Emri Bankes</th>
                            <th>Funksione</th>
                        </tr>
                    </thead>
                    <tbody>
                        {bankat.map((k) => (
                            <tr key={k.id57449}>
                                <td>{k.id57449}</td>
                                <td>{k.emri57449}</td>
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

export default Banka57449
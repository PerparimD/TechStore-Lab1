import { useEffect, useState } from "react";
import classes from '../produktet/kategorit/Styles/TabelaEKategorive.module.css';
import axios from "axios";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBan, faPenToSquare, faPlus, faClose, faXmark } from '@fortawesome/free-solid-svg-icons';
import { useNavigate } from "react-router-dom";
import { Table, Button, Modal, Form } from "react-bootstrap";

function Satellite212257449() {
    const [satelitet, setSatelitet] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [shto, setShto] = useState(false);
    const [edito, setEdito] = useState(false);
    const [fshij, setFshij] = useState(false);
    const [id, setId] = useState(0);

    const navigate = useNavigate();

    useEffect(() => {
        const shfaqSatelitet = async () => {
            try {
                const satelitet = await axios.get("https://localhost:7285/api/Satellite212257449/ShfaqSatelitet");
                setSatelitet(satelitet.data);
            } catch (err) {
                console.log(err);
            }
        };

        shfaqSatelitet();
    }, [perditeso]);

    // SHTO
    const [planetet, setPlanetet] = useState([]);

    useEffect(() => {
        const shfaqPlanetet = async () => {
            try {
                const planetet = await axios.get("https://localhost:7285/api/Planet212257449/ShfaqPlanetet");
                setPlanetet(planetet.data);
            } catch (err) {
                console.log(err);
            }
        };

        shfaqPlanetet();
    }, [perditeso]);

    const [name, setName] = useState("");
    const [planet, setPlanet] = useState("");

    const handleNameChange = (value) => {
        setName(value);
    };
    const handlePlanetiChange = (value) => {
        setPlanet(value);
    };
    // SHTO

    // Edito
    const [sateliti, setSateliti] = useState([]);

    const handleName = (value) => {
        setSateliti((prev) => ({ ...prev, name: value }));
    };

    const handlePlaneti = (value) => {
        setSateliti((prev) => ({ ...prev, planetId: value }));
    };

    useEffect(() => {
        const vendosTeDhenat = async () => {
            try {
                const teDhenatSatelitit = await axios.get(`https://localhost:7285/api/Satellite212257449/ShfaqSatelitinNgaID?SatelitiId=${id}`)
                setSateliti(teDhenatSatelitit.data);
            } catch (e) {
                console.error(e);
            }

        }

        vendosTeDhenat();
    }, [edito])
    // Edito

    const handleShow = () => {
        setShto(true);
        setPerditeso(Date.now());
    }

    const handleEdito = (id) => {
        setEdito(true)
        setId(id)
    };

    const handleFshij = (id) => {
        setFshij(true)
        setId(id)
    };

    const handleShtoSatelitin = async () => {
        await axios.post("https://localhost:7285/api/Satellite212257449/ShtoSatelitin", {
            name: name,
            planetId: planet,
        })
            .then(() => {
                setShto(false);
                setPerditeso(Date.now());
                setName("");
                setPlanet("");
            })
            .catch((e) => {
                console.error(e)
            })
    }

    const handlePerditesoSatelitin = async () => {
        await axios.put(`https://localhost:7285/api/Satellite212257449/PerditesoSatelitin?SatelitiId=${id}`, sateliti)
            .then(() => {
                setEdito(false);
                setPerditeso(Date.now());
            })
            .catch((e) => {
                console.error(e)
            })
    }

    const handleFshijsatelitin = async () => {
        await axios.delete(`https://localhost:7285/api/Satellite212257449/FshijSatelitin?SatelitiId=${id}`)
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
                    <Modal.Title>Shto Satelitin</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Emri Satelitit</Form.Label>
                            <Form.Control
                                onChange={(e) => handleNameChange(e.target.value)}
                                value={name}
                                type="text"
                                placeholder="Emri satelitit"
                                autoFocus
                            />
                        </Form.Group>
                        <Form.Group
                            className="mb-3"
                            controlId="exampleForm.ControlTextarea1"
                        >
                            <Form.Label>Planeti</Form.Label>
                            <select
                                placeholder="Kompania e Produktit"
                                className="form-select"
                                value={planet}
                                onChange={(e) => handlePlanetiChange(e.target.value)}
                            >
                                <option defaultValue disabled value="">
                                    Planeti
                                </option>
                                {planetet.map((item) => {
                                    return (
                                        <option key={item.planetId} value={item.planetId}>{item.name}</option>
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
                        onClick={handleShtoSatelitin}
                    >
                        Shto Satelitin
                    </Button>
                </Modal.Footer>
            </Modal>}
            {edito && <Modal className="modalEditShto" show={edito} onHide={() => setEdito(false)}>
                <Modal.Header closeButton>
                    <Modal.Title>Edito Satelitin</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>ID Satelitit</Form.Label>
                            <Form.Control
                                type="text"
                                value={sateliti.satelliteId}
                                disabled
                            />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Emri Satelitit</Form.Label>
                            <Form.Control
                                onChange={(e) => handleName(e.target.value)}
                                value={sateliti.name}
                                type="text"
                                placeholder="Emri Satelitit"
                                autoFocus
                            />
                        </Form.Group>
                        <Form.Group>
                            <Form.Label>Planeti</Form.Label>
                            <select
                                placeholder="Planeti"
                                className="form-select"
                                value={sateliti.planetId}
                                onChange={(e) => handlePlaneti(e.target.value)}
                            >
                                <option selected disabled hidden>
                                    {sateliti.planet && sateliti.planet.name}
                                </option>
                                {planetet.map((item) => {
                                    return (
                                        <option key={item.planetId} value={item.planetId}>
                                            {item.name}
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
                        onClick={handlePerditesoSatelitin}
                    >
                        Edito Satelitin <FontAwesomeIcon icon={faPenToSquare} />
                    </Button>
                </Modal.Footer>
            </Modal>}
            {fshij && <Modal show={fshij} onHide={() => setFshij(false)}>
                <Modal.Header closeButton>
                    <Modal.Title style={{ color: "red" }}>Largo Satelitin</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <h6 >A jeni te sigurt qe deshironi ta fshini kete Satelit?</h6>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => setFshij(false)}>
                        Anulo <FontAwesomeIcon icon={faXmark} />
                    </Button>
                    <Button
                        variant="danger"
                        onClick={handleFshijsatelitin}
                    >
                        Largo Satelitin <FontAwesomeIcon icon={faBan} />
                    </Button>
                </Modal.Footer>
            </Modal>}
            <>
                <h1 className="title">
                    Lista e Sateliteve
                </h1>
                <Button
                    className="mb-3 Butoni"
                    onClick={handleShow}
                >
                    Shto Satelitin <FontAwesomeIcon icon={faPlus} />
                </Button>


                <Table>
                    <thead>
                        <tr>
                            <th>ID Satelitit</th>
                            <th>Emri Satelitit</th>
                            <th>Planeti</th>
                            <th>Funksione</th>
                        </tr>
                    </thead>
                    <tbody>
                        {satelitet.map((k) => (
                            <tr key={k.satelliteId}>
                                <td>{k.satelliteId}</td>
                                <td>{k.name}</td>
                                <td>{k.planet && k.planet.name}</td>
                                <td >
                                    <Button style={{ marginRight: "0.5em" }} variant="success" onClick={() => handleEdito(k.satelliteId)}><FontAwesomeIcon icon={faPenToSquare} /></Button>
                                    <Button variant="danger" onClick={() => handleFshij(k.satelliteId)}><FontAwesomeIcon icon={faBan} /></Button>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </Table>
            </>
        </div >
    );
}

export default Satellite212257449
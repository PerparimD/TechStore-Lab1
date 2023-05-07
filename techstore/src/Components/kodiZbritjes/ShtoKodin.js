import { useState, useEffect } from "react";
import axios from "axios";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlus, faXmark } from '@fortawesome/free-solid-svg-icons';
import { Row, Col, Form, Button } from 'react-bootstrap';

function gjeneroKodinAutomatik() {
    const karakteret = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    const gjatesia = 6;
    let kodi = '';

    for (let i = 0; i < gjatesia; i++) {
        kodi += karakteret[Math.floor(Math.random() * karakteret.length)];
    }

    return kodi;
}

function ShtoKodin(props) {
    const [kodi, setKodi] = useState("");
    const [qmimi, setQmimi] = useState(0.01);
    const [produkti, setProdukti] = useState(null);
    const [produktet, setProduktet] = useState([]);
    const [perditeso, setPerditeso] = useState("");

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
    const handleKodiChange = (value) => {
        setKodi(value);
    };

    const handleProduktiChange = (value) => {
        value !== "0" ? setProdukti(value) : setProdukti(null);
    };
    const handleQmimiChange = (value) => {
        setQmimi(value);
    };

    const handleGjeneroKodin = () => {
        setKodi(gjeneroKodinAutomatik());
    }

    function handleSubmit() {
        axios.post('https://localhost:7285/api/KodiZbritje/shtoKodin', {
            kodi: kodi,
            qmimiZbritjes: qmimi,
            idProdukti: produkti
        })
            .then((response) => {
                console.log(response);
                props.setTipiMesazhit("success");
                props.setPershkrimiMesazhit("Kodi i zbritjes u krijua!")
                props.perditesoTeDhenat();
                props.largo();
                props.shfaqmesazhin();
            })
            .catch((error) => {
                console.log(error);
            });

    }
    return (
        <Modal className="modalEditShto" show={props.shfaq} onHide={() => props.largo()}>
            <Modal.Header closeButton>
                <Modal.Title>Krijoni Kodin e Zbritjes</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form>
                    <Row>
                        <Row>
                            <Form.Label>Kodi i Zbritjes</Form.Label>
                        </Row>
                        <Col xs={7}>
                            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                                <Form.Control
                                    onChange={(e) => handleKodiChange(e.target.value)}
                                    value={kodi}
                                    type="text"
                                    placeholder="Kodi i Zbritjes"
                                    autoFocus
                                    required
                                />
                            </Form.Group>
                        </Col>
                        <Col xs={5}>
                            <Button
                                className="Butoni"
                                onClick={handleGjeneroKodin}
                            >
                                Gjenero Kodin <FontAwesomeIcon icon={faPlus} />
                            </Button>
                        </Col>
                    </Row>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Qmimi Zbritjes</Form.Label>
                        <Form.Control
                            onChange={(e) => handleQmimiChange(e.target.value)}
                            value={qmimi}
                            type="number"
                            min={0.01}
                            placeholder="Qmimi Zbritjes"
                            required
                        />
                    </Form.Group>
                    <Form.Group
                        className="mb-3"
                        controlId="exampleForm.ControlTextarea1"
                    >
                        <Form.Label>Vlen per</Form.Label>
                        <select
                            placeholder="Produkti"
                            className="form-select"
                            value={produkti}
                            onChange={(e) => handleProduktiChange(e.target.value)}
                        >
                            <option defaultValue value={0} key={0}>
                                Vlene per te gjitha produktet
                            </option>
                            {produktet.map((item) => {
                                return (
                                    <option key={item.produktiId} value={item.produktiId}>{item.emriProduktit}</option>
                                );
                            })}
                        </select>
                    </Form.Group>
                </Form>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={() => props.largo()}>
                    Anulo <FontAwesomeIcon icon={faXmark} />
                </Button>
                <Button
                    className="Butoni"
                    onClick={handleSubmit}
                >
                    Shto Kodin <FontAwesomeIcon icon={faPlus} />
                </Button>
            </Modal.Footer>
        </Modal>
    )
}

export default ShtoKodin;
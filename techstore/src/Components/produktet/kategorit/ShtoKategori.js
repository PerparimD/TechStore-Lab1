import { useState, useRef } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlus, faXmark } from '@fortawesome/free-solid-svg-icons';

function ShtoKompanit(props) {
    const [llojiKategoris, setLlojiKategoris] = useState("");
    const [pershkrimiKategoris, setPershkrimiKategoris] = useState("");

    const getToken = localStorage.getItem("token");

    const authentikimi = {
        headers: {
            Authorization: `Bearer ${getToken}`,
        },
    };

    const handleEmriChange = (value) => {
        setLlojiKategoris(value);
    };

    const handlePershkrimiChange = (value) => {
        setPershkrimiKategoris(value);
    };

    function handleSubmit() {
        axios.post('https://localhost:7285/api/Kategoria/shtoKategorin', {
            llojiKategoris: llojiKategoris,
            pershkrimiKategoris: pershkrimiKategoris
        }, authentikimi)
            .then((response) => {
                
                props.setTipiMesazhit("success");
                props.setPershkrimiMesazhit("Kategoria u insertua me sukses!")
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
                <Modal.Title>Shto Kategorine</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Lloji Kategoris</Form.Label>
                        <Form.Control
                            onChange={(e) => handleEmriChange(e.target.value)}
                            value={llojiKategoris}
                            type="text"
                            placeholder="Lloji Kategoris"
                            autoFocus
                        />
                    </Form.Group>
                    <Form.Group
                        className="mb-3"
                        controlId="exampleForm.ControlTextarea1"
                    >
                        <Form.Label>Pershkrimi Kategoris</Form.Label>
                        <Form.Control
                            onChange={(e) => handlePershkrimiChange(e.target.value)}
                            value={pershkrimiKategoris}
                            type="text"
                            placeholder="Pershkrimi Kategoris"
                            autoFocus
                        />
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
                    Shto Kategorine <FontAwesomeIcon icon={faPlus} />
                </Button>
            </Modal.Footer>
        </Modal>
    )
}

export default ShtoKompanit;
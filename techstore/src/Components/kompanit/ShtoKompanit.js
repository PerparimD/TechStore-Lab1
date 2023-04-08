import { useState, useRef } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";

function ShtoKompanit(props) {
    const foto = useRef(null);
    const [emri, setEmri] = useState("");
    const [adresa, setAdresa] = useState("");
    const [fotoFull, setFotoFull] = useState("");

    const handleEmriChange = (value) => {
        setEmri(value);
    };

    const handleAdresaChange = (value) => {
        setAdresa(value);
    };
    const handleFotoChange = () => {
        const filePath = foto.current.value;
        const fileName = filePath.split('\\').pop();
        setFotoFull(fileName);
    };

    function handleSubmit() {
        const logo = fotoFull;

        axios.post('https://localhost:7285/api/Kompania/shtoKompanin', {
            emriKompanis: emri,
            logo: logo,
            adresa: adresa
        })
            .then((response) => {
                console.log(response);
                props.setTipiMesazhit("success");
                props.setPershkrimiMesazhit("Kompania u insertua me sukses!")
                props.perditesoTeDhenat();
                props.largo();
                props.shfaqmesazhin();
            })
            .catch((error) => {
                console.log(error);
            });

    }
    return (
        <Modal className="modal" show={props.shfaq} onHide={() => props.largo()}>
            <Modal.Header closeButton>
                <Modal.Title>Shto Kompanin</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Emri Kompanis</Form.Label>
                        <Form.Control
                            onChange={(e) => handleEmriChange(e.target.value)}
                            value={emri}
                            type="text"
                            placeholder="Emri Kompanis"
                            autoFocus
                        />
                    </Form.Group>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Foto Kompanis</Form.Label>
                        <Form.Control
                            type="file"
                            placeholder="Foto e Kompanis"
                            ref={foto}
                            onChange={handleFotoChange}

                            autoFocus
                        />
                    </Form.Group>
                    <Form.Group
                        className="mb-3"
                        controlId="exampleForm.ControlTextarea1"
                    >
                        <Form.Label>Adresa Kompanis</Form.Label>
                        <Form.Control
                            onChange={(e) => handleAdresaChange(e.target.value)}
                            value={adresa}
                            type="text"
                            placeholder="Adresa Kompanis"
                            autoFocus
                        />
                    </Form.Group>
                </Form>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={() => props.largo()}>
                    Anulo
                </Button>
                <Button
                    style={{ backgroundColor: "#009879", border: "none" }}
                    onClick={handleSubmit}
                >
                    Shto Kompanin
                </Button>
            </Modal.Footer>
        </Modal>
    )
}

export default ShtoKompanit;
import { useState, useRef } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlus, faXmark } from '@fortawesome/free-solid-svg-icons';

function ShtoKompanit(props) {
    const [foto, setFoto] = useState(null);
    const [emri, setEmri] = useState("");
    const [adresa, setAdresa] = useState("");

    const handleEmriChange = (value) => {
        setEmri(value);
    };

    const handleAdresaChange = (value) => {
        setAdresa(value);
    };
    const handleFotoChange = (event) => {
        setFoto(event.target.files[0]);
    };

    async function handleSubmit() {
        if (foto) {
            const formData = new FormData();
            formData.append('foto', foto);

            try {
                await axios.post("https://localhost:7285/api/VendosFotot/ShtoKompanin", formData)
                    .then(async (response) => {
                        axios.post('https://localhost:7285/api/Kompania/shtoKompanin', {
                            emriKompanis: emri,
                            logo: response.data,
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
                    });
            } catch (error) {
                console.error(error);
            }

        } else {
            axios.post('https://localhost:7285/api/Kompania/shtoKompanin', {
                emriKompanis: emri,
                logo: "KompaniPaFoto.png",
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
    }
    return (
        <Modal className="modalEditShto" show={props.shfaq} onHide={() => props.largo()}>
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
                    Anulo <FontAwesomeIcon icon={faXmark} />
                </Button>
                <Button
                    className="Butoni"
                    onClick={handleSubmit}
                >
                    Shto Kompanin <FontAwesomeIcon icon={faPlus} />
                </Button>
            </Modal.Footer>
        </Modal>
    )
}

export default ShtoKompanit;
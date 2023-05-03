import { useState, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPenToSquare, faXmark } from '@fortawesome/free-solid-svg-icons';

function EditoPerdorues(props) {
    const [perdoruesi, setPerdoruesi] = useState([]);

    useEffect(() => {
        const shfaqKompanit = async () => {
            try {
                const user = await axios.get(`https://localhost:7285/api/Perdoruesi/shfaqSipasID?idUser=${props.id}`);
                setPerdoruesi(user.data);
                console.log(user)

            } catch (err) {
                console.log(err);
            }
        };

        shfaqKompanit();
    }, []);

    const handleEmriChange = (value) => {
        setPerdoruesi((prev) => ({ ...prev, emri: value }));
    };

    const handleMbiemriChange = (value) => {
        setPerdoruesi((prev) => ({ ...prev, mbiemri: value }));
    };

    const handleEmailChange = (value) => {
        setPerdoruesi((prev) => ({ ...prev, email: value }));
    };

    const handleAksesiChange = (value) => {
        setPerdoruesi((prev) => ({ ...prev, aksesi: value }));
        console.log(value);
        console.log(perdoruesi.aksesi)
    };

    function handleSubmit() {


        axios.put(`https://localhost:7285/api/Perdoruesi/perditesoPerdorues?id=${perdoruesi.userId}`, perdoruesi)
            .then(x => {
                console.log(x);
                props.setTipiMesazhit("success");
                props.setPershkrimiMesazhit("Perdoruesi u Perditesua me sukses!")
                props.perditesoTeDhenat();
                props.largo();
                props.shfaqmesazhin();
            })
            .catch(error => {
                console.error('Error saving perdoruesi:', error);
                props.setTipiMesazhit("danger");
                props.setPershkrimiMesazhit("Ndodhi nje gabim gjate perditesimit te perdoruesit!")
                props.perditesoTeDhenat();
                props.shfaqmesazhin();
            });

    }
    return (
        <Modal className="modalEditShto" show={true} onHide={() => props.largo()}>
            <Modal.Header closeButton>
                <Modal.Title>Edito Kompanin</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>ID - Username</Form.Label>
                        <Form.Control
                            value={perdoruesi.userId + " - " + perdoruesi.username}
                            disabled
                        />
                    </Form.Group>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Emri Perdoruesit</Form.Label>
                        <Form.Control
                            onChange={(e) => handleEmriChange(e.target.value)}
                            value={perdoruesi.emri}
                            type="text"
                            placeholder="Emri"
                            autoFocus
                        />
                    </Form.Group>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Mbiemri Perdoruesit</Form.Label>
                        <Form.Control
                            onChange={(e) => handleMbiemriChange(e.target.value)}
                            value={perdoruesi.mbiemri}
                            type="text"
                            placeholder="Mbiemri"
                            autoFocus
                        />
                    </Form.Group>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Email</Form.Label>
                        <Form.Control
                            onChange={(e) => handleEmailChange(e.target.value)}
                            value={perdoruesi.email}
                            type="text"
                            placeholder="Email"
                            autoFocus
                        />
                    </Form.Group>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Aksesi</Form.Label>
                        <Form.Control
                            onChange={(e) => handleAksesiChange(e.target.value)}
                            value={perdoruesi.aksesi}
                            type="Number"
                            min={0}
                            max={2}
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
                    Edito Perdoruesin <FontAwesomeIcon icon={faPenToSquare} />
                </Button>
            </Modal.Footer>
        </Modal>
    )
}

export default EditoPerdorues;
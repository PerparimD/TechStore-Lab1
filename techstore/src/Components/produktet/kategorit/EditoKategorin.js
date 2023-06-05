import { useState, useRef, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPenToSquare, faXmark } from '@fortawesome/free-solid-svg-icons';

function EditoKompanin(props) {
    const [kategoria, setKategoria] = useState([]);

    const getToken = localStorage.getItem("token");

    const authentikimi = {
        headers: {
            Authorization: `Bearer ${getToken}`,
        },
    };

    useEffect(() => {
        const ShfaqKategorine = async () => {
            try {
                const kategoria = await axios.get(`https://localhost:7285/api/Kategoria/shfaqKategorinSipasIDs?id=${props.id}`, authentikimi);
                setKategoria(kategoria.data);

            } catch (err) {
                console.log(err);
            }
        };

        ShfaqKategorine();
    }, []);

    const handleEmriChange = (value) => {
        setKategoria((prev) => ({ ...prev, llojiKategoris: value }));
    };

    const handlePershkrimiChange = (value) => {
        setKategoria((prev) => ({ ...prev, pershkrimiKategoris: value }));
    };

    function handleSubmit() {


        axios.put(`https://localhost:7285/api/Kategoria/perditesoKategorin?id=${kategoria.kategoriaId}`, kategoria, authentikimi)
            .then(x => {
                console.log(x);
                props.setTipiMesazhit("success");
                props.setPershkrimiMesazhit("Kategoria u Perditesua me sukses!")
                props.perditesoTeDhenat();
                props.largo();
                props.shfaqmesazhin();
            })
            .catch(error => {
                console.error('Error saving kategoria:', error);
                props.setTipiMesazhit("danger");
                props.setPershkrimiMesazhit("Ndodhi nje gabim gjate perditesimit te kategorise!")
                props.perditesoTeDhenat();
                props.shfaqmesazhin();
            });

    }
    return (
        <Modal className="modalEditShto" show={true} onHide={() => props.largo()}>
            <Modal.Header closeButton>
                <Modal.Title>Edito Kategorine</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>ID Kategorise</Form.Label>
                        <Form.Control
                            value={kategoria.kategoriaId}
                            disabled
                        />
                    </Form.Group>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Lloji Kategorise</Form.Label>
                        <Form.Control
                            onChange={(e) => handleEmriChange(e.target.value)}
                            value={kategoria.llojiKategoris}
                            type="text"
                            placeholder="Lloji Kategorise"
                            autoFocus
                        />
                    </Form.Group>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Pershkrimi Kategorise</Form.Label>
                        <Form.Control
                            onChange={(e) => handlePershkrimiChange(e.target.value)}
                            value={kategoria.pershkrimiKategoris}
                            type="text"
                            placeholder="Pershkrimi Kategorise"
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
                    Edito Kategorine <FontAwesomeIcon icon={faPenToSquare} />
                </Button>
            </Modal.Footer>
        </Modal>
    )
}

export default EditoKompanin;
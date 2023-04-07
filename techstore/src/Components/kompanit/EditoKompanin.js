import { useState, useRef, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";

function EditoKompanin(props) {
    const [kompania, setKompania] = useState([]);
    const foto = useRef(null);

    useEffect(() => {
        const shfaqKompanit = async () => {
            try {
                const kompania = await axios.get(`https://localhost:7285/api/Kompania/shfaqKompanin?id=${props.id}`);
                setKompania(kompania.data);

            } catch (err) {
                console.log(err);
            }
        };

        shfaqKompanit();
    }, []);

    const handleEmriChange = (value) => {
        setKompania((prev) => ({ ...prev, emriKompanis: value }));
    };

    const handleAdresaChange = (value) => {
        setKompania((prev) => ({ ...prev, Adresa: value }));
    };


    const handleFotoChange = () => {
        const filePath = foto.current.value;
        const fileName = filePath.split('\\').pop();
        setKompania(prev => ({ ...prev, logo: fileName }));
    };


    function handleSubmit() {


        axios.put(`https://localhost:7285/api/Kompania/perditesoKompanin?id=${kompania.kompaniaId}`, kompania)
            .then(x => {
                console.log(x);
                props.setTipiMesazhit("success");
                props.setPershkrimiMesazhit("Kompania u Perditesua me sukses!")
                props.perditesoTeDhenat();
                props.largo();
                props.shfaqmesazhin();
            })
            .catch(error => {
                console.error('Error saving kompania:', error);
                props.setTipiMesazhit("danger");
                props.setPershkrimiMesazhit("Ndodhi nje gabim gjate fshirjes se kompanis!")
                props.perditesoTeDhenat();
                props.shfaqmesazhin();
            });

    }
    return (
        <Modal show={true} onHide={() => props.largo()}>
            <Modal.Header closeButton>
                <Modal.Title>Shto Kompanin</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Emri Kompanis</Form.Label>
                        <Form.Control
                            onChange={(e) => handleEmriChange(e.target.value)}
                            value={kompania.emriKompanis}
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
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Adresa Kompanis</Form.Label>
                    <Form.Control
                        onChange={e => handleAdresaChange(e.target.value)}
                        type="text"
                        placeholder="Adresa Kompanis"
                        defaultValue={kompania.adresa ?? ''}
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
                    Edito Kompanin
                </Button>
            </Modal.Footer>
        </Modal>
    )
}

export default EditoKompanin;
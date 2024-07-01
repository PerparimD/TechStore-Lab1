import { useState, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPenToSquare, faXmark } from '@fortawesome/free-solid-svg-icons';

function EditoKompanin(props) {
    const [kategoria, setKategoria] = useState([]);

    const [perditeso, setPerditeso] = useState("");
    const [kategorite, setKateogrite] = useState([]);
    const [kontrolloKategorine, setKontrolloKategorine] = useState(false);
    const [konfirmoKategorine, setKonfirmoKategorine] = useState(false);
    const [fushatEZbrazura, setFushatEZbrazura] = useState(false);

    useEffect(() => {
        const vendosKategorite = async () => {
            try {
                const kategorite = await axios.get(
                    `https://localhost:7285/api/Kategoria/shfaqKategorit`, authentikimi
                );
                setKateogrite(kategorite.data);

            } catch (err) {
                console.log(err);
            }
        };

        vendosKategorite();
    }, [perditeso]);

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

    function isNullOrEmpty(value) {
        return value === null || value === "" || value === undefined;
    }

    function handleSubmit() {
        axios.put(`https://localhost:7285/api/Kategoria/perditesoKategorin?id=${kategoria.kategoriaId}`, kategoria, authentikimi)
            .then(x => {

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

    const handleKontrolli = () => {
        if (
            isNullOrEmpty(kategoria.llojiKategoris)
        ) {
            setFushatEZbrazura(true);
        } else {

            if (konfirmoKategorine == false && kategorite.filter((item) => item.llojiKategoris === kategoria.llojiKategoris).length !== 0) {
                setKontrolloKategorine(true);
            }
            else {
                handleSubmit();
            }
        }
    }

    return (
        <>
            {fushatEZbrazura &&
                <Modal size="sm" show={fushatEZbrazura} onHide={() => setFushatEZbrazura(false)}>
                    <Modal.Header closeButton>
                        <Modal.Title style={{ color: "red" }} as="h6">Ndodhi nje gabim</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <strong style={{ fontSize: "10pt" }}>Ju lutemi plotesoni te gjitha fushat me <span style={{ color: "red" }}>*</span></strong>
                    </Modal.Body>
                    <Modal.Footer>
                        <Button size="sm" onClick={() => setFushatEZbrazura(false)} variant="secondary">
                            Mbylle <FontAwesomeIcon icon={faXmark} />
                        </Button >
                    </Modal.Footer>

                </Modal>
            }
            {kontrolloKategorine &&
                <Modal size="sm" show={kontrolloKategorine} onHide={() => setKontrolloKategorine(false)}>
                    <Modal.Header closeButton>
                        <Modal.Title as="h6">Konfirmo Perditesimin</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <span style={{ fontSize: "10pt" }}>
                            Nje kategori me te njejtin emer ekziston ne sistem!
                        </span>
                        <br />
                        <strong style={{ fontSize: "10pt" }}>
                            A jeni te sigurt qe deshironi te vazhdoni?
                        </strong>
                    </Modal.Body>
                    <Modal.Footer>
                        <Button size="sm" variant="secondary" onClick={() => setKontrolloKategorine(false)}>
                            Korrigjo <FontAwesomeIcon icon={faXmark} />
                        </Button>
                        <Button
                            size="sm"
                            variant="warning"
                            onClick={() => { handleSubmit(); }}
                        >
                            Vazhdoni
                        </Button>
                    </Modal.Footer>
                </Modal>
            }
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
                            <Form.Label>Lloji Kategorise<span style={{ color: "red" }}>*</span></Form.Label>
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
                        onClick={handleKontrolli}
                    >
                        Edito Kategorine <FontAwesomeIcon icon={faPenToSquare} />
                    </Button>
                </Modal.Footer>
            </Modal>
        </>
    )
}

export default EditoKompanin;
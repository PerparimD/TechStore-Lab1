import { useState, useRef, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPenToSquare, faXmark } from '@fortawesome/free-solid-svg-icons';

function EditoKodin(props) {
    const [kodi, setKodi] = useState([]);
    const [produktet, setProduktet] = useState([]);
    const [perditeso, setPerditeso] = useState("");

    const getToken = localStorage.getItem("token");

    const authentikimi = {
        headers: {
            Authorization: `Bearer ${getToken}`,
        },
    };

    useEffect(() => {
        const vendosProduktet = async () => {
            try {
                const produktet = await axios.get(
                    `https://localhost:7285/api/Produkti/Products`, authentikimi
                );
                setProduktet(produktet.data);

            } catch (err) {
                console.log(err);
            }
        };

        vendosProduktet();
    }, [perditeso]);

    useEffect(() => {
        const shfaqKodin = async () => {
            try {
                const teDhenatKodit = await axios.get(`https://localhost:7285/api/KodiZbritje/gjejKodin?kodi=${props.id}`, authentikimi);
                setKodi(teDhenatKodit.data);

            } catch (err) {
                console.log(err);
            }
        };

        shfaqKodin();
    }, []);

    const handleQmimiChange = (value) => {
        setKodi((prev) => ({ ...prev, qmimiZbritjes: value }));
    };

    const handleProduktiChange = (value) => {
        setKodi((prev) => ({ ...prev, idProdukti: value }));
    };


    function handleSubmit() {


        axios.put(`https://localhost:7285/api/KodiZbritje/perditesoTeDhenatEKodit?kodi=${kodi.kodi}`, kodi, authentikimi)
            .then(x => {
                console.log(x);
                props.setTipiMesazhit("success");
                props.setPershkrimiMesazhit("Te dhenat e kodit u Perditesuan me sukses!")
                props.perditesoTeDhenat();
                props.largo();
                props.shfaqmesazhin();
            })
            .catch(error => {
                console.error('Error saving kodi:', error);
                props.setTipiMesazhit("danger");
                props.setPershkrimiMesazhit("Ndodhi nje gabim gjate perditesimit te kodit!")
                props.perditesoTeDhenat();
                props.shfaqmesazhin();
            });

    }
    return (
        <Modal className="modalEditShto" show={true} onHide={() => props.largo()}>
            <Modal.Header closeButton>
                <Modal.Title>Edito Kodin</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Kodi Zbritjes</Form.Label>
                        <Form.Control
                            value={kodi.kodi}
                            disabled
                        />
                    </Form.Group>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Qmimi Zbritjes</Form.Label>
                        <Form.Control
                            onChange={(e) => handleQmimiChange(e.target.value)}
                            value={kodi.qmimiZbritjes}
                            type="number"
                            min={0.01}
                            placeholder="Qmimi Zbritjes"
                            autoFocus
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
                            value={kodi.idProdukti}
                            onChange={(e) => handleProduktiChange(e.target.value)}
                        >
                            <option defaultValue hidden value={kodi.produktiId}>
                                {kodi.emriProduktit !== null ? kodi.emriProduktit : "Vlene per te gjitha produktet"}
                            </option>
                            <option value={0} key={0}>
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
                    Edito kodin <FontAwesomeIcon icon={faPenToSquare} />
                </Button>
            </Modal.Footer>
        </Modal>
    )
}

export default EditoKodin;
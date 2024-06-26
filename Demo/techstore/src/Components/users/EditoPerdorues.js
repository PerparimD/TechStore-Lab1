import { useState, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import ToggleButton from 'react-bootstrap/ToggleButton';
import ToggleButtonGroup from 'react-bootstrap/ToggleButtonGroup';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPenToSquare, faXmark } from '@fortawesome/free-solid-svg-icons';

import data from "../../Data/Data";

function EditoPerdorues(props) {
    const [perdoruesi, setPerdoruesi] = useState([]);
    const [shfaqRolet, setShfaqRolet] = useState([]);
    const [roletUseri, setRoletUseri] = useState([]);
    const [roletSelektim, setRoletSelektim] = useState([]);

    const handleChange = (roli) => setRoletSelektim(roli);

    useEffect(() => {
        const vendosPerdoruesin = async () => {
            try {
                const user = data.shfaqPerdoruesit.find((item) => item.perdoruesi.aspNetUserId == props.id);
                setPerdoruesi(user);

                setRoletUseri(user.rolet);
                setRoletSelektim(user.rolet)

            } catch (err) {
                console.log(err);
            }
        };

        vendosPerdoruesin();
    }, []);

    useEffect(() => {
        const vendosRolet = async () => {
            try {
                setShfaqRolet(data.shfaqRolet);
            } catch (err) {
                console.log(err);
            }
        };

        vendosRolet();
    }, []);

    async function handleSubmit() {
        try {
            props.perditesoTeDhenat();
            props.largo();
            props.setTipiMesazhit("success")
            props.setPershkrimiMesazhit("Aksesi i perdoruesit u perditesua!")
            props.shfaqmesazhin();
        } catch (error) {
            props.perditesoTeDhenat();
            props.largo();
            props.setTipiMesazhit("danger")
            props.setPershkrimiMesazhit("Ndodhi nje gabim gjate perditesimit te aksesit!")
            props.shfaqmesazhin();
        }
    }

    const getToggleButtonStyle = (selected) => {
        return {
            backgroundColor: selected ? "#009879" : "white",
            color: selected ? "white" : "black"
        };
    };
    return (
        <Modal className="modalEditShto" show={true} onHide={() => props.largo()}>
            <Modal.Header closeButton>
                <Modal.Title>Edito Perdoruesin</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>ID - Email</Form.Label>
                        <Form.Control
                            value={perdoruesi && perdoruesi.perdoruesi && perdoruesi.perdoruesi.userId + " - " + perdoruesi.perdoruesi.email}
                            disabled
                        />
                    </Form.Group>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Emri & Mbiemri</Form.Label>
                        <Form.Control
                            value={perdoruesi && perdoruesi.perdoruesi && perdoruesi.perdoruesi.emri + " " + perdoruesi.perdoruesi.mbiemri}
                            disabled
                        />
                    </Form.Group>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                        <Form.Label>Aksesi</Form.Label>
                        <br />
                        <ToggleButtonGroup type="checkbox" value={roletSelektim} onChange={handleChange}>
                            {shfaqRolet && shfaqRolet.map(roli => (
                                <ToggleButton
                                    id={roli.id}
                                    value={roli.name}
                                    disabled={roli.name === "User"}
                                    key={roli.id}
                                    style={getToggleButtonStyle(roletSelektim.includes(roli.name))}
                                >
                                    {roli.name}
                                </ToggleButton>
                            ))}
                        </ToggleButtonGroup>


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
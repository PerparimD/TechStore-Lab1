import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBan, faXmark } from '@fortawesome/free-solid-svg-icons'

function FshijZbritjen(props) {
    function handleSubmit() {
        try {
            props.setTipiMesazhit("success");
            props.setPershkrimiMesazhit("<h6>Zbritja u fshi me sukses!</h6>")
            props.perditesoTeDhenat();
            props.fshijZbritjen();
            props.largo();
            props.shfaqmesazhin();
        } catch (error) {
            console.error(error);
            props.setTipiMesazhit("danger");
            props.setPershkrimiMesazhit("Ndodhi nje gabim gjate fshirjes se zbritjes!")
            props.perditesoTeDhenat();
            props.shfaqmesazhin();
        }

    }
    return (
        <Modal show={true} onHide={() => props.largo()}>
            <Modal.Header closeButton>
                <Modal.Title style={{ color: "red" }}>Largo Kompanin</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <h6 >A jeni te sigurt qe deshironi ta fshini kete zbritje?</h6>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={() => props.largo()}>
                    Anulo <FontAwesomeIcon icon={faXmark} />
                </Button>
                <Button
                    variant="danger"
                    onClick={handleSubmit}
                >
                    Largo Zbritjen <FontAwesomeIcon icon={faBan} />
                </Button>
            </Modal.Footer>
        </Modal>
    )
}

export default FshijZbritjen;
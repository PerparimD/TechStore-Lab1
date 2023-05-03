import axios from "axios";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBan, faXmark } from '@fortawesome/free-solid-svg-icons'

function LargoKompanin(props) {
    async function handleSubmit() {
        try {
            await axios.delete(`https://localhost:7285/api/Kategoria/fshijKategorin?id=${props.id}`);
            props.setTipiMesazhit("success");
            props.setPershkrimiMesazhit("Kategoria u fshi me sukses!")
            props.perditesoTeDhenat();
            props.largo();
            props.shfaqmesazhin();
        } catch (error) {
            console.error(error);
            props.setTipiMesazhit("danger");
            props.setPershkrimiMesazhit("Ndodhi nje gabim gjate fshirjes se kategorise!")
            props.perditesoTeDhenat();
            props.shfaqmesazhin();
        }

    }
    return (
        <Modal show={true} onHide={() => props.largo()}>
            <Modal.Header closeButton>
                <Modal.Title style={{color: "red"}}>Largo Kategorine</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <h6 >A jeni te sigurt qe deshironi ta fshini kete kategori?</h6>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={() => props.largo()}>
                    Anulo <FontAwesomeIcon icon={faXmark} />
                </Button>
                <Button
                    variant="danger"
                    onClick={handleSubmit}
                >
                    Largo Kategorine <FontAwesomeIcon icon={faBan} />
                </Button>
            </Modal.Footer>
        </Modal>
    )
}

export default LargoKompanin;
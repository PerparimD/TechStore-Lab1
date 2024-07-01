import axios from "axios";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBan, faXmark } from '@fortawesome/free-solid-svg-icons'

function LargoKompanin(props) {
    const getToken = localStorage.getItem("token");

    const authentikimi = {
        headers: {
            Authorization: `Bearer ${getToken}`,
        },
    };

    async function handleSubmit() {
        try {
            await axios.delete(`https://localhost:7285/api/Kompania/fshijKompanin?id=${props.id}`, authentikimi);
            props.setTipiMesazhit("success");
            props.setPershkrimiMesazhit("Kompania u fshi me sukses!")
            props.perditesoTeDhenat();
            props.largo();
            props.shfaqmesazhin();
        } catch (error) {
            console.error(error);
            props.setTipiMesazhit("danger");
            props.setPershkrimiMesazhit("Ndodhi nje gabim gjate fshirjes se kompanis!")
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
                <h6 >A jeni te sigurt qe deshironi ta fshini kete kompani?</h6>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={() => props.largo()}>
                    Anulo <FontAwesomeIcon icon={faXmark} />
                </Button>
                <Button
                    variant="danger"
                    onClick={handleSubmit}
                >
                    Largo Kompanin <FontAwesomeIcon icon={faBan} />
                </Button>
            </Modal.Footer>
        </Modal>
    )
}

export default LargoKompanin;
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";

function Mesazhi(props) {
    return (
        <Modal show='true'>
            <Modal.Header >
                <Modal.Title style={props.tipi === "success" ? { color: "#009879" } : { color: "red" }}>{props.tipi === "success" ? "Me Sukses" : "Ndodhi nje gabim"}</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div dangerouslySetInnerHTML={{ __html: props.pershkrimi }} />

            </Modal.Body>
            <Modal.Footer>
                <Button onClick={() => props.setShfaqMesazhin(false)} variant={'outline-' + props.tipi}>
                    Mbylle
                </Button >
            </Modal.Footer>

        </Modal>
    )
}

export default Mesazhi;
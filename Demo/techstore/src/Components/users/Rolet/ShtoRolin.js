import { useState, useRef } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus, faXmark } from "@fortawesome/free-solid-svg-icons";

function ShtoRolin(props) {
  const [emri, setEmri] = useState("");

  const handleEmriChange = (value) => {
    setEmri(value);
  };

  function handleSubmit() {
    props.setTipiMesazhit("success");
    props.setPershkrimiMesazhit("Roli u insertua me sukses!");
    props.perditesoTeDhenat();
    props.largo();
    props.shfaqmesazhin();
  }
  
  return (
    <Modal
      className="modalEditShto"
      show={props.shfaq}
      onHide={() => props.largo()}>
      <Modal.Header closeButton>
        <Modal.Title>Shto Rolin</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form>
          <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
            <Form.Label>Emri Rolit</Form.Label>
            <Form.Control
              onChange={(e) => handleEmriChange(e.target.value)}
              value={emri}
              type="text"
              placeholder="Emri Kompanis"
              autoFocus
            />
          </Form.Group>
        </Form>
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={() => props.largo()}>
          Anulo <FontAwesomeIcon icon={faXmark} />
        </Button>
        <Button className="Butoni" onClick={handleSubmit}>
          Shto Rolin <FontAwesomeIcon icon={faPlus} />
        </Button>
      </Modal.Footer>
    </Modal>
  );
}

export default ShtoRolin;

import {React, useState, useRef} from "react";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import axios from "axios";


const ShtoProduktin = (props) => {
  const fotoP = useRef(null);
  const [foto, setFoto] = useState("");
  const [emriP, setEmriP] = useState("");
  const [qmimiP, setQmimi] = useState(0);


  const handleEmriPChange = (value) => {
    setEmriP(value);
  };

  const handleQmimiPChange = (value) => {
    setQmimi(value);
  };
  const handleFotoChange = () => {
    const filePath = fotoP.current.value;
    const fileName = filePath.split("\\").pop();
    setFoto(fileName);
  };

  // const handleClose = () => setShow(false);
  // const handleShow = () => setShow(true);

  function handleSubmit() {
    axios
      .post('https://localhost:7285/api/Produkti/shtoProdukt', {
        emriProduktit: emriP,
        fotoProduktit: foto,
        qmimiProduktit: qmimiP
      })
      .then((response) => {
        console.log(response);
        props.setTipiMesazhit("success");
        props.setPershkrimiMesazhit("Produkti u insertua me sukses!");
        props.perditesoTeDhenat();
        props.hide();
        props.shfaqmesazhin();
      })
      .catch((error) => {
        console.log(error);
      });
  }
  return (
    <>
      <Modal show={props.show} onHide={props.hide}>
        <Modal.Header closeButton>
          <Modal.Title>Shto Produkt</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>Emri Produktit</Form.Label>
              <Form.Control
                onChange={(e) => handleEmriPChange(e.target.value)}
                value={emriP}
                type="text"
                placeholder="Emri Produktit"
                autoFocus
              />
            </Form.Group>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>Foto Produktit</Form.Label>
              <Form.Control
                ref={fotoP}
                type="file"
                placeholder="Foto e Produktit"
                onChange={handleFotoChange}
                autoFocus
              />
            </Form.Group>
            <Form.Group
              className="mb-3"
              controlId="exampleForm.ControlTextarea1"
            >
              <Form.Label>Qmimi i Produktit</Form.Label>
              <Form.Control
                onChange={(e) => handleQmimiPChange(e.target.value)}
                value={qmimiP}
                type="number"
                placeholder="Qmimi i Produktit"
                autoFocus
              />
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={props.handleClose}>
            Close
          </Button>
          <Button
            style={{ backgroundColor: "#009879", border: "none" }}
            onClick={handleSubmit}
          >
            Save Changes
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  );
};

export default ShtoProduktin;
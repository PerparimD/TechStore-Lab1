import { useState, useRef, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPenToSquare, faXmark } from "@fortawesome/free-solid-svg-icons";

import data from "../../Data/Data";

function PerditesoStatusinPorosis(props) {
  const [porosia, setPorosia] = useState([]);
  const [statusiPorosis, setStatusiPorosis] = useState("");

  useEffect(() => {
    const vendosPorosine = async () => {
      try {
        const porosia = data.shfaqPorosit.find(
          (item) => item.idPorosia == props.id
        );
        setPorosia(porosia);
        setStatusiPorosis(porosia.statusiPorosis);
      } catch (err) {
        console.log(err);
      }
    };

    vendosPorosine();
  }, []);

  function handleSubmit() {
    props.setTipiMesazhit("success");
    props.setPershkrimiMesazhit("Statusi u Perditesua me sukses!");
    props.perditesoTeDhenat();
    props.largo();
    props.shfaqmesazhin();
  }
  return (
    <Modal className="modalEditShto" show={true} onHide={() => props.largo()}>
      <Modal.Header closeButton>
        <Modal.Title>Perditeso Statusin e Porosise</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form>
          <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
            <Form.Label>ID Porosia</Form.Label>
            <Form.Control value={porosia.idPorosia} disabled />
          </Form.Group>
          <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
            <Form.Label>Klienti</Form.Label>
            <Form.Control
              value={
                porosia.idKlienti + " - " + porosia.emri + " " + porosia.mbiemri
              }
              disabled
            />
          </Form.Group>
          <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
            <Form.Label>Totali Porosis</Form.Label>
            <Form.Control
              value={parseFloat(porosia.totaliPorosis).toFixed(2) + " €"}
              disabled
            />
          </Form.Group>
          <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
            <Form.Label>Statusi</Form.Label>
            <Form.Select
              value={statusiPorosis}
              onChange={(e) => setStatusiPorosis(e.target.value)}>
              <option>Ne Procesim</option>
              <option>E Verifikuar</option>
              <option>E Pergaditur</option>
              <option>E Dorezuar Tek Postieri</option>
              <option>E Pranuar nga Klienti</option>
            </Form.Select>
          </Form.Group>
        </Form>
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={() => props.largo()}>
          Anulo <FontAwesomeIcon icon={faXmark} />
        </Button>
        <Button className="Butoni" onClick={handleSubmit}>
          Perditeso Statusin <FontAwesomeIcon icon={faPenToSquare} />
        </Button>
      </Modal.Footer>
    </Modal>
  );
}

export default PerditesoStatusinPorosis;

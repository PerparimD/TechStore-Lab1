import { useState, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus, faXmark } from "@fortawesome/free-solid-svg-icons";

import data from "../../../Data/Data";

function ShtoKompanit(props) {
  const [foto, setFoto] = useState(null);
  const [emri, setEmri] = useState("");
  const [adresa, setAdresa] = useState("");

  const [perditeso, setPerditeso] = useState("");
  const [kompanit, setKompanite] = useState([]);
  const [kontrolloKompanine, setKontrolloKompanine] = useState(false);
  const [konfirmoKompanine, setKonfirmoKompanine] = useState(false);
  const [fushatEZbrazura, setFushatEZbrazura] = useState(false);

  useEffect(() => {
    const vendosKompanite = async () => {
      try {
        setKompanite(data.shfaqKompanit);
      } catch (err) {
        console.log(err);
      }
    };

    vendosKompanite();
  }, [perditeso]);

  const handleEmriChange = (value) => {
    setEmri(value);
  };

  const handleAdresaChange = (value) => {
    setAdresa(value);
  };
  const handleFotoChange = (event) => {
    setFoto(event.target.files[0]);
  };

  function isNullOrEmpty(value) {
    return value === null || value === "" || value === undefined;
  }

  async function handleSubmit() {
    props.setTipiMesazhit("success");
    props.setPershkrimiMesazhit("Kompania u insertua me sukses!");
    props.perditesoTeDhenat();
    props.largo();
    props.shfaqmesazhin();
  }

  const handleKontrolli = () => {
    if (isNullOrEmpty(emri)) {
      setFushatEZbrazura(true);
    } else {
      if (
        konfirmoKompanine == false &&
        data.shfaqKompanit.filter((item) => item.emriKompanis === emri).length !== 0
      ) {
        setKontrolloKompanine(true);
      } else {
        handleSubmit();
      }
    }
  };

  return (
    <>
      {fushatEZbrazura && (
        <Modal
          size="sm"
          show={fushatEZbrazura}
          onHide={() => setFushatEZbrazura(false)}>
          <Modal.Header closeButton>
            <Modal.Title style={{ color: "red" }} as="h6">
              Ndodhi nje gabim
            </Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <strong style={{ fontSize: "10pt" }}>
              Ju lutemi plotesoni te gjitha fushat me{" "}
              <span style={{ color: "red" }}>*</span>
            </strong>
          </Modal.Body>
          <Modal.Footer>
            <Button
              size="sm"
              onClick={() => setFushatEZbrazura(false)}
              variant="secondary">
              Mbylle <FontAwesomeIcon icon={faXmark} />
            </Button>
          </Modal.Footer>
        </Modal>
      )}
      {kontrolloKompanine && (
        <Modal
          size="sm"
          show={kontrolloKompanine}
          onHide={() => setKontrolloKompanine(false)}>
          <Modal.Header closeButton>
            <Modal.Title as="h6">Konfirmo vendosjen</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <span style={{ fontSize: "10pt" }}>
              Nje kompani me te njejtin emer ekziston ne sistem!
            </span>
            <br />
            <strong style={{ fontSize: "10pt" }}>
              A jeni te sigurt qe deshironi te vazhdoni?
            </strong>
          </Modal.Body>
          <Modal.Footer>
            <Button
              size="sm"
              variant="secondary"
              onClick={() => setKontrolloKompanine(false)}>
              Korrigjo <FontAwesomeIcon icon={faXmark} />
            </Button>
            <Button
              size="sm"
              variant="warning"
              onClick={() => {
                handleSubmit();
              }}>
              Vazhdoni
            </Button>
          </Modal.Footer>
        </Modal>
      )}
      <Modal
        className="modalEditShto"
        show={props.shfaq}
        onHide={() => props.largo()}>
        <Modal.Header closeButton>
          <Modal.Title>Shto Kompanin</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>
                Emri Kompanis<span style={{ color: "red" }}>*</span>
              </Form.Label>
              <Form.Control
                onChange={(e) => handleEmriChange(e.target.value)}
                value={emri}
                type="text"
                placeholder="Emri Kompanis"
                autoFocus
              />
            </Form.Group>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>Foto Kompanis</Form.Label>
              <Form.Control
                type="file"
                accept="image/*"
                placeholder="Foto e Kompanis"
                onChange={handleFotoChange}
              />
            </Form.Group>
            <Form.Group
              className="mb-3"
              controlId="exampleForm.ControlTextarea1">
              <Form.Label>Adresa Kompanis</Form.Label>
              <Form.Control
                onChange={(e) => handleAdresaChange(e.target.value)}
                value={adresa}
                type="text"
                placeholder="Adresa Kompanis"
              />
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={() => props.largo()}>
            Anulo <FontAwesomeIcon icon={faXmark} />
          </Button>
          <Button className="Butoni" onClick={handleKontrolli}>
            Shto Kompanin <FontAwesomeIcon icon={faPlus} />
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  );
}

export default ShtoKompanit;

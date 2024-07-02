import { useState, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus, faXmark } from "@fortawesome/free-solid-svg-icons";

import data from "../../../Data/Data";

function ShtoKompanit(props) {
  const [llojiKategoris, setLlojiKategoris] = useState("");
  const [pershkrimiKategoris, setPershkrimiKategoris] = useState("");

  const [perditeso, setPerditeso] = useState("");
  const [kategorite, setKateogrite] = useState([]);
  const [kontrolloKategorine, setKontrolloKategorine] = useState(false);
  const [konfirmoKategorine, setKonfirmoKategorine] = useState(false);
  const [fushatEZbrazura, setFushatEZbrazura] = useState(false);

  useEffect(() => {
    const vendosKategorite = async () => {
      try {
        setKateogrite(data.shfaqKategorite);
      } catch (err) {
        console.log(err);
      }
    };

    vendosKategorite();
  }, [perditeso]);

  const getToken = localStorage.getItem("token");

  const authentikimi = {
    headers: {
      Authorization: `Bearer ${getToken}`,
    },
  };

  const handleEmriChange = (value) => {
    setLlojiKategoris(value);
  };

  const handlePershkrimiChange = (value) => {
    setPershkrimiKategoris(value);
  };

  function isNullOrEmpty(value) {
    return value === null || value === "" || value === undefined;
  }

  function handleSubmit() {
    props.setTipiMesazhit("success");
    props.setPershkrimiMesazhit("Kategoria u insertua me sukses!");
    props.perditesoTeDhenat();
    props.largo();
    props.shfaqmesazhin();
  }

  const handleKontrolli = () => {
    if (isNullOrEmpty(llojiKategoris)) {
      setFushatEZbrazura(true);
    } else {
      if (
        konfirmoKategorine == false &&
        kategorite.filter((item) => item.llojiKategoris === llojiKategoris)
          .length !== 0
      ) {
        setKontrolloKategorine(true);
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
      {kontrolloKategorine && (
        <Modal
          size="sm"
          show={kontrolloKategorine}
          onHide={() => setKontrolloKategorine(false)}>
          <Modal.Header closeButton>
            <Modal.Title as="h6">Konfirmo vendosjen</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <span style={{ fontSize: "10pt" }}>
              Nje kategori me te njejtin emer ekziston ne sistem!
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
              onClick={() => setKontrolloKategorine(false)}>
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
          <Modal.Title>Shto Kategorine</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>
                Lloji Kategoris<span style={{ color: "red" }}>*</span>
              </Form.Label>
              <Form.Control
                onChange={(e) => handleEmriChange(e.target.value)}
                value={llojiKategoris}
                type="text"
                placeholder="Lloji Kategoris"
                autoFocus
              />
            </Form.Group>
            <Form.Group
              className="mb-3"
              controlId="exampleForm.ControlTextarea1">
              <Form.Label>Pershkrimi Kategoris</Form.Label>
              <Form.Control
                onChange={(e) => handlePershkrimiChange(e.target.value)}
                value={pershkrimiKategoris}
                type="text"
                placeholder="Pershkrimi Kategoris"
              />
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={() => props.largo()}>
            Anulo <FontAwesomeIcon icon={faXmark} />
          </Button>
          <Button className="Butoni" onClick={handleKontrolli}>
            Shto Kategorine <FontAwesomeIcon icon={faPlus} />
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  );
}

export default ShtoKompanit;

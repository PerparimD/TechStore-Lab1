import { useState, useRef, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faXmark } from "@fortawesome/free-solid-svg-icons";
import { faPenToSquare } from "@fortawesome/free-solid-svg-icons";

import data from "../../Data/Data";

function EditoProduktin(props) {
  const [produkti, setProdukti] = useState([]);
  const [foto, setFoto] = useState(null);
  const [kompanit, setKompanit] = useState([]);
  const [kategoria, setKategoria] = useState([]);

  const [perditeso, setPerditeso] = useState("");
  const [produktet, setProduktet] = useState([]);
  const [kontrolloProduktin, setKontrolloProduktin] = useState(false);
  const [konfirmoProduktin, setKonfirmoProduktin] = useState(false);
  const [fushatEZbrazura, setFushatEZbrazura] = useState(false);

  useEffect(() => {
    const vendosProduktet = async () => {
      try {
        setProduktet(data.shfaqProduktet);
      } catch (err) {
        console.log(err);
      }
    };

    vendosProduktet();
  }, [perditeso]);

  useEffect(() => {
    const shfaqProd = async () => {
      try {
        const produkti = data.shfaqProduktet.find(
          (item) => item.produktiId == props.id
        );
        setProdukti(produkti);
      } catch (err) {
        console.log(err);
      }
    };
    setKompanit(data.shfaqKompanit);
    setKategoria(data.shfaqKategorite);
    shfaqProd();
  }, []);

  const handleEmriPChange = (value) => {
    setProdukti((prev) => ({ ...prev, emriProduktit: value }));
  };
  const handlePershkrimiChange = (value) => {
    setProdukti((prev) => ({ ...prev, pershkrimi: value }));
  };

  const handleQmimiPChange = (value) => {
    setProdukti((prev) => ({ ...prev, qmimiProduktit: value }));
  };
  const handleFotoChange = (event) => {
    setFoto(event.target.files[0]);
  };

  const handleKompaniaChange = (value) => {
    setProdukti((prev) => ({ ...prev, kompaniaId: value }));
  };

  const handleKategoriaChange = (value) => {
    setProdukti((prev) => ({ ...prev, kategoriaId: value }));
  };

  function isNullOrEmpty(value) {
    return value === null || value === "" || value === undefined;
  }

  async function handleSubmit() {
    props.setTipiMesazhit("success");
    props.setPershkrimiMesazhit("Produkti u Perditesua me sukses!");
    props.perditesoTeDhenat();
    props.hide();
    props.shfaqmesazhin();
  }

  const handleKontrolli = () => {
    if (
      isNullOrEmpty(produkti.emriProduktit) ||
      isNullOrEmpty(produkti.kompaniaId) ||
      isNullOrEmpty(produkti.kategoriaId)
    ) {
      setFushatEZbrazura(true);
    } else {
      if (
        konfirmoProduktin == false &&
        produktet.filter(
          (item) => item.emriProduktit === produkti.emriProduktit
        ).length !== 0
      ) {
        setKontrolloProduktin(true);
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
      {kontrolloProduktin && (
        <Modal
          size="sm"
          show={kontrolloProduktin}
          onHide={() => setKontrolloProduktin(false)}>
          <Modal.Header closeButton>
            <Modal.Title as="h6">Konfirmo vendosjen</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <span style={{ fontSize: "10pt" }}>
              Nje produkt me te njejtin emer ekziston ne sistem!
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
              onClick={() => setKontrolloProduktin(false)}>
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
        style={{ marginTop: "3em" }}
        show={props.show}
        onHide={props.hide}>
        <Modal.Header closeButton>
          <Modal.Title>Edito Produktin</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>
                Emri Produktit<span style={{ color: "red" }}>*</span>
              </Form.Label>
              <Form.Control
                onChange={(e) => handleEmriPChange(e.target.value)}
                value={produkti.emriProduktit}
                type="text"
                placeholder="Emri Produktit"
                autoFocus
              />
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>Pershkrimi Produktit</Form.Label>
                <Form.Control
                  onChange={(e) => handlePershkrimiChange(e.target.value)}
                  value={produkti.pershkrimi}
                  as="textarea"
                  placeholder="Pershkrimi Produktit"
                  autoFocus
                />
              </Form.Group>
            </Form.Group>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>Foto Produktit</Form.Label>
              <Form.Control
                type="file"
                accept="image/*"
                placeholder="Foto e Produktit"
                onChange={handleFotoChange}
              />
            </Form.Group>
            <Form.Group>
              <Form.Label>
                Kompania<span style={{ color: "red" }}>*</span>
              </Form.Label>
              <select
                placeholder="Kompania e Produktit"
                className="form-select"
                value={produkti.kompaniaId}
                onChange={(e) => handleKompaniaChange(e.target.value)}>
                <option selected disabled hidden>
                  {produkti.emriKompanis}
                </option>
                {kompanit.map((item) => {
                  return (
                    <option key={item.kompaniaId} value={item.kompaniaId}>
                      {item.emriKompanis}
                    </option>
                  );
                })}
              </select>
            </Form.Group>
            <Form.Group
              className="mb-3"
              controlId="exampleForm.ControlTextarea1">
              <Form.Label>
                Kategoria<span style={{ color: "red" }}>*</span>
              </Form.Label>
              <select
                placeholder="Kategoria e Produktit"
                className="form-select"
                value={produkti.kategoriaID}
                onChange={(e) => handleKategoriaChange(e.target.value)}>
                <option selected disabled hidden>
                  {produkti.llojiKategoris}
                </option>
                {kategoria.map((item) => {
                  return (
                    <option key={item.kategoriaId} value={item.kategoriaId}>
                      {item.llojiKategoris}
                    </option>
                  );
                })}
              </select>
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={props.hide}>
            Anulo <FontAwesomeIcon icon={faXmark} />
          </Button>
          <Button
            style={{ backgroundColor: "#009879", border: "none" }}
            onClick={handleKontrolli}>
            Edito Produktin <FontAwesomeIcon icon={faPenToSquare} />
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  );
}

export default EditoProduktin;

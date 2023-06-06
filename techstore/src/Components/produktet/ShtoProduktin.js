/* eslint-disable no-undef */
import { React, useState, useRef } from "react";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faXmark } from "@fortawesome/free-solid-svg-icons";
import { useEffect } from "react";

const ShtoProduktin = (props) => {
  const [emriP, setEmriP] = useState("");
  const [emriK, setEmriK] = useState("");
  const [pershkrimi, setPershkrimi] = useState("");
  const [llojiK, setLlojiK] = useState("");
  const [kompanit, setKompanit] = useState([]);
  const [kategoria, setKategoria] = useState([]);
  const [foto, setFoto] = useState(null);

  const getToken = localStorage.getItem("token");

  const authentikimi = {
    headers: {
      Authorization: `Bearer ${getToken}`,
    },
  };

  const handleEmriPChange = (value) => {
    setEmriP(value);
  };

  const handlePershkrimiChange = (value) => {
    setPershkrimi(value);
  };

  const handleKompaniaChange = (value) => {
    setEmriK(value);
  };

  const handleKategoriaChange = (value) => {
    setLlojiK(value);
  };

  const handleFotoChange = (event) => {
    setFoto(event.target.files[0]);
  };

  useEffect(() => {
    Promise.all([
      fetch("https://localhost:7285/api/Kompania/shfaqKompanit"),
      fetch("https://localhost:7285/api/Kategoria/shfaqKategorit"),
    ])
      .then(([resKompanit, resKategorit]) =>
        Promise.all([resKompanit.json(), resKategorit.json()])
      )
      .then(([dataKomapit, dataKategorit]) => {
        setKompanit(dataKomapit);
        setKategoria(dataKategorit);
      });
  }, []);


  async function handleSubmit() {
    if (foto) {
      const formData = new FormData();
      formData.append('foto', foto);

      try {
        await axios.post("https://localhost:7285/api/VendosFotot/ShtoProduktin", formData, authentikimi)
          .then(async (response) => {
            await axios
              .post("https://localhost:7285/api/Produkti/shtoProdukt", {
                emriProduktit: emriP,
                pershkrimi: pershkrimi,
                fotoProduktit: response.data,
                kategoriaId: llojiK,
                kompaniaId: emriK
              }, authentikimi)
              .then(async (response) => {
                
                props.setTipiMesazhit("success");
                props.setPershkrimiMesazhit("Produkti u insertua me sukses!");
                props.perditesoTeDhenat();
                props.hide();
                props.shfaqmesazhin();
              })
              .catch((error) => {
                console.log(error);
              });
          });
      } catch (error) {
        console.error(error);
      }

    } else {
      await axios
        .post("https://localhost:7285/api/Produkti/shtoProdukt", {
          emriProduktit: emriP,
          pershkrimi: pershkrimi,
          fotoProduktit: "ProduktPaFoto.png",
          kategoriaId: llojiK,
          kompaniaId: emriK
        }, authentikimi)
        .then((response) => {
          
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

  }
  return (
    <>
      <Modal className="modalEditShto" show={props.show} onHide={props.hide}>
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
              />
            </Form.Group>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>Pershkrimi Produktit</Form.Label>
              <Form.Control
                onChange={(e) => handlePershkrimiChange(e.target.value)}
                value={pershkrimi}
                as="textarea"
                placeholder="Pershkrimi Produktit"
              />
            </Form.Group>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>Foto Produktit</Form.Label>
              <Form.Control
                type="file"
                placeholder="Foto e Produktit"
                onChange={handleFotoChange}
              />
            </Form.Group>
            <Form.Group
              className="mb-3"
              controlId="exampleForm.ControlTextarea1"
            >
              <Form.Label>Kompania</Form.Label>
              <select
                placeholder="Kompania e Produktit"
                className="form-select"
                value={emriK}
                onChange={(e) => handleKompaniaChange(e.target.value)}
              >
                <option defaultValue disabled value="">
                  Kompania e Produktit
                </option>
                {kompanit.map((item) => {
                  return (
                    <option key={item.kompaniaId} value={item.kompaniaId}>{item.emriKompanis}</option>
                  );
                })}
              </select>
            </Form.Group>
            <Form.Group
              className="mb-3"
              controlId="exampleForm.ControlTextarea1"
            >
              <Form.Label>Kategoria</Form.Label>
              <select
                placeholder="Kategoria e Produktit"
                className="form-select"
                value={llojiK}
                onChange={(e) => handleKategoriaChange(e.target.value)}
              >
                <option defaultValue disabled value="">
                  Kategoria e Produktit
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
            Close <FontAwesomeIcon icon={faXmark} />
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

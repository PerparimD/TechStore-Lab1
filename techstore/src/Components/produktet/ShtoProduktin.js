import { React, useState, useRef } from "react";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faXmark, faBan, faL } from "@fortawesome/free-solid-svg-icons";
import { useEffect } from "react";

const ShtoProduktin = (props) => {
  const [emriP, setEmriP] = useState("");
  const [emriK, setEmriK] = useState("");
  const [pershkrimi, setPershkrimi] = useState("");
  const [llojiK, setLlojiK] = useState("");
  const [kompanit, setKompanit] = useState([]);
  const [kategoria, setKategoria] = useState([]);
  const [foto, setFoto] = useState(null);
  const [perditeso, setPerditeso] = useState("");

  const [produktet, setProduktet] = useState([]);
  const [kontrolloProduktin, setKontrolloProduktin] = useState(false);
  const [konfirmoProduktin, setKonfirmoProduktin] = useState(false);
  const [fushatEZbrazura, setFushatEZbrazura] = useState(false);

  useEffect(() => {
    const vendosProduktet = async () => {
      try {
        const produktet = await axios.get(
          `https://localhost:7285/api/Produkti/Products`, authentikimi
        );
        setProduktet(produktet.data);

      } catch (err) {
        console.log(err);
      }
    };

    vendosProduktet();
  }, [perditeso]);

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

  function isNullOrEmpty(value) {
    return value === null || value === "" || value === undefined;
  }

  const handleKontrolli = () => {
    if (
      isNullOrEmpty(emriP) ||
      isNullOrEmpty(emriK) ||
      isNullOrEmpty(llojiK)
    ) {
      setFushatEZbrazura(true);
    } else {
      if (konfirmoProduktin == false && produktet.filter((item) => item.emriProduktit === emriP).length !== 0) {
        setKontrolloProduktin(true);
      }
      else {
        handleSubmit();
      }
    }

  }
  
  return (
    <>
      {fushatEZbrazura &&
        <Modal size="sm" show={fushatEZbrazura} onHide={() => setFushatEZbrazura(false)}>
          <Modal.Header closeButton>
            <Modal.Title style={{ color: "red" }} as="h6">Ndodhi nje gabim</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <strong style={{ fontSize: "10pt" }}>Ju lutemi plotesoni te gjitha fushat me <span style={{ color: "red" }}>*</span></strong>
          </Modal.Body>
          <Modal.Footer>
            <Button size="sm" onClick={() => setFushatEZbrazura(false)} variant="secondary">
              Mbylle <FontAwesomeIcon icon={faXmark} />
            </Button >
          </Modal.Footer>

        </Modal>
      }
      {kontrolloProduktin &&
        <Modal size="sm" show={kontrolloProduktin} onHide={() => setKontrolloProduktin(false)}>
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
            <Button size="sm" variant="secondary" onClick={() => setKontrolloProduktin(false)}>
              Korrigjo <FontAwesomeIcon icon={faXmark} />
            </Button>
            <Button
              size="sm"
              variant="warning"
              onClick={() => { handleSubmit(); }}
            >
              Vazhdoni
            </Button>
          </Modal.Footer>
        </Modal>
      }
      <Modal className="modalEditShto" show={props.show} onHide={props.hide}>
        <Modal.Header closeButton>
          <Modal.Title>Shto Produkt</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>Emri Produktit<span style={{ color: "red" }}>*</span></Form.Label>
              <Form.Control
                onChange={(e) => handleEmriPChange(e.target.value)}
                value={emriP}
                type="text"
                placeholder="Emri Produktit"
                autoFocus
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
                accept="image/*"
                placeholder="Foto e Produktit"
                onChange={handleFotoChange}
              />
            </Form.Group>
            <Form.Group
              className="mb-3"
              controlId="exampleForm.ControlTextarea1"
            >
              <Form.Label>Kompania<span style={{ color: "red" }}>*</span></Form.Label>
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
              <Form.Label>Kategoria<span style={{ color: "red" }}>*</span></Form.Label>
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
            onClick={handleKontrolli}
          >
            Save Changes
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  );
};

export default ShtoProduktin;

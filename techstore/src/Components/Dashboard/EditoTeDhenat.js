import React from "react";
import { useState, useRef, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus, faXmark } from "@fortawesome/free-solid-svg-icons";
import { faPenToSquare } from "@fortawesome/free-solid-svg-icons";
import "../produktet/cart/CartPage.css"
import { Row, Col } from "react-bootstrap";

const EditoTeDhenat = (props) => {
  const [perdoruesi, setPerdoruesi] = useState([]);

  const getID = localStorage.getItem("id");

  const getToken = localStorage.getItem("token");

  const authentikimi = {
    headers: {
      Authorization: `Bearer ${getToken}`,
    },
  };

  useEffect(() => {
    const vendosPerdoruesin = async () => {
      try {
        const perdoruesi = await axios.get(`https://localhost:7285/api/Perdoruesi/shfaqSipasID?idUserAspNet=${getID}`, authentikimi);

        setPerdoruesi(perdoruesi.data.perdoruesi)
      }
      catch (e) {
        console.error(e);
      }
    }

    vendosPerdoruesin();
  }, [])


  const handleEmriChange = (value) => {
    setPerdoruesi((prev) => ({ ...prev, emri: value }));
  };

  const handleMbiemriChange = (value) => {
    setPerdoruesi((prev) => ({ ...prev, mbiemri: value }));
  };

  const handleNumriChange = (value) => {
    setPerdoruesi((prev) => ({
      ...prev,
      teDhenatPerdoruesit: { ...prev.teDhenatPerdoruesit, nrKontaktit: value },
    }));
  };

  const handleAdresaChange = (value) => {
    setPerdoruesi((prev) => ({
      ...prev,
      teDhenatPerdoruesit: { ...prev.teDhenatPerdoruesit, adresa: value },
    }));
  };

  const handleQytetiChange = (value) => {
    setPerdoruesi((prev) => ({
      ...prev,
      teDhenatPerdoruesit: { ...prev.teDhenatPerdoruesit, qyteti: value },
    }));
  };

  const handleShtetiChange = (value) => {
    setPerdoruesi((prev) => ({
      ...prev,
      teDhenatPerdoruesit: { ...prev.teDhenatPerdoruesit, shteti: value },
    }));
  };

  const handleZipKodiChange = (value) => {
    setPerdoruesi((prev) => ({
      ...prev,
      teDhenatPerdoruesit: { ...prev.teDhenatPerdoruesit, zipKodi: value },
    }));
  };

  const handlePerditesoTeDhenat = () => {
    axios.put(`https://localhost:7285/api/Perdoruesi/perditesoPerdorues/${perdoruesi.userId}`, perdoruesi, authentikimi);

    props.perditeso();
    props.setShfaqMesazhin();
    props.tipi("success");
    props.pershkrimi("Te Dhenat u perditesua me sukses!");
    props.setMbyllPerditesoTeDhenat();
  }



  return (
    <>
      <Modal className="modalEditoDhenat" show={true} onHide={() => props.setMbyllPerditesoTeDhenat()}>
        <Modal.Header closeButton>
          <Modal.Title>Perditeso Te Dhenat</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>

            <Row className="mb-3">
              <Form.Group as={Col} className="p-0" controlId="formGridName">
                <Form.Label>Emri</Form.Label>
                <Form.Control type="name" placeholder="Enter Name" value={perdoruesi && perdoruesi.emri} onChange={(e) => handleEmriChange(e.target.value)} required />
              </Form.Group>

              <Form.Group as={Col} className="p-0" controlId="formGridLastName">
                <Form.Label>Mbiemri</Form.Label>
                <Form.Control type="last name" placeholder="Last Name" value={perdoruesi && perdoruesi.mbiemri} onChange={(e) => handleMbiemriChange(e.target.value)} required />
              </Form.Group>
            </Row>

            <Form.Group className="mb-3" controlId="formGridAddress2">
              <Form.Label>Numri Telefonit</Form.Label>
              <Form.Control placeholder="045123123 ose +38343123132" value={perdoruesi && perdoruesi.teDhenatPerdoruesit && perdoruesi.teDhenatPerdoruesit.nrKontaktit} onChange={(e) => handleNumriChange(e.target.value)} />
            </Form.Group>
            <Row>
              <Form.Group as={Col} className="p-0" controlId="formGridCity">
                <Form.Label>Adresa</Form.Label>
                <Form.Control placeholder="Agim Bajrami 60" value={perdoruesi && perdoruesi.teDhenatPerdoruesit && perdoruesi.teDhenatPerdoruesit.adresa} onChange={(e) => handleAdresaChange(e.target.value)} />
              </Form.Group>
              <Form.Group as={Col} className="p-0" controlId="formGridCity">
                <Form.Label>Qyteti</Form.Label>
                <Form.Control placeholder="Kaçanik" value={perdoruesi && perdoruesi.teDhenatPerdoruesit && perdoruesi.teDhenatPerdoruesit.qyteti} onChange={(e) => handleQytetiChange(e.target.value)} />
              </Form.Group>
            </Row>

            <Row className="mb-3">
              <Form.Group as={Col} className="p-0" controlId="formGridState">
                <Form.Label>Shteti</Form.Label>
                <Form.Select value={perdoruesi && perdoruesi.teDhenatPerdoruesit && perdoruesi.teDhenatPerdoruesit.shteti} onChange={(e) => handleShtetiChange(e.target.value)}>
                  <option hidden disabled>Zgjedhni Shtetin</option>
                  <option>Kosovë</option>
                  <option>Shqipëri</option>
                  <option>Maqedoni e Veriut</option>
                </Form.Select>
              </Form.Group>

              <Form.Group as={Col} className="p-0" controlId="formGridZip">
                <Form.Label>Zip Kodi</Form.Label>
                <Form.Control type="number" placeholder="71000" value={perdoruesi && perdoruesi.teDhenatPerdoruesit && perdoruesi.teDhenatPerdoruesit.zipKodi} onChange={(e) => handleZipKodiChange(e.target.value)} />
              </Form.Group>
            </Row>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={() => props.setMbyllPerditesoTeDhenat()}>
            Anulo <FontAwesomeIcon icon={faXmark} />
          </Button>
          <Button style={{ backgroundColor: "#009879", border: "none" }} onClick={handlePerditesoTeDhenat}>
            Edito te Dhenat <FontAwesomeIcon icon={faPenToSquare} />
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  );
};

export default EditoTeDhenat;

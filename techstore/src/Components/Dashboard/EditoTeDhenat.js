import React from "react";
import { useState, useRef, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus, faXmark } from "@fortawesome/free-solid-svg-icons";
import { faPenToSquare } from "@fortawesome/free-solid-svg-icons";

const EditoTeDhenat = (props) => {
  const [perdoruesi, setPerdoruesi] = useState([]);
  

  const handleEmriChange = (value) => {
    setPerdoruesi((prev) => ({ ...prev, emri: value }));
  };

  const handleMbiemriChange = (value) => {
    setPerdoruesi((prev) => ({ ...prev, mbiemri: value }));
  };

  const handleEmailChange = (value) => {
    setPerdoruesi((prev) => ({ ...prev, email: value }));
  };

  const handleUserNameChange = (value) => {
    setPerdoruesi((prev) => ({ ...prev, username: value }));
  };

  const handleNumriChange = (value) => {
    setPerdoruesi((prev) => ({ ...prev, nrKontaktit: value }));
  };

  const handleAdresaChange = (value) => {
    setPerdoruesi((prev) => ({ ...prev, adresa: value }));
  };

  

  return (
    <>
      <Modal className="modalEdit" show={true} onHide={props.hide}>
        <Modal.Header closeButton>
          <Modal.Title>Perditeso Te Dhenat</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>Emri </Form.Label>
              <Form.Control
                onChange={(e) => handleEmriChange(e.target.value)}
                value={perdoruesi.emri}
                type="text"
                placeholder="Emri"
              />
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1"
              >
                <Form.Label>Mbiemri</Form.Label>
                <Form.Control
                  onChange={(e) => handleMbiemriChange(e.target.value)}
                  value={perdoruesi.mbiemri}
                  as="textarea"
                  placeholder="Mbiemri"
                />
              </Form.Group>
            </Form.Group>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>UserName</Form.Label>
              <Form.Control
                onChange={(e) => handleUserNameChange(e.target.value)}
                type="text"
                placeholder="Username"
                as="textarea"
                value={perdoruesi.username}
              />
            </Form.Group>
            <Form.Group>
              <Form.Label>Email</Form.Label>
              <Form.Control
                placeholder="Email"
                className="form-select"
                value={perdoruesi.email}
                onChange={(e) => handleEmailChange(e.target.value)}
              />
            </Form.Group>
            <Form.Group
              className="mb-3"
              controlId="exampleForm.ControlTextarea1"
            >
              <Form.Label>Nr.Kontaktit</Form.Label>
              <Form.Control
                placeholder="Nr.Kontaktit"
                className="form-select"
                value={perdoruesi.nrKontaktit}
                onChange={(e) => handleNumriChange(e.target.value)}
              />
            </Form.Group>
            <Form.Group
              className="mb-3"
              controlId="exampleForm.ControlTextarea1"
            >
              <Form.Label>Adresa</Form.Label>
              <Form.Control
                placeholder="Adresa"
                className="form-select"
                value={perdoruesi.adresa}
                onChange={(e) => handleAdresaChange(e.target.value)}
              />
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary">
            Anulo <FontAwesomeIcon icon={faXmark} />
          </Button>
          <Button style={{ backgroundColor: "#009879", border: "none" }}>
            Edito Produktin <FontAwesomeIcon icon={faPenToSquare} />
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  );
};

export default EditoTeDhenat;

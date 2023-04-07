import React, { useState } from "react";
import useFetch from "../../Hooks/useFetch";
import "./ProductTables.css";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";

const ProductTables = () => {
  const {
    data: products,
    isLoading,
    error,
  } = useFetch("https://localhost:7285/api/Produkti/Products");

  const [id, setId] = useState();
  const [foto, setFoto] = useState("");
  const [emriP, setEmriP] = useState("");
  const [qmimiP, setQmimi] = useState(0);
  const [show, setShow] = useState(false);

  const handleEmriPChange = (value) => {
    setEmriP(value);
  };

  const handleQmimiPChange = (value) => {
    setQmimi(value);
  };
  const handleFotoChange = (value) => {
    setFoto(value);
    console.log(value);
  };

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  function handleSubmit(e) {
    e.preventDefault();
    const info = { emriP, qmimiP, foto };

    fetch("https://localhost:7285/api/Produkti/Products", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(info),
    })
      .then(() => {
        console.log("Added");
        console.log(foto);
      })
      .catch((error) => {
        console.log(error);
      });
  }

  return (
    <div className="containerDashboardP">
      <Button
        style={{ backgroundColor: "#009879", border: "none", float: "right" }}
        className="mb-3"
        onClick={handleShow}
      >
        Shto Produktin
      </Button>

      <Modal show={show} onHide={handleClose}>
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
               value={foto}
                type="file"
                placeholder="Foto e  Produktit"
                onChange={(e) => handleFotoChange(e.target.value)}
    
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
          <Button variant="secondary" onClick={handleClose}>
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
      {error && <div>{error}</div>}
      {isLoading && <div>Loading...</div>}
      {products && (
        <table>
          <thead>
            <tr>
              <th className="emriP">Emri i Produktit</th>
              <th>Foto e Produktit</th>
              <th>Qmimi i Produktit</th>
              <th>Edit</th>
              <th>Delete</th>
            </tr>
          </thead>

          <tbody>
            {products.map((p) => (
              <tr key={p.ProduktiId}>
                <td>{p.emriProduktit}</td>
                <td>
                  <img
                    src={`${process.env.PUBLIC_URL}/img/products/${p.fotoProduktit}`}
                    width="50"
                    alt=""
                  />
                </td>
                <td>{p.qmimiProduktit}</td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
};

export default ProductTables;

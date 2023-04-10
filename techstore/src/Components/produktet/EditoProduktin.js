import { useState, useRef, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";

function EditoProduktin(props) {
  const [produkti, setProdukti] = useState([]);
  const foto = useRef(null);

  useEffect(() => {
    const shfaqProduktet = async () => {
      try {
        const produkti = await axios.get(`https://localhost:7285/api/Produkti/` + props.id);
        setProdukti(produkti.data);

      } catch (err) {
        console.log(err);
      }
    };

    shfaqProduktet();
  }, []);

  const handleEmriPChange = (value) => {
    setProdukti((prev) => ({ ...prev, emriProduktit: value }));
  };

  const handleQmimiPChange = (value) => {
    setProdukti((prev) => ({ ...prev, qmimiProduktit: value }));
  };
  const handleFotoChange = () => {
    const filePath = foto.current.value;
    const fileName = filePath.split("\\").pop();
    setProdukti((prev) => ({ ...prev, fotoProduktit: fileName }));
  };


  function handleSubmit() {


    axios.put(`https://localhost:7285/api/Produkti/` + props.id, produkti)
      .then(x => {
        console.log(x);
        props.setTipiMesazhit("success");
        props.setPershkrimiMesazhit("Produkti u Perditesua me sukses!")
        props.perditesoTeDhenat();
        props.hide();
        props.shfaqmesazhin();
      })
      .catch(error => {
        console.error('Error saving the product:', error);
        props.setTipiMesazhit("danger");
        props.setPershkrimiMesazhit("Ndodhi nje gabim gjate fshirjes se produktit!")
        props.perditesoTeDhenat();
        props.shfaqmesazhin();
      });

  }
  return (
    <>
      <Modal className="modal" show={props.show} onHide={props.hide}>
        <Modal.Header closeButton>
          <Modal.Title>Shto Produkt</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>Emri Produktit</Form.Label>
              <Form.Control
                onChange={(e) => handleEmriPChange(e.target.value)}
                value={produkti.emriProduktit}
                type="text"
                placeholder="Emri Produktit"
                autoFocus
              />
            </Form.Group>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>Foto Produktit</Form.Label>
              <Form.Control
                ref={foto}
                type="file"
                placeholder="Foto e Produktit"
                onChange={handleFotoChange}
                autoFocus
              />
            </Form.Group>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>Kompania</Form.Label>
              <Form.Control
                value={produkti.emriKategoris}
                type="text"
                placeholder="Kompania e Produktit"
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
                value={produkti.qmimiProduktit}
                type="number"
                placeholder="Qmimi i Produktit"
                autoFocus
              />
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={props.hide}>
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
  )
}

export default EditoProduktin;
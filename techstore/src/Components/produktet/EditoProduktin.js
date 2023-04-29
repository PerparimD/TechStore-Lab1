import { useState, useRef, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus, faXmark } from "@fortawesome/free-solid-svg-icons";
import { faPenToSquare } from '@fortawesome/free-solid-svg-icons';


function EditoProduktin(props) {
  const [produkti, setProdukti] = useState([]);
  const foto = useRef(null);
  const [kompanit, setKompanit] = useState([]);
  const [kategoria, setKategoria] = useState([]);

  useEffect(() => {
    const shfaqProduktet = async () => {
      try {
        const produkti = await axios.get(`https://localhost:7285/api/Produkti/` + props.id);
        setProdukti(produkti.data);

      } catch (err) {
        console.log(err);
      }
    };
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

    shfaqProduktet();
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
  const handleFotoChange = () => {
    const filePath = foto.current.value;
    const fileName = filePath.split("\\").pop();
    setProdukti((prev) => ({ ...prev, fotoProduktit: fileName }));
  };

  const handleKompaniaChange = (value) => {
    setProdukti((prev) => ({ ...prev, kompaniaId: value }));
  };


  const handleKategoriaChange = (value) => {
    setProdukti((prev) => ({ ...prev, kategoriaId: value }));
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
        props.setPershkrimiMesazhit("Ndodhi nje gabim gjate perditesimit te produktit!")
        props.perditesoTeDhenat();
        props.shfaqmesazhin();
      });

  }
  return (
    <>
      <Modal className="modal mt-0" show={props.show} onHide={props.hide}>
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
              <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                <Form.Label>Pershkrimi Produktit</Form.Label>
                <Form.Control
                  onChange={(e) => handlePershkrimiChange(e.target.value)}
                  value={produkti.pershkrimi}
                  as="textarea"
                  placeholder="Pershkrimi Produktit"
                />
              </Form.Group>
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
            <Form.Group>
              <Form.Label>Kompania</Form.Label>
              <select
                placeholder="Kompania e Produktit"
                className="form-select"
                value={produkti.kompaniaId}
                onChange={(e) => handleKompaniaChange(e.target.value)}
              >
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
              controlId="exampleForm.ControlTextarea1"
            >
              <Form.Label>Kategoria</Form.Label>
              <select
                placeholder="Kategoria e Produktit"
                className="form-select"
                value={produkti.kategoriaID}
                onChange={(e) => handleKategoriaChange(e.target.value)}
              >
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
            Anulo <FontAwesomeIcon icon={faXmark} />
          </Button>
          <Button
            style={{ backgroundColor: "#009879", border: "none" }}
            onClick={handleSubmit}
          >
            Edito Produktin <FontAwesomeIcon icon={faPenToSquare} />
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  )
}

export default EditoProduktin;
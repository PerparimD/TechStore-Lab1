import { useState, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlus, faXmark } from '@fortawesome/free-solid-svg-icons';

function ProduktiNeZbritje(props) {
  const [llojiKategoris, setLlojiKategoris] = useState("");
  const [pershkrimiKategoris, setPershkrimiKategoris] = useState("");
  const [produktet, setProduktet] = useState([]);
  const [perditeso, setPerditeso] = useState("");

  useEffect(() => {
    const vendosProduktet = async () => {
      try {
        const produktet = await axios.get(
          `https://localhost:7285/api/Produkti/Products`
        );
        setProduktet(produktet.data);

      } catch (err) {
        console.log(err);
      }
    };

    vendosProduktet();
  }, [perditeso]);

  const handleEmriChange = (value) => {
    setLlojiKategoris(value);
  };

  const handlePershkrimiChange = (value) => {
    setPershkrimiKategoris(value);
  };

  function handleSubmit() {
    axios.post('https://localhost:7285/api/Kategoria/shtoKategorin', {
      llojiKategoris: llojiKategoris,
      pershkrimiKategoris: pershkrimiKategoris
    })
      .then((response) => {
        console.log(response);
        props.setTipiMesazhit("success");
        props.setPershkrimiMesazhit("Kategoria u insertua me sukses!")
        props.perditesoTeDhenat();
        props.largo();
        props.shfaqmesazhin();
      })
      .catch((error) => {
        console.log(error);
      });

  }
  return (
    <Modal className="modalEditShto" show={props.shfaq} onHide={() => props.setMbyllFaturen()}>
      <Modal.Header closeButton>
        <Modal.Title>Shto Kategorine</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form>
          <Form.Group
            className="mb-3"
            controlId="exampleForm.ControlTextarea1"
          >
            <Form.Label>Vlen per</Form.Label>
            <select
              placeholder="Produkti"
              className="form-select"
              value={llojiKategoris}
              onChange={(e) => handleEmriChange(e.target.value)}
            >
              <option defaultValue value={0} key={0}>
                Vlene per te gjitha produktet
              </option>
              {produktet.map((item) => {
                return (
                  <option key={item.produktiId} value={item.produktiId} qmimiAktual={item.qmimiProduktit}>{item.emriProduktit}</option>
                );
              })}
            </select>
          </Form.Group>
          <Form.Group
            className="mb-3"
            controlId="exampleForm.ControlTextarea1"
          >
            <Form.Label>Pershkrimi Kategoris</Form.Label>
            <Form.Control
              onChange={(e) => handlePershkrimiChange(e.target.value)}
              value={pershkrimiKategoris}
              type="text"
              placeholder="Pershkrimi Kategoris"
              autoFocus
            />
          </Form.Group>
        </Form>
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={() => props.setMbyllFaturen()}>
          Anulo <FontAwesomeIcon icon={faXmark} />
        </Button>
        <Button
          className="Butoni"
          onClick={handleSubmit}
        >
          Shto Kategorine <FontAwesomeIcon icon={faPlus} />
        </Button>
      </Modal.Footer>
    </Modal>
  )
}

export default ProduktiNeZbritje;
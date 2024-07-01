import { useState, useEffect } from "react";
import axios from "axios";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlus, faXmark } from '@fortawesome/free-solid-svg-icons';
import Mesazhi from "../../layout/Mesazhi";

function ProduktiNeZbritje(props) {
  const [produkti, setProdukti] = useState("");
  const [qmimiBleresProduktit, setQmimiBleresProduktit] = useState(0.00);
  const [qmimiShitesProduktit, setQmimiShitesProduktit] = useState(0.00);
  const [qmimiZbritur, setQmimiZbritur] = useState(0.00);
  const [dataSkadimit, setDataSkadimit] = useState(new Date().toISOString().substring(0, 10));
  const [produktet, setProduktet] = useState([]);
  const [perditeso, setPerditeso] = useState("");
  const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
  const [tipiMesazhit, setTipiMesazhit] = useState("");
  const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");
  const [zbritjaNeRregull, setZbritjaNeRregull] = useState(false);
  const [kaZbritje, setKaZbritje] = useState(false);

  const getToken = localStorage.getItem("token");

  const authentikimi = {
    headers: {
      Authorization: `Bearer ${getToken}`,
    },
  };

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

  useEffect(() => {
    const vendosDetajetProduktit = async () => {
      try {
        await axios.get(
          `https://localhost:7285/api/Produkti/${produkti}`, authentikimi
        ).then((response) => {
          setQmimiBleresProduktit((response.data.qmimiBleres).toFixed(2));
          setQmimiShitesProduktit((response.data.qmimiProduktit).toFixed(2));
          if (response.data.qmimiMeZbritjeProduktit != null) {
            setQmimiZbritur(response.data.qmimiMeZbritjeProduktit);
            setKaZbritje(true);
            setPershkrimiMesazhit("Ky produkt ka Zbritje!");
            setTipiMesazhit("danger");
            setShfaqMesazhin(true);
          }
        });
      } catch (err) {
        console.log(err);
      }
    };

    vendosDetajetProduktit();
  }, [perditeso, produkti]);

  const handleProduktiChange = (value) => {
    setProdukti(value);
    setKaZbritje(false);
    setQmimiZbritur(0);
    const element = document.getElementById("dataSkadimit");
    element.focus();
  };

  const handleZbritja = (value) => {
    const element = document.getElementById("qmimiZbritur");
    if (value <= 0.01) {
      setQmimiZbritur(0.01);
      setZbritjaNeRregull(false);
      element.focus();
    } else if (value >= parseInt(qmimiShitesProduktit)) {
      setQmimiZbritur(value);
      setPershkrimiMesazhit("Qmimi i zbritur duhet te jete me i vogel se qmimi aktual!");
      setTipiMesazhit("danger");
      setShfaqMesazhin(true);
      setZbritjaNeRregull(false);
      element.focus();
    } else {
      setQmimiZbritur(value);
      setZbritjaNeRregull(true);
    }
  }

  function handleSubmit() {
    if (zbritjaNeRregull === true && kaZbritje === false) {
      axios.post('https://localhost:7285/api/ZbritjaQmimitProduktit/shtoZbritjenProduktit', {
        produktiId: produkti,
        qmimiPaZbritjeProduktit: qmimiShitesProduktit,
        qmimiMeZbritjeProduktit: qmimiZbritur,
        dataSkadimit: dataSkadimit
      }, authentikimi)
        .then(() => {
          props.setTipiMesazhit("success");
          props.setPershkrimiMesazhit("Zbritja u shtua me sukses!")
          props.setPerditeso(Date.now());
          props.mbyllZbritjen();
          props.shfaqmesazhin();
        })
        .catch((error) => {
          console.log(error);
        });
    } else if (kaZbritje === true) {
      setPershkrimiMesazhit("Ky produkt ka Zbritje!");
      setTipiMesazhit("danger");
      setShfaqMesazhin(true);
    }
    else {
      handleZbritja(qmimiZbritur);
    }
  }
  return (
    <>
      {shfaqMesazhin &&
        <Mesazhi
          setShfaqMesazhin={setShfaqMesazhin}
          pershkrimi={pershkrimiMesazhit}
          tipi={tipiMesazhit}
        />
      }
      <Modal className="modalEditShto" show={props.shfaq} onHide={() => props.mbyllZbritjen()} size="lg">
        <Modal.Header closeButton>
          <Modal.Title>Shto Zbritjen</Modal.Title>
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
                value={produkti}
                onChange={(e) => handleProduktiChange(e.target.value)}
              >
                {produktet.map((item) => {
                  return (
                    <option key={item.produktiId} value={item.produktiId}>{item.emriProduktit}</option>
                  );
                })}
              </select>
            </Form.Group>
            <Form.Group
              className="mb-3"
              controlId="exampleForm.ControlTextarea1"
            >
              <Form.Label>Qmimi Bleres</Form.Label>
              <Form.Control
                value={qmimiBleresProduktit + " €"}
                type="text"
                placeholder="Qmimi Bleres"
                disabled
              />
            </Form.Group>
            <Form.Group
              className="mb-3"
              controlId="exampleForm.ControlTextarea1"
            >
              <Form.Label>Qmimi Shites</Form.Label>
              <Form.Control
                value={qmimiShitesProduktit + " €"}
                type="text"
                placeholder="Qmimi Shites"
                disabled
              />
            </Form.Group>
            <Form.Group className="mb-3" controlId="dataSkadimit">
              <Form.Label>Data e Perfundimit te Zbritjes</Form.Label>
              <Form.Control
                onChange={(e) => setDataSkadimit(e.target.value)}
                onFocus={(e) => e.target.select()}
                value={dataSkadimit}
                type="date"
                min={new Date().toISOString().substring(0, 10)}
                onInput={(e) => {
                  const minDate = new Date().toISOString().substring(0, 10); // get today's date
                  if (e.target.value < minDate) {
                    e.target.value = minDate; // set the date input value to today
                  }
                }}
                disabled={kaZbritje}
                autoFocus
              />
            </Form.Group>

            <Form.Group
              className="mb-3"
              controlId="qmimiZbritur"
            >
              <Form.Label>Qmimi me Zbritje</Form.Label>
              <Form.Control
                onChange={(e) =>
                  handleZbritja(e.target.value)
                }
                onFocus={(e) => e.target.select()}
                value={qmimiZbritur}
                type="text"
                pattern="[0-9]+([,.][0-9]+)?"
                placeholder="Qmimi me Zbritje"
                min={1}
                max={qmimiShitesProduktit - 0.01}
                disabled={kaZbritje}
              />
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={() => props.mbyllZbritjen()}>
            Anulo <FontAwesomeIcon icon={faXmark} />
          </Button>
          <Button
            className="Butoni"
            onClick={handleSubmit}
          >
            Vendosni Zbritjen <FontAwesomeIcon icon={faPlus} />
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  )
}

export default ProduktiNeZbritje;
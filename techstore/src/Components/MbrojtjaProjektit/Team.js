import { useEffect, useState } from "react";
import classes from "../produktet/kategorit/Styles/TabelaEKategorive.module.css";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faBan,
  faPenToSquare,
  faPlus,
  faClose,
  faXmark,
} from "@fortawesome/free-solid-svg-icons";
import { useNavigate } from "react-router-dom";
import { Table, Button, Modal, Form } from "react-bootstrap";

function Team() {
  const [ekipet, setEkipet] = useState([]);
  const [perditeso, setPerditeso] = useState("");
  const [shto, setShto] = useState(false);
  const [edito, setEdito] = useState(false);
  const [fshij, setFshij] = useState(false);
  const [id, setId] = useState(0);

  const navigate = useNavigate();

  useEffect(() => {
    const shfaqEkipet = async () => {
      try {
        const ekipet = await axios.get(
          "https://localhost:7285/api/Team/ShfaqEkipet"
        );
        setEkipet(ekipet.data);
      } catch (err) {
        console.log(err);
      }
    };

    shfaqEkipet();
  }, [perditeso]);

  // SHTO
  const [name, setName] = useState("");
  const handleNameChange = (value) => {
    setName(value);
  };
  // SHTO

  // Edito
  const [ekipi, setEkipi] = useState([]);

  const handleEmriBankes = (value) => {
    setEkipi((prev) => ({ ...prev, name: value }));
  };

  useEffect(() => {
    const vendosTeDhenat = async () => {
      try {
        const teDhenatEkipit = await axios.get(
          `https://localhost:7285/api/Team/ShfaqEkipinNgaID?TeamId=${id}`
        );
        setEkipi(teDhenatEkipit.data);
      } catch (e) {
        console.error(e);
      }
    };

    vendosTeDhenat();
  }, [edito]);
  // Edito

  const handleShow = () => setShto(true);

  const handleEdito = (id) => {
    setEdito(true);
    setId(id);
  };

  const handleFshij = (id) => {
    setFshij(true);
    setId(id);
  };

  const handleShtoEkipin = async () => {
    await axios
      .post("https://localhost:7285/api/Team/ShtoEkipin", { name: name })
      .then(() => {
        setShto(false);
        setPerditeso(Date.now());
        setName("");
      })
      .catch((e) => {
        console.error(e);
      });
  };

  const handlePerditesoEkipin = async () => {
    await axios
      .put(
        `https://localhost:7285/api/Team/PerditesoEkipen?TeamId=${id}`,
        ekipi
      )
      .then(() => {
        setEdito(false);
        setPerditeso(Date.now());
      })
      .catch((e) => {
        console.error(e);
      });
  };

  const handleFshijEkipin = async () => {
    await axios
      .delete(`https://localhost:7285/api/Team/FshijEkipen?TeamId=${id}`)
      .then(() => {
        setFshij(false);
        setPerditeso(Date.now());
      })
      .catch((e) => {
        console.error(e);
      });
  };

  return (
    <div className={classes.containerDashboardP}>
      {shto && (
        <Modal
          className="modalEditShto"
          show={shto}
          onHide={() => setShto(false)}>
          <Modal.Header closeButton>
            <Modal.Title>Shto Ekipin</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>
                  Emri Ekipit<span style={{ color: "red" }}>*</span>
                </Form.Label>
                <Form.Control
                  onChange={(e) => handleNameChange(e.target.value)}
                  value={name}
                  type="text"
                  placeholder="Emri Ekipit"
                  autoFocus
                />
              </Form.Group>
            </Form>
          </Modal.Body>
          <Modal.Footer>
            <Button variant="secondary" onClick={() => setShto(false)}>
              Close <FontAwesomeIcon icon={faXmark} />
            </Button>
            <Button
              style={{ backgroundColor: "#009879", border: "none" }}
              onClick={handleShtoEkipin}>
              Save Changes
            </Button>
          </Modal.Footer>
        </Modal>
      )}
      {edito && (
        <Modal
          className="modalEditShto"
          show={edito}
          onHide={() => setEdito(false)}>
          <Modal.Header closeButton>
            <Modal.Title>Edito Ekipin</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>ID Ekipit</Form.Label>
                <Form.Control type="text" value={ekipi.teamId} disabled />
              </Form.Group>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>Emri Ekipit</Form.Label>
                <Form.Control
                  onChange={(e) => handleEmriBankes(e.target.value)}
                  value={ekipi.name}
                  type="text"
                  placeholder="Emri Ekipit"
                  autoFocus
                />
              </Form.Group>
            </Form>
          </Modal.Body>
          <Modal.Footer>
            <Button variant="secondary" onClick={() => setEdito(false)}>
              Anulo <FontAwesomeIcon icon={faXmark} />
            </Button>
            <Button
              style={{ backgroundColor: "#009879", border: "none" }}
              onClick={handlePerditesoEkipin}>
              Edito Ekipin <FontAwesomeIcon icon={faPenToSquare} />
            </Button>
          </Modal.Footer>
        </Modal>
      )}
      {fshij && (
        <Modal show={fshij} onHide={() => setFshij(false)}>
          <Modal.Header closeButton>
            <Modal.Title style={{ color: "red" }}>Largo Ekipin</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <h6>A jeni te sigurt qe deshironi ta fshini kete Ekip?</h6>
          </Modal.Body>
          <Modal.Footer>
            <Button variant="secondary" onClick={() => setFshij(false)}>
              Anulo <FontAwesomeIcon icon={faXmark} />
            </Button>
            <Button variant="danger" onClick={handleFshijEkipin}>
              Largo Ekipin <FontAwesomeIcon icon={faBan} />
            </Button>
          </Modal.Footer>
        </Modal>
      )}
      <>
        <h1 className="title">Lista e Ekipeve</h1>
        <Button className="mb-3 Butoni" onClick={handleShow}>
          Shto Ekipin <FontAwesomeIcon icon={faPlus} />
        </Button>

        <Table>
          <thead>
            <tr>
              <th>ID Ekipi</th>
              <th>Emri Ekipit</th>
              <th>Funksione</th>
            </tr>
          </thead>
          <tbody>
            {ekipet.map((k) => (
              <tr key={k.teamId}>
                <td>{k.teamId}</td>
                <td>{k.name}</td>
                <td>
                  <Button
                    style={{ marginRight: "0.5em" }}
                    variant="success"
                    onClick={() => handleEdito(k.teamId)}>
                    <FontAwesomeIcon icon={faPenToSquare} />
                  </Button>
                  <Button
                    variant="danger"
                    onClick={() => handleFshij(k.teamId)}>
                    <FontAwesomeIcon icon={faBan} />
                  </Button>
                </td>
              </tr>
            ))}
          </tbody>
        </Table>
      </>
    </div>
  );
}

export default Team;

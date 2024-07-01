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

function Planet212257449() {
  const [planetet, setPlanetet] = useState([]);
  const [perditeso, setPerditeso] = useState("");
  const [shto, setShto] = useState(false);
  const [edito, setEdito] = useState(false);
  const [fshij, setFshij] = useState(false);
  const [id, setId] = useState(0);

  const navigate = useNavigate();

  useEffect(() => {
    const shfaqPlanetet = async () => {
      try {
        const planetet = await axios.get(
          "https://localhost:7285/api/Planet212257449/ShfaqPlanetet"
        );
        setPlanetet(planetet.data);
      } catch (err) {
        console.log(err);
      }
    };

    shfaqPlanetet();
  }, [perditeso]);

  // SHTO
  const [name, setName] = useState("");
  const [type, setType] = useState("");
  const handleNameChange = (value) => {
    setName(value);
  };
  const handleTypeChange = (value) => {
    setType(value);
  };
  // SHTO

  // Edito
  const [planeti, setPlaneti] = useState([]);

  const handleName = (value) => {
    setPlaneti((prev) => ({ ...prev, name: value }));
  };

  const handleType = (value) => {
    setPlaneti((prev) => ({ ...prev, type: value }));
  };

  useEffect(() => {
    const vendosTeDhenat = async () => {
      try {
        const teDhenatPlaneti = await axios.get(
          `https://localhost:7285/api/Planet212257449/ShfaqPlanetinNgaID?PlanetiId=${id}`
        );
        setPlaneti(teDhenatPlaneti.data);
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

  const handleShtoPlanetin = async () => {
    await axios
      .post("https://localhost:7285/api/Planet212257449/ShtoPlanetin", {
        name: name,
        type: type,
      })
      .then(() => {
        setShto(false);
        setName("");
        setType("");
        setPerditeso(Date.now());
      })
      .catch((e) => {
        console.error(e);
      });
  };

  const handlePerditesoPlanetin = async () => {
    await axios
      .put(
        `https://localhost:7285/api/Planet212257449/PerditesoPlanetin?PlanetiId=${id}`,
        planeti
      )
      .then(() => {
        setEdito(false);
        setPerditeso(Date.now());
      })
      .catch((e) => {
        console.error(e);
      });
  };

  const handleFshijPlanetin = async () => {
    await axios
      .delete(
        `https://localhost:7285/api/Planet212257449/FshijPlanetin?PlanetiId=${id}`
      )
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
            <Modal.Title>Shto Planetin</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>
                  Emri Planetit<span style={{ color: "red" }}>*</span>
                </Form.Label>
                <Form.Control
                  onChange={(e) => handleNameChange(e.target.value)}
                  value={name}
                  type="text"
                  placeholder="Emri Planetit"
                  autoFocus
                />
              </Form.Group>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>
                  Tipi Planetit<span style={{ color: "red" }}>*</span>
                </Form.Label>
                <Form.Control
                  onChange={(e) => handleTypeChange(e.target.value)}
                  value={type}
                  type="text"
                  placeholder="Tipi Planetit"
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
              onClick={handleShtoPlanetin}>
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
            <Modal.Title>Edito Planetin</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>ID Planetit</Form.Label>
                <Form.Control type="text" value={planeti.planetId} disabled />
              </Form.Group>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>Emri Planetit</Form.Label>
                <Form.Control
                  onChange={(e) => handleName(e.target.value)}
                  value={planeti.name}
                  type="text"
                  placeholder="Emri Planetit"
                  autoFocus
                />
              </Form.Group>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>Tipi Planetit</Form.Label>
                <Form.Control
                  onChange={(e) => handleType(e.target.value)}
                  value={planeti.type}
                  type="text"
                  placeholder="Tipi Planetit"
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
              onClick={handlePerditesoPlanetin}>
              Edito Planetin <FontAwesomeIcon icon={faPenToSquare} />
            </Button>
          </Modal.Footer>
        </Modal>
      )}
      {fshij && (
        <Modal show={fshij} onHide={() => setFshij(false)}>
          <Modal.Header closeButton>
            <Modal.Title style={{ color: "red" }}>Largo Planetin</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <h6>A jeni te sigurt qe deshironi ta fshini kete Planet?</h6>
          </Modal.Body>
          <Modal.Footer>
            <Button variant="secondary" onClick={() => setFshij(false)}>
              Anulo <FontAwesomeIcon icon={faXmark} />
            </Button>
            <Button variant="danger" onClick={handleFshijPlanetin}>
              Largo Planetin <FontAwesomeIcon icon={faBan} />
            </Button>
          </Modal.Footer>
        </Modal>
      )}
      <>
        <h1 className="title">Lista e Planeteve</h1>
        <Button className="mb-3 Butoni" onClick={handleShow}>
          Shto Planetin <FontAwesomeIcon icon={faPlus} />
        </Button>

        <Table>
          <thead>
            <tr>
              <th>ID Planetit</th>
              <th>Emri Planetit</th>
              <th>Tipi Planetit</th>
              <th>Funksione</th>
            </tr>
          </thead>
          <tbody>
            {planetet.map((k) => (
              <tr key={k.planetId}>
                <td>{k.planetId}</td>
                <td>{k.name}</td>
                <td>{k.type}</td>
                <td>
                  <Button
                    style={{ marginRight: "0.5em" }}
                    variant="success"
                    onClick={() => handleEdito(k.planetId)}>
                    <FontAwesomeIcon icon={faPenToSquare} />
                  </Button>
                  <Button
                    variant="danger"
                    onClick={() => handleFshij(k.planetId)}>
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

export default Planet212257449;

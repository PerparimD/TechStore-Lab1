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

function Player() {
  const [lojtaret, setLojtaret] = useState([]);
  const [perditeso, setPerditeso] = useState("");
  const [shto, setShto] = useState(false);
  const [edito, setEdito] = useState(false);
  const [fshij, setFshij] = useState(false);
  const [id, setId] = useState(0);

  const navigate = useNavigate();

  useEffect(() => {
    const shfaqLojtaret = async () => {
      try {
        const lojtaret = await axios.get(
          "https://localhost:7285/api/Player/ShfaqLojtaret"
        );
        setLojtaret(lojtaret.data);
      } catch (err) {
        console.log(err);
      }
    };

    shfaqLojtaret();
  }, [perditeso]);

  // SHTO
  const [ekipet, setEkipet] = useState([]);

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

  const [name, setName] = useState("");
  const [number, setNumber] = useState("");
  const [birthYear, setBirthYear] = useState("");
  const [team, setTeam] = useState("");

  const handleNameChange = (value) => {
    setName(value);
  };
  const handleNumberChange = (value) => {
    setNumber(value);
  };
  const handleBirthYearChange = (value) => {
    setBirthYear(value);
  };
  const handleTeamChange = (value) => {
    setTeam(value);
  };
  // SHTO

  // Edito
  const [lojtari, setLojtari] = useState([]);

  const handleName = (value) => {
    setLojtari((prev) => ({ ...prev, name: value }));
  };

  const handleNumber = (value) => {
    setLojtari((prev) => ({ ...prev, number: value }));
  };
  const handleBirthYear = (value) => {
    setLojtari((prev) => ({ ...prev, birthYear: value }));
  };
  const handleTeam = (value) => {
    setLojtari((prev) => ({ ...prev, teamId: value }));
  };

  useEffect(() => {
    const vendosTeDhenat = async () => {
      try {
        const teDhenatLojtarit = await axios.get(
          `https://localhost:7285/api/Player/ShfaqLojtarinNgaID?PlayerId=${id}`
        );
        setLojtari(teDhenatLojtarit.data);
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

  const handleShtoLojtarin = async () => {
    await axios
      .post("https://localhost:7285/api/Player/ShtoLojtarin", {
        name: name,
        number: number,
        birthYear: birthYear,
        teamId: team,
      })
      .then(() => {
        setShto(false);
        setPerditeso(Date.now());
        setName("");
        setNumber(0);
        setBirthYear(0);
        setTeam("");
      })
      .catch((e) => {
        console.error(e);
      });
  };

  const handlePerditesoLojtarin = async () => {
    await axios
      .put(
        `https://localhost:7285/api/Player/PerditesoLojtarin?PlayerId=${id}`,
        lojtari
      )
      .then(() => {
        setEdito(false);
        setPerditeso(Date.now());
      })
      .catch((e) => {
        console.error(e);
      });
  };

  const handleFshijLojtarin = async () => {
    await axios
      .delete(`https://localhost:7285/api/Player/FshijLojtarin?PlayerId=${id}`)
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
            <Modal.Title>Shto lojtarin</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>Emri Lojtarit</Form.Label>
                <Form.Control
                  onChange={(e) => handleNameChange(e.target.value)}
                  value={name}
                  type="text"
                  placeholder="Emri Lojtarit"
                  autoFocus
                />
              </Form.Group>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>Numri Lojtarit</Form.Label>
                <Form.Control
                  onChange={(e) => handleNumberChange(e.target.value)}
                  value={number}
                  type="number"
                  placeholder="Numri i Lojtarit"
                />
              </Form.Group>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>Viti Lindjes</Form.Label>
                <Form.Control
                  onChange={(e) => handleBirthYearChange(e.target.value)}
                  value={birthYear}
                  type="number"
                  placeholder="Viti Lindjes"
                />
              </Form.Group>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlTextarea1">
                <Form.Label>Ekipa</Form.Label>
                <select
                  placeholder="Kompania e Produktit"
                  className="form-select"
                  value={team}
                  onChange={(e) => handleTeamChange(e.target.value)}>
                  <option defaultValue disabled value="">
                    Ekipa e lojtarit
                  </option>
                  {ekipet.map((item) => {
                    return (
                      <option key={item.teamId} value={item.teamId}>
                        {item.name}
                      </option>
                    );
                  })}
                </select>
              </Form.Group>
            </Form>
          </Modal.Body>
          <Modal.Footer>
            <Button variant="secondary" onClick={() => setShto(false)}>
              Anulo <FontAwesomeIcon icon={faXmark} />
            </Button>
            <Button
              style={{ backgroundColor: "#009879", border: "none" }}
              onClick={handleShtoLojtarin}>
              Shto Lojtarin
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
            <Modal.Title>Edito lojtarin</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>ID lojtarit</Form.Label>
                <Form.Control type="text" value={lojtari.playerId} disabled />
              </Form.Group>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>Emri Lojtarit</Form.Label>
                <Form.Control
                  onChange={(e) => handleName(e.target.value)}
                  value={lojtari.name}
                  type="text"
                  placeholder="Emri lojtarit"
                  autoFocus
                />
              </Form.Group>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>Numri Lojtarit</Form.Label>
                <Form.Control
                  onChange={(e) => handleNumber(e.target.value)}
                  value={lojtari.number}
                  type="number"
                  placeholder="Numri lojtarit"
                />
              </Form.Group>
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1">
                <Form.Label>Viti Lindjes</Form.Label>
                <Form.Control
                  onChange={(e) => handleBirthYear(e.target.value)}
                  value={lojtari.birthYear}
                  type="number"
                  placeholder="Viti Lindjes"
                />
              </Form.Group>
              <Form.Group>
                <Form.Label>Ekipa lojtarit</Form.Label>
                <select
                  placeholder="Banka lojtarit"
                  className="form-select"
                  value={lojtari.teamId}
                  onChange={(e) => handleTeam(e.target.value)}>
                  <option selected disabled hidden>
                    {lojtari.team && lojtari.team.name}
                  </option>
                  {ekipet.map((item) => {
                    return (
                      <option key={item.teamId} value={item.teamId}>
                        {item.name}
                      </option>
                    );
                  })}
                </select>
              </Form.Group>
            </Form>
          </Modal.Body>
          <Modal.Footer>
            <Button variant="secondary" onClick={() => setEdito(false)}>
              Anulo <FontAwesomeIcon icon={faXmark} />
            </Button>
            <Button
              style={{ backgroundColor: "#009879", border: "none" }}
              onClick={handlePerditesoLojtarin}>
              Edito Lojtarin <FontAwesomeIcon icon={faPenToSquare} />
            </Button>
          </Modal.Footer>
        </Modal>
      )}
      {fshij && (
        <Modal show={fshij} onHide={() => setFshij(false)}>
          <Modal.Header closeButton>
            <Modal.Title style={{ color: "red" }}>Largo lojtarin</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <h6>A jeni te sigurt qe deshironi ta fshini kete Lojtar?</h6>
          </Modal.Body>
          <Modal.Footer>
            <Button variant="secondary" onClick={() => setFshij(false)}>
              Anulo <FontAwesomeIcon icon={faXmark} />
            </Button>
            <Button variant="danger" onClick={handleFshijLojtarin}>
              Largo lojtarin <FontAwesomeIcon icon={faBan} />
            </Button>
          </Modal.Footer>
        </Modal>
      )}
      <>
        <h1 className="title">Lista e Lojtareve</h1>
        <Button className="mb-3 Butoni" onClick={handleShow}>
          Shto Lojtarin <FontAwesomeIcon icon={faPlus} />
        </Button>

        <Table>
          <thead>
            <tr>
              <th>ID Lojtarit</th>
              <th>Emri</th>
              <th>Numri</th>
              <th>Viti Lindjes</th>
              <th>Ekipa lojtarit</th>
              <th>Funksione</th>
            </tr>
          </thead>
          <tbody>
            {lojtaret.map((k) => (
              <tr key={k.playerId}>
                <td>{k.playerId}</td>
                <td>{k.name}</td>
                <td>{k.number}</td>
                <td>{k.birthYear}</td>
                <td>{k.team && k.team.name}</td>
                <td>
                  <Button
                    style={{ marginRight: "0.5em" }}
                    variant="success"
                    onClick={() => handleEdito(k.playerId)}>
                    <FontAwesomeIcon icon={faPenToSquare} />
                  </Button>
                  <Button
                    variant="danger"
                    onClick={() => handleFshij(k.playerId)}>
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

export default Player;

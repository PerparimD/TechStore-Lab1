import React, { useState, useEffect } from "react";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import { Helmet } from "react-helmet";
import AdminDashboard from "../Components/Dashboard/AdminDashboard";
import "./Styles/Dashboard.css";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { TailSpin } from "react-loader-spinner";
import PorositeUserit from "../Components/Dashboard/PorositeUserit";
import PagesaMeSukses from "../Components/produktet/cart/Checkout/PagesaMeSukses";
import MesazhetUserit from "../Components/Dashboard/MesazhetUserit";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faXmark } from "@fortawesome/free-solid-svg-icons";
import { faPenToSquare } from "@fortawesome/free-solid-svg-icons";
import EditoTeDhenat from "../Components/Dashboard/EditoTeDhenat";

const Dashboard = () => {
  const [shfaqAdmin, setShfaqAdmin] = useState(false);
  const [teDhenat, setTeDhenat] = useState([]);
  const [perditeso, setPerditeso] = useState("");
  const [loading, setLoading] = useState(true);
  const [shfaqPorosite, setShfaqPorosite] = useState(false);
  const [shfaqDetajet, setShfaqDetajet] = useState(false);
  const [shfaqMesazhet, setShfaqMesazhet] = useState(false);
  const [nrFatures, setNumriFatures] = useState(0);
  const [show, setShow] = useState(false);
  const [edito, setEdito] = useState(false);
  const [emri, setEmri] = useState("");
  const [mbiemri, setMbiemri] = useState("");
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [adresa, setAdresa] = useState("");
  const [nrKontaktit, setNrKontaktit] = useState("");
  const [id, setId] = useState();

  const navigate = useNavigate();

  const getID = localStorage.getItem("id");

  const getToken = localStorage.getItem("token");

  const authentikimi = {
    headers: {
      Authorization: `Bearer ${getToken}`,
    },
  };

  useEffect(() => {
    if (getID) {
      const vendosTeDhenat = async () => {
        try {
          const perdoruesi = await axios.get(
            `https://localhost:7285/api/Perdoruesi/shfaqSipasID?idUserAspNet=${getID}`, authentikimi
          );
          setTeDhenat(perdoruesi.data);
        } catch (err) {
          console.log(err);
        } finally {
          setLoading(false);
        }
      };

      vendosTeDhenat();
    } else {
      navigate("/login");
    }
  }, [perditeso]);

  const perditesoTeDhenat = async () => {
    try {
      const info = {
        emri: emri,
        mbiemri: mbiemri,
        email: email,
        username: username,
        teDhenatPerdoruesit: {
          nrKontaktit: nrKontaktit,
          adresa: adresa,
        },
      }
      fetch("https://localhost:7285/api/Perdoruesi/perditesoPerdorues/" + id, {
        method: 'PUT',
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(info)
      }).then(() => { console.log("Updated") })

    } catch (err) {
      console.log(err);
    } finally {
      setLoading(false);
    }
  };

  const handleShfaqPorosite = () => {
    setShfaqAdmin(false);
    setShfaqDetajet(false);
    setShfaqPorosite(true);
    setShfaqMesazhet(false);
  };

  const handleShfaqAdminDashboard = () => {
    setShfaqAdmin(true);
    setShfaqDetajet(false);
    setShfaqPorosite(false);
    setShfaqMesazhet(false);
  };

  const handleShfaqMesazhet = () => {
    setShfaqAdmin(false);
    setShfaqDetajet(false);
    setShfaqPorosite(false);
    setShfaqMesazhet(true);
  };

  const handleEditoMbyll = () => setEdito(false);

  const handleClose = () => {
    setShow(false);
  };
  const handleShow = (ID) => {
    setId(ID);
    setShow(true);
  };

  const handleEmriChange = (value) => {
    setEmri(value);
  };

  const handleMbiemriChange = (value) => {
    setMbiemri(value);
  };

  const handleEmailChange = (value) => {
    setEmail(value);
  };

  const handleusernameChange = (value) => {
    setUsername(value);
  };

  const handlenrKontaktitChange = (value) => {
    setNrKontaktit(value);
  };

  const handleAdresaChange = (value) => {
    setAdresa(value);
  };


  return (
    <div className="dashboard">
      <Helmet>
        <title>Dashboard | Tech Store</title>
      </Helmet>
      <NavBar />

      {edito && (
        <EditoTeDhenat show={handleShow} hide={handleEditoMbyll} id={getID} />
      )}

      {loading ? (
        <div className="Loader">
          <TailSpin
            height="80"
            width="80"
            color="#009879"
            ariaLabel="tail-spin-loading"
            radius="1"
            wrapperStyle={{}}
            wrapperClass=""
            visible={true}
          />
        </div>
      ) : (
        <div class="containerDashboard">
          <h3 class="titulliPershkrim">
            Miresevini {teDhenat.perdoruesi.emri}
          </h3>
          <h4 className="info">Te dhenat personale:</h4>
          <table>
            <tr>
              <td>
                <strong>Emri:</strong>
              </td>
              <td>{teDhenat.perdoruesi.emri}</td>
            </tr>
            <tr>
              <td>
                <strong>Mbiemri:</strong>
              </td>
              <td>{teDhenat.perdoruesi.mbiemri}</td>
            </tr>
            <tr>
              <td>
                <strong>Username:</strong>
              </td>
              <td>{teDhenat.perdoruesi.username}</td>
            </tr>
            <tr>
              <td>
                <strong>Email:</strong>
              </td>
              <td>{teDhenat.perdoruesi.email}</td>
            </tr>
            <tr>
              <td>
                <strong>Numri Kontaktit:</strong>
              </td>
              <td>{teDhenat.perdoruesi.teDhenatPerdoruesit.nrKontaktit}</td>
            </tr>
            <tr>
              <td>
                <strong>Adresa: </strong>
              </td>
              <td>
                {teDhenat.perdoruesi.teDhenatPerdoruesit.adresa},{" "}
                {teDhenat.perdoruesi.teDhenatPerdoruesit.qyteti},{" "}
                {teDhenat.perdoruesi.teDhenatPerdoruesit.shteti}{" "}
                {teDhenat.perdoruesi.teDhenatPerdoruesit.zipKodi}
              </td>
            </tr>
          </table>
          <div class="butonatDiv">
            <button
              onClick={() => handleShow(teDhenat.perdoruesi.userId)}
              class="button"
            >
              Perditeso te Dhenat <i class="fa-solid">&#xf4ff;</i>
            </button>
            <button onClick={handleShfaqPorosite} class="button">
              Porosite e tua
            </button>
            {(teDhenat.rolet.includes("Admin") ||
              teDhenat.rolet.includes("Menaxher")) && (
                <button class="button" onClick={handleShfaqAdminDashboard}>
                  Admin Dashboard
                </button>
              )}
            {teDhenat.rolet.includes("User") && (
              <button class="button" onClick={handleShfaqMesazhet}>
                Mesazhet e tua
              </button>
            )}
          </div>
          {shfaqPorosite && (
            <PorositeUserit
              setShfaqDetajet={() => setShfaqDetajet(true)}
              setNumriFatures={(e) => setNumriFatures(e)}
              setShfaqPorosite={() => setShfaqPorosite(false)}
              idUseri={
                teDhenat && teDhenat.perdoruesi && teDhenat.perdoruesi.userId
              }
            />
          )}
          {shfaqMesazhet && (
            <MesazhetUserit
              setShfaqMesazhet={() => setShfaqMesazhet(false)}
              idUseri={
                teDhenat && teDhenat.perdoruesi && teDhenat.perdoruesi.userId
              }
            />
          )}
        </div>
      )}

      {shfaqAdmin && (
        <AdminDashboard setShfaqAdmin={() => setShfaqAdmin(false)} />
      )}
      {shfaqDetajet && (
        <PagesaMeSukses
          handleMbyll={() => {
            setShfaqDetajet(false);
            setShfaqPorosite(true);
          }}
          nrFatures={nrFatures}
        />
      )}

      <Footer />

      <Modal className="modalEditShto" show={show} onHide={handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Perditeso Te Dhenat</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>Emri </Form.Label>
              <Form.Control
                onChange={(e) => handleEmriChange(e.target.value)}
                type="text"
                placeholder="Emri"
                value={emri}
              />
              <Form.Group
                className="mb-3"
                controlId="exampleForm.ControlInput1"
              >
                <Form.Label>Mbiemri</Form.Label>
                <Form.Control
                  onChange={(e) => handleMbiemriChange(e.target.value)}
                  as="textarea"
                  placeholder="Mbiemri"
                  value={mbiemri}
                />
              </Form.Group>
            </Form.Group>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>UserName</Form.Label>
              <Form.Control
                onChange={(e) => handleusernameChange(e.target.value)}
                type="text"
                placeholder="Username"
                value={username}
              />
            </Form.Group>
            <Form.Group>
              <Form.Label>Email</Form.Label>
              <Form.Control
                placeholder="Email"
                onChange={(e) => handleEmailChange(e.target.value)}
                value={email}
              />
            </Form.Group>
            <Form.Group
              className="mb-3"
              controlId="exampleForm.ControlTextarea1"
            >
              <Form.Label>Nr.Kontaktit</Form.Label>
              <Form.Control
                placeholder="Nr.Kontaktit"
                onChange={(e) => handlenrKontaktitChange(e.target.value)}
                value={nrKontaktit}
              />
            </Form.Group>
            <Form.Group
              className="mb-3"
              controlId="exampleForm.ControlTextarea1"
            >
              <Form.Label>Adresa</Form.Label>
              <Form.Control
                placeholder="Adresa"
                onChange={(e) => handleAdresaChange(e.target.value)}
                value={adresa}
              />
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClose}>
            Anulo <FontAwesomeIcon icon={faXmark} />
          </Button>
          <Button
            style={{ backgroundColor: "#009879", border: "none" }}
            onClick={perditesoTeDhenat}
          >
            Edito Produktin <FontAwesomeIcon icon={faPenToSquare} />
          </Button>
        </Modal.Footer>
      </Modal>
    </div>
  );
};

export default Dashboard;

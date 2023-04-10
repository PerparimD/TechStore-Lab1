/* eslint-disable no-undef */
import React, { useState, useEffect } from "react";
import "./Styles/ProductTables.css";
import Button from "react-bootstrap/Button";
import axios from "axios";
import Mesazhi from "../layout/Mesazhi";
import ShtoProduktin from "./ShtoProduktin";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faBan, faPenToSquare } from "@fortawesome/free-solid-svg-icons";
import { faPlus, faXmark } from "@fortawesome/free-solid-svg-icons";
import EditoProduktin from "./EditoProduktin";
import Modal from "react-bootstrap/Modal";

const ProductTables = () => {
  const [produkti, setProdukti] = useState([]);
  const [id, setId] = useState();
  const [perditeso, setPerditeso] = useState("");
  const [show, setShow] = useState(false);
  const [edito, setEdito] = useState(false);
  const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
  const [tipiMesazhit, setTipiMesazhit] = useState("");
  const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");

  useEffect(() => {
    const shfaqProduktet = async () => {
      try {
        const produkti = await axios.get(
          "https://localhost:7285/api/Produkti/Products"
        );
        setProdukti(produkti.data);

        console.log(produkti.data[1].kompania.emriKompanis);
      } catch (err) {
        console.log(err);
      }
    };

    shfaqProduktet();
  }, [perditeso]);

  const handleClose = () => {
    setShow(false);
  };
  const handleShow = () => setShow(true);

  const handleEdito = (id) => {
    setEdito(true);
    setId(id);
  };

  const [showD, setShowD] = useState(false);

  const handleCloseD = () => setShowD(false);
  const handleShowD = (id) => {
    setId(id);
    setShowD(true);
  };

  const handleEditoMbyll = () => setEdito(false);

  async function handleDelete() {
    try {
      await axios.delete(`https://localhost:7285/api/Produkti/` + id);
      setTipiMesazhit("success");
      setPershkrimiMesazhit("Produkti u fshi me sukses!");
      setPerditeso(Date.now());
      setShfaqMesazhin(true);
      setShowD(false);
    } catch (err) {
      console.error(err);
      setTipiMesazhit("danger");
      setPershkrimiMesazhit("Ndodhi nje gabim gjate fshirjes se produkti!");
      setPerditeso(Date.now());
      setShfaqMesazhin(true);
    }
  }

  return (
    <div className="containerDashboardP">
      <h1 className="title">Tabela e Produkteve</h1>
      <Button className="mb-3 Butoni" onClick={handleShow}>
        Shto Produktin <FontAwesomeIcon icon={faPlus} />
      </Button>
      {show && (
        <ShtoProduktin
          show={handleShow}
          hide={handleClose}
          shfaqmesazhin={() => setShfaqMesazhin(true)}
          perditesoTeDhenat={() => setPerditeso(Date.now())}
          setTipiMesazhit={setTipiMesazhit}
          setPershkrimiMesazhit={setPershkrimiMesazhit}
        />
      )}
      {shfaqMesazhin && (
        <Mesazhi
          setShfaqMesazhin={setShfaqMesazhin}
          pershkrimi={pershkrimiMesazhit}
          tipi={tipiMesazhit}
        />
      )}
      {edito && (
        <EditoProduktin
          show={handleShow}
          hide={handleEditoMbyll}
          id={id}
          shfaqmesazhin={() => setShfaqMesazhin(true)}
          perditesoTeDhenat={() => setPerditeso(Date.now())}
          setTipiMesazhit={setTipiMesazhit}
          setPershkrimiMesazhit={setPershkrimiMesazhit}
        />
      )}
      <Modal show={showD} onHide={handleCloseD}>
        <Modal.Header closeButton>
          <Modal.Title style={{ color: "red" }}>Largo Kompanin</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <h6>A jeni te sigurt qe deshironi ta fshini kete kompani?</h6>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClose}>
            Anulo <FontAwesomeIcon icon={faXmark} />
          </Button>
          <Button variant="danger" onClick={handleDelete}>
            Largo Kompanin <FontAwesomeIcon icon={faBan} />
          </Button>
        </Modal.Footer>
      </Modal>

      <table className="tableBig">
        <thead>
          <tr>
            <th className="emriP">Emri i Produktit</th>
            <th>Foto e Produktit</th>
            <th>Kompania</th>
            <th>Qmimi i Produktit</th>
            <th>Funksione</th>
          </tr>
        </thead>

        <tbody>
          {produkti.map((p) => {
            return (
              <tr key={p.produktiId}>
                <td>{p.emriProduktit}</td>
                <td>
                  <img
                    src={`${process.env.PUBLIC_URL}/img/products/${p.fotoProduktit}`}
                    width="50"
                    alt=""
                  />
                </td>

                <td>{!!p.kompania && p.kompania.emriKompanis}</td>
                <td>{p.qmimiProduktit} €</td>
                <td>
                  <Button
                    style={{ marginRight: "0.5em" }}
                    variant="success"
                    onClick={() => handleEdito(p.produktiId)}
                  >
                    <FontAwesomeIcon icon={faPenToSquare} />
                  </Button>
                  <Button
                    variant="danger"
                    onClick={() => handleShowD(p.produktiId)}
                  >
                    <FontAwesomeIcon icon={faBan} />
                  </Button>
                </td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
};

export default ProductTables;

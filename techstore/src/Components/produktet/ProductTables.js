/* eslint-disable no-undef */
import React, { useState, useEffect } from "react";
import "./Styles/ProductTables.css";
import Button from "react-bootstrap/Button";
import axios from "axios";
import Mesazhi from "../layout/Mesazhi";
import ShtoProduktin from "./ShtoProduktin";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faBan, faPenToSquare, faPlus, faXmark, faCheck, faInfoCircle } from "@fortawesome/free-solid-svg-icons";
import EditoProduktin from "./EditoProduktin";
import Modal from "react-bootstrap/Modal";
import { TailSpin } from 'react-loader-spinner';
import ZbritjetEProduktit from "./Zbritjet/ZbritjetEProduktit";

const ProductTables = () => {
  const [produkti, setProdukti] = useState([]);
  const [id, setId] = useState();
  const [perditeso, setPerditeso] = useState("");
  const [show, setShow] = useState(false);
  const [edito, setEdito] = useState(false);
  const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
  const [tipiMesazhit, setTipiMesazhit] = useState("");
  const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");
  const [mbyllZbritjen, setMbyllZbritjen] = useState(true);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    const shfaqProduktet = async () => {
      try {
        setLoading(true);
        const produkti = await axios.get(
          "https://localhost:7285/api/Produkti/Products"
        );
        setProdukti(produkti.data);
        setLoading(false);
      } catch (err) {
        console.log(err);
        setLoading(false);
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

  const handleMbyllZbritjen = () => {
    setMbyllZbritjen(true);
  }

  return (
    <div className="containerDashboardP">
      {mbyllZbritjen == false &&
        <ZbritjetEProduktit
          setMbyllZbritjen={handleMbyllZbritjen}
          setPerditeso={setPerditeso}
        />
      }
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
          <Modal.Title style={{ color: "red" }}>Largo Produktin</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <h6>A jeni te sigurt qe deshironi ta fshini kete produkt?</h6>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleCloseD}>
            Anulo <FontAwesomeIcon icon={faXmark} />
          </Button>
          <Button variant="danger" onClick={handleDelete}>
            Largo Produktin <FontAwesomeIcon icon={faBan} />
          </Button>
        </Modal.Footer>
      </Modal>
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
      ) : mbyllZbritjen && <>
        <h1 className="title">Tabela e Produkteve</h1>
        <Button className="mb-3 Butoni" onClick={handleShow}>
          Shto Produktin <FontAwesomeIcon icon={faPlus} />
        </Button>
        <Button className="mb-3 Butoni" onClick={() => setMbyllZbritjen(false)}>
          Zbrijtjet e Produkteve <FontAwesomeIcon icon={faInfoCircle} />
        </Button>
        <table className="tableBig">
          <thead>
            <tr>
              <th>Emri i Produktit</th>
              <th>Pershkrimi</th>
              <th>Foto e Produktit</th>
              <th>Kompania</th>
              <th>Kategoria</th>
              <th>Qmimi i Produktit</th>
              <th>Funksione</th>
            </tr>
          </thead>

          <tbody>
            {produkti.map((p) => {
              return (
                <tr key={p.produktiId}>
                  <td>{p.emriProduktit}</td>
                  <td>{p.pershkrimi ? <FontAwesomeIcon icon={faCheck} color="green" /> : <FontAwesomeIcon icon={faXmark} color="red" />}</td>
                  <td>
                    <img
                      src={`${process.env.PUBLIC_URL}/img/products/${p.fotoProduktit}`}
                      width="50"
                      alt=""
                    />
                  </td>

                  <td>{p.emriKompanis}</td>
                  <td>{p.llojiKategoris}</td>
                  <td>{(p.qmimiProduktit).toFixed(2)} €</td>
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
      </>
      }
    </div>
  );
};

export default ProductTables;

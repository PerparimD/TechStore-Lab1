/* eslint-disable no-undef */
import React, { useState, useEffect } from "react";
import "./Styles/ProductTables.css";
import Button from "react-bootstrap/Button";
import axios from "axios";
import Mesazhi from "../layout/Mesazhi";
import ShtoProduktin from "./ShtoProduktin";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faBan, faPenToSquare } from "@fortawesome/free-solid-svg-icons";
import EditoProduktin from "./EditoProduktin";

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

  async function fshijProduktin(id) {
    try {
      await axios.delete(`https://localhost:7285/api/Produkti/` + id);
      setTipiMesazhit("success");
      setPershkrimiMesazhit("Kompania u fshi me sukses!");
      setPerditeso(Date.now());
      setShfaqMesazhin(true);
    } catch (err) {
      console.error(err);
      setTipiMesazhit("danger");
      setPershkrimiMesazhit("Ndodhi nje gabim gjate fshirjes se kompanis!");
      setPerditeso(Date.now());
      setShfaqMesazhin(true);
    }
  }

  const handleClose = () => {
    setShow(false);
  };
  const handleShow = () => setShow(true);

  const handleEdito = (id) => {
    setEdito(true);
    setId(id);
  };

  const handleEditoMbyll = () => setEdito(false);

  return (
    <div className="containerDashboardP">
      <Button className="mb-3 Butoni" onClick={handleShow}>
        Shto Produktin
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
                {/* <td>{p.kategoriaID}</td> */}
                <td> 
                  {!!p.kompania && p.kompania.emriKompanis}
                </td>
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
                    onClick={() => fshijProduktin(p.produktiId)}
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

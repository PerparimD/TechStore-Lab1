import "./CartPage.css";
import "../../layout/Styles/Buton.module.css";
import { useStateValue } from "../../../Context/StateProvider";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faMinus, faPlus } from "@fortawesome/free-solid-svg-icons";
import { useState, useEffect } from "react";
import axios from "axios";
import Mesazhi from "../../layout/Mesazhi";
import { Link } from "react-router-dom";

const CartProduct = (props) => {
  const [{ cart }, dispatch] = useStateValue();
  const [sasiaMaxELejuar, setSasiaMaxELejuar] = useState(1); //Bazuar ne stokun e produktit
  const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
  const [tipiMesazhit, setTipiMesazhit] = useState("danger");
  const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");

  useEffect(() => {
    const shfaqMesazhinStorage = localStorage.getItem('shfaqMesazhin');
    const pershkrimiMesazhitStorage = localStorage.getItem('pershkrimiMesazhit');
    const tipiMesazhitStorage = localStorage.getItem('tipiMesazhit');

    setShfaqMesazhin(shfaqMesazhinStorage === 'true');
    setPershkrimiMesazhit(pershkrimiMesazhitStorage || '');
    setTipiMesazhit(tipiMesazhitStorage || '');
    if (localStorage.getItem('shfaqMesazhinPasRef') === 'true') {
      setShfaqMesazhin(true);
    }
    localStorage.setItem("shfaqMesazhinPasRef", false)
  }, []);

  useEffect(() => {
    localStorage.setItem('shfaqMesazhin', shfaqMesazhin);
    localStorage.setItem('pershkrimiMesazhit', pershkrimiMesazhit);
    localStorage.setItem('tipiMesazhit', tipiMesazhit);
  }, [shfaqMesazhin, pershkrimiMesazhit, tipiMesazhit]);

  useEffect(() => {
    axios
      .get(`https://localhost:7285/api/Produkti/${props.id}`)
      .then((response) => {
        setSasiaMaxELejuar(response.data.sasiaNeStok);
      })
      .catch((error) => {
        console.log(error);
      });
  }, [props.id]);

  const removeCart = () => {
    dispatch({
      type: "REMOVE_CART",
      id: props.id
    });
  };

  const handelSasiaChange = (sasiaERe) => {
    localStorage.setItem('shfaqMesazhinPasRef', false);
    if (isNaN(sasiaERe) || sasiaERe > sasiaMaxELejuar) {
      sasiaERe = sasiaMaxELejuar;
      setPershkrimiMesazhit(`Sasia maksimale e lejuar per <strong>${props.emriProduktit}</strong> eshte <strong>${sasiaMaxELejuar}</strong>!`)
      setTipiMesazhit("danger");
      localStorage.setItem('shfaqMesazhinPasRef', true);
    }
    if (sasiaERe < 1) {
      sasiaERe = 1;
    }
    dispatch({
      type: "NDRYSHO_SASISNE",
      id: props.id,
      sasia: sasiaERe,
    });
    setShfaqMesazhin(false);
  };

  return (
    <div className="produkti-cart">
      {shfaqMesazhin && <Mesazhi
        setShfaqMesazhin={setShfaqMesazhin}
        pershkrimi={pershkrimiMesazhit}
        tipi={tipiMesazhit}
      />}
      <div className="info">
        <div className="foto">
          <img
            src={`${process.env.PUBLIC_URL}/img/products/${props.fotoProduktit}`}
            alt={props.emriProduktit}
          />
        </div>
        <div className="teDhenatProduktit">
          <Link to={`/Produkti/${props.id}`}><h1 className="emriProd">{props.emriProduktit}</h1></Link>
          <div className="blerja">
            <form>
              <h2>{props.cmimi.toFixed(2)} €</h2>
              <p>{(props.cmimi - props.cmimi * 0.18).toFixed(2)} € pa TVSH</p>

              <div className="funksionet">
                <div className="sasia">
                  <label>Sasia: </label>
                  <div className="sasiaInputi">
                    <button className="decrement" onClick={() => handelSasiaChange(props.sasia - 1)}><FontAwesomeIcon icon={faMinus} /></button>
                    <input type="number" value={props.sasia} disabled />
                    <button className="increment" onClick={() => handelSasiaChange(props.sasia + 1)}><FontAwesomeIcon icon={faPlus} /></button>
                  </div>
                </div>
                <button className="remove-button" onClick={() => removeCart()}>
                  Remove From Cart
                </button>
              </div>
            </form>
          </div>
        </div>
      </div >
    </div >
  );
};

export default CartProduct;

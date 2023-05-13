import { Link } from "react-router-dom";
import Buton from "../layout/Buton";
import "./Styles/produktet.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faCartShopping, faFaceFrown } from "@fortawesome/free-solid-svg-icons";
import "../layout/Styles/Buton.module.css";
import { useStateValue } from "../../Context/StateProvider";
import Mesazhi from "../layout/Mesazhi";
import { useState, useEffect } from "react";
import classes from '../layout/Styles/Buton.module.css';

function ProduktetNeHome(props) {
  const [{ cart }, dispatch] = useStateValue();
  const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
  const [tipiMesazhit, setTipiMesazhit] = useState("success");
  const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");

  const handleShtoNeShporte = () => {
    const eshteNeShporte = cart.find((item) => item.id === props.produktiID);
    console.log(props.sasiaNeStok)

    if (eshteNeShporte && eshteNeShporte.sasia >= props.sasiaNeStok) {
      setTipiMesazhit("danger")
      setPershkrimiMesazhit(`Sasia maksimale per <strong>${props.emriProduktit}</strong> eshte <strong>${props.sasiaNeStok}</strong> ne shporte!`);
      setShfaqMesazhin(true);
    } else {
      dispatch({
        type: "ADD_TO_CART",
        item: {
          id: props.produktiID,
          foto: props.fotoProduktit,
          emri: props.emriProduktit,
          cmimi: props.cmimi,
          sasia: 1,
        },
      });
      setTipiMesazhit("success")
      setPershkrimiMesazhit(`<strong>${props.emriProduktit}</strong> u shtua ne shporte!`);
      setShfaqMesazhin(true);
    }
  };


  return (
    <div className="artikulli" key={props.produktiID}>
      {shfaqMesazhin && <Mesazhi
        setShfaqMesazhin={setShfaqMesazhin}
        pershkrimi={pershkrimiMesazhit}
        tipi={tipiMesazhit}
      />}
      <Link to={`/Produkti/${props.produktiID}`}>
        <div>
          <img
            src={`${process.env.PUBLIC_URL}/img/products/${props.fotoProduktit}`}
            alt={props.emriProduktit}
          />
          <p className="artikulliLabel">{props.emriProduktit}</p>
        </div>
        <p className="cmimi">{props.cmimi.toFixed(2)} €</p>
        <p>{props.cmimiMeZbritje}</p>
      </Link>
      <div className="butonatDiv">
        {props.sasiaNeStok > 0 &&
          <Buton Label="Buy Now" name="blej" />}
        {props.sasiaNeStok > 0 &&
          <button
            onClick={handleShtoNeShporte}
            className="buttonat"
          >
            <FontAwesomeIcon icon={faCartShopping} />
          </button>
        }
        {props.sasiaNeStok <= 0 &&
          <button
            className={classes.buttonat} disabled
          >
            Out of Stock
          </button>
        }
      </div>
    </div>
  );
}

export default ProduktetNeHome;

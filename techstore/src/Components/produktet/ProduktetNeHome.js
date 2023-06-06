import { Link } from "react-router-dom";
import "./Styles/produktet.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faCartShopping, faFaceFrown } from "@fortawesome/free-solid-svg-icons";
import "../layout/Styles/Buton.module.css";
import { useStateValue } from "../../Context/StateProvider";
import Mesazhi from "../layout/Mesazhi";
import { useState } from "react";
import classes from '../layout/Styles/Buton.module.css';


function ProduktetNeHome(props) {
  const [{ cart }, dispatch] = useStateValue();
  const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
  const [tipiMesazhit, setTipiMesazhit] = useState("success");
  const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");

  const handleShtoNeShporte = () => {
    const eshteNeShporte = cart.find((item) => item.id === props.produktiID);
    

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
          cmimi: (props.cmimiMeZbritje != null ? props.cmimiMeZbritje : props.cmimi),
          sasia: 1,
        },
      });
      setTipiMesazhit("success")
      setPershkrimiMesazhit(`<strong>${props.emriProduktit}</strong> u shtua ne shporte!`);
      setShfaqMesazhin(true);
    }
  };


  return (
    <div className="artikulli" key={props.produktiID} data-aos="zoom-in">
      {shfaqMesazhin && <Mesazhi
        setShfaqMesazhin={setShfaqMesazhin}
        pershkrimi={pershkrimiMesazhit}
        tipi={tipiMesazhit}
      />}
      <Link to={`/Produkti/${props.produktiID}`}>
        <div className="emri-foto">
          {props.cmimiMeZbritje != null &&
            <div className="zbritjaBadge">
              <p className="">- {props.cmimiMeZbritje != null && (((props.cmimi - props.cmimiMeZbritje) / props.cmimi) * 100).toFixed(0)} %</p>
            </div>
          }
          <img
            src={`${process.env.PUBLIC_URL}/img/products/${props.fotoProduktit}`}
            alt={props.emriProduktit}
          />
          <p className="artikulliLabel">{props.emriProduktit}</p>
        </div>
      </Link>
      <div className="cmimet">
          <p className="cmimi">{props.cmimiMeZbritje != null ? parseFloat(props.cmimiMeZbritje).toFixed(2) : props.cmimi.toFixed(2)} €</p>
          <p className="cmimiPaZbritje">{props.cmimiMeZbritje != null && props.cmimi.toFixed(2) + " €"} </p>
        </div>
      <div className="butonatDiv">
        {props.sasiaNeStok > 0 &&
          <button
            onClick={handleShtoNeShporte}
            className={`${classes.buttonat} ${classes.butoniAddToCart}`}
          >
            Shto ne Shporte <FontAwesomeIcon icon={faCartShopping} />
          </button>
        }
        {props.sasiaNeStok <= 0 &&
          <button
            className={"button"} disabled style={{ backgroundColor: "lightgray", color: "black", cursor: "unset", marginTop: "0" }}
          >
            Out of Stock
          </button>
        }
      </div>
    </div>
  );
}

export default ProduktetNeHome;

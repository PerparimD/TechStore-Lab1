import { Link } from "react-router-dom";
import Buton from "../layout/Buton";
import "./Styles/produktet.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faCartShopping } from "@fortawesome/free-solid-svg-icons";
import "../layout/Styles/Buton.module.css";
import { useStateValue } from "../../Context/StateProvider";

function ProduktetNeHome(props) {
  const [{ cart }, dispatch] = useStateValue();

  return (
    <div className="artikulli" key={props.produktiID}>
      <Link to={`/Produkti/${props.produktiID}`}>
        <div>
          <img
            src={`${process.env.PUBLIC_URL}/img/products/${props.fotoProduktit}`}
            alt={props.emriProduktit}
          />
          <p className="artikulliLabel">{props.emriProduktit}</p>
        </div>
        <p className="cmimi">{props.cmimi.toFixed(2)} €</p>
      </Link>
      <div className="butonatDiv">
          <Buton Label="Buy Now" name="blej" />
          <button
            onClick={() => {
              dispatch({
                type: "ADD_TO_CART",
                item: {
                  id: props.produktiID,
                  foto: props.fotoProduktit,
                  emri: props.emriProduktit,
                  cmimi: props.cmimi,
                  sasia: 1
                },
              });
            }}
            className="buttonat"
          >
            <FontAwesomeIcon icon={faCartShopping} />
          </button>
        </div>
    </div>
  );
}

export default ProduktetNeHome;

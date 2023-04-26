import { Link } from "react-router-dom";
import Buton from "../../layout/Buton";
import "../Styles/produktet.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faCartShopping } from "@fortawesome/free-solid-svg-icons";
import "../../layout/Styles/Buton.module.css";
import { useStateValue } from "../../../Context/StateProvider";

const CartProduct = (props) => {
  const [{ cart }, dispatch] = useStateValue();

  const removeCart = () => {
    dispatch({
      type: "REMOVE_CART",
      id: props.id
    });
  };

  return (
    <div className="produkti-cart">
      <div className="detajet">
        <div className="foto">
          <img
            src={`${process.env.PUBLIC_URL}/img/products/${props.fotoProduktit}`}
            alt={props.emriProduktit}
          />
        </div>
        <div>
          <div className="teDhenatProduktit">
            <table>
              <tbody>
                <tr>
                  <th colSpan="2">
                    <h1 className="emriProd">{props.emriProduktit}</h1>
                  </th>
                </tr>
              </tbody>
            </table>
          </div>
          <div className="blerja">
            <form>
              <h1>{props.cmimi + "€"}</h1>
              <p>{props.cmimi - props.cmimi * 0.18 + "€ pa TVSH"}</p>

              <div>
                <button className="button" onClick={() => removeCart()}>
                  Remove From Cart
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default CartProduct;

import { React } from "react";
import { useStateValue } from "../../../Context/StateProvider";
import CartProduct from "./CartProduct";
import "./CartPage.css";
import { faFaceFrown } from "@fortawesome/free-regular-svg-icons";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

function CartPage() {
  const [{ cart }, dispatch] = useStateValue();
  console.log(cart)
  let qmimiTot = 0;
  return (
    <>
      <h2 className="cart-title"></h2>
      <div className="cart-page">
        <div className="cart-items">
          {cart.length !== 0 && cart.map((item) => {
            qmimiTot += item.cmimi * item.sasia;
            return (
              <CartProduct
                key={item.id}
                id={item.id}
                fotoProduktit={item.foto}
                emriProduktit={item.emri}
                cmimi={item.cmimi}
                sasia={item.sasia}
              />
            );
          })}
          {cart.length === 0 && <h1 className="shporta-zbrazet">Nuk Keni asnje Produkt ne Shporte! <FontAwesomeIcon icon={faFaceFrown} /></h1>}
        </div>
        {cart.length !== 0 &&
          <div className="details">
            <h3 className="d-title">Detajet e Shportes</h3>
            <h4>Totali produkteve: {cart.length}</h4>
            <h4>Qmimi total: {qmimiTot.toFixed(2)} €</h4>
            <p><strong>Qmimi total pa TVSH: </strong>{(qmimiTot - qmimiTot * 0.18).toFixed(2)} €</p>
            <p><strong>TVSH: </strong>{(qmimiTot * 0.18).toFixed(2)} €</p>
            <button className="cart-button"> Buy Now</button>
          </div>
        }
      </div>
    </>
  );
};

export default CartPage;

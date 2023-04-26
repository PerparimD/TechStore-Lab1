import React from "react";
import { useStateValue } from "../../../Context/StateProvider";
import CartProduct from "./CartProduct";
import "./CartPage.css";
import Buton from "../../layout/Buton";

const CartPage = () => {
  const [{ cart }, dispatch] = useStateValue();
  let string = JSON.stringify(cart);
  localStorage.setItem("cart", string);
  return (
    <>
      <h2 className="cart-title">Shporta Juaj</h2>
      <div className="cart-page">
        <div className="cart-items">
          {cart.map((item) => {
            return (
              <CartProduct
                key={item.id}
                id={item.id}
                fotoProduktit={item.foto}
                emriProduktit={item.emri}
                cmimi={item.cmimi}
              />
            );
          })}
        </div>

        <div className="details">
          <h4 className="d-title">Detajet e Shportes</h4>
          <p>Nr i produkteve: {cart.length}</p>
          <p>Qmimi total: </p>
          <button className="cart-button"> Buy Now</button>
        </div>
      </div>
    </>
  );
};

export default CartPage;

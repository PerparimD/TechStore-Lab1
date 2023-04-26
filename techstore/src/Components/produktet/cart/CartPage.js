import React from "react";
import { useStateValue } from "../../../Context/StateProvider";
import CartProduct from "./CartProduct";

const CartPage = () => {
  const [{ cart }, dispatch] = useStateValue();
  return (
    <div>
      <h1>yoou have {cart.length} in basket</h1>
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
  );
};

export default CartPage;

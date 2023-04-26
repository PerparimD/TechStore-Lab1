import React from 'react'
import { Helmet } from "react-helmet";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import CartPage from '../Components/produktet/cart/CartPage';

const Cart = () => {
  return (
    <div className="cart">
      <Helmet>
        <title>Cart | Tech Store</title>
      </Helmet>
      <NavBar />
       <CartPage />
      <Footer />


    </div>
   )
}

export default Cart
import React from 'react'
import { Helmet } from "react-helmet";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";

const Cart = () => {
  return (
    <div className="cart">
      <Helmet>
        <title>Cart | Tech Store</title>
      </Helmet>
      <NavBar />
       
      <Footer />


    </div>
  )
}

export default Cart
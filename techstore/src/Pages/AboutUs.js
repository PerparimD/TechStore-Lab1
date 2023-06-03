import React from "react";
import Footer from "../Components/layout/Footer";
import NavBar from "../Components/layout/NavBar";
import lg from "../assets/techstoreLogoBlue.jpg";
import "./Styles/AboutUs.css";

import { Helmet } from "react-helmet";

const AboutUs = () => {
  return (
    <div>
      <Helmet>
        <title>About Us | Tech Store</title>
      </Helmet>
      <NavBar />
      <div className="about-page">
        <div className="photo" data-aos="fade-right">
          <img src={lg} alt="" />
        </div>
        <div className="about-txt" data-aos="fade-left" >
          <h3 class="title">Want to know more about us?</h3>
          <p className="txt">
            What we created is a place where you can find the newest features
            from technology with the best prices.
          </p>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default AboutUs;

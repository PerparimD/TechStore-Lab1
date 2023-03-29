import React from "react";
import Footer from "../Components/layout/Footer";
import NavBar from "../Components/layout/NavBar";

import { Helmet } from "react-helmet";


const ContactUs = () => {
  return (
    <div>
      <Helmet>
        <title>Contact Us | Tech Store</title>
      </Helmet>
      <NavBar />
      Contact Us
      <Footer />
    </div>
  );
};

export default ContactUs;

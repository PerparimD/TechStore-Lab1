import React from "react";
import Footer from "../Components/layout/Footer";
import NavBar from "../Components/layout/NavBar";

import { Helmet } from "react-helmet";

const AboutUs = () => {
  return (
    <div>
      <Helmet>
        <title>About Us | Tech Store</title>
      </Helmet>
      <NavBar />
      About Us

      <Footer />
    </div>
  );
};

export default AboutUs;

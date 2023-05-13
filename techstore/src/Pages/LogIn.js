import React from "react";
import { Helmet } from "react-helmet";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import Form from "react-bootstrap/Form";
import FloatingLabel from 'react-bootstrap/FloatingLabel';
import Button from "react-bootstrap/esm/Button";
import "./Styles/LogIn.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEnvelopeCircleCheck } from "@fortawesome/free-solid-svg-icons";




const LogIn = () => {
  return(
    <div className="logIn">
    <Helmet>
      <title>Log In | Tech Store</title>
    </Helmet>
    <NavBar />
    <Form className="login-form">
          <Form.Text className="formTitle">Log In</Form.Text>
          <FloatingLabel

            controlId="floatingInput"
            label="User Name"
            className="mb-3"
          >
            <Form.Control className="input"
              placeholder="User Name"
              type="text"
             />
          </FloatingLabel>
          <FloatingLabel

            controlId="floatingInput"
            label="Password"
            className="mb-3"
          >
            <Form.Control className="input"
              placeholder="Password"
              type="text"
             />
          </FloatingLabel>
          <button className="login-button">
            Log In
          </button>
          

    </Form>  
    <Footer/>    
  </div>
  );

};

export default LogIn;

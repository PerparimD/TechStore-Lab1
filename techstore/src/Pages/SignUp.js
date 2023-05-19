import React from "react";
import { Helmet } from "react-helmet";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import Form from "react-bootstrap/Form";
import FloatingLabel from "react-bootstrap/FloatingLabel";
import Button from "react-bootstrap/esm/Button";
import "./Styles/SignUp.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEnvelopeCircleCheck } from "@fortawesome/free-solid-svg-icons";

const SignUp = () => {
  return (
    <div className="sign-up">
      <Helmet>
        <title>Sign Up | Tech Store</title>
      </Helmet>
      <NavBar />
      <Form className="sign-up-form">
        <Form.Text className="formTitle">Sign Up</Form.Text>
        <FloatingLabel controlId="floatingInput" label="Name" className="mb-3">
          <Form.Control className="input" placeholder=" Name" type="text" />
        </FloatingLabel>

        <FloatingLabel
          controlId="floatingInput"
          label="Last Name"
          className="mb-3"
        >
          <Form.Control
            className="input"
            placeholder=" Last Name"
            type="text"
          />
        </FloatingLabel>

        <FloatingLabel
          controlId="floatingInput"
          label="Email"
          className="mb-3"
        >
          <Form.Control
            className="input"
            placeholder=" exmple@email.com"
            type="email"
          />
        </FloatingLabel>

        <FloatingLabel
          controlId="floatingInput"
          label="Password"
          className="mb-3"
        >
          <Form.Control className="input" placeholder="Password" type="text" />
        </FloatingLabel>
        <button className="sign-up-button">Create Account</button>
      </Form>
      <Footer />
    </div>
  );
};

export default SignUp;

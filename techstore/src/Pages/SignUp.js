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
import { useState } from "react";
import axios from "axios";
import Mesazhi from "../Components/layout/Mesazhi";

const SignUp = () => {
  const [emri, setEmri] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  function vendosEmrin(value) {
    setEmri(value);
  }

  function vendosEmail(value) {
    setEmail(value);
  }

  function vendosPasswordin(value) {
    setPassword(value);
  }

  function CreateAcc() {
    axios
      .post("https://localhost:7285/api/Authenticate/register", {
        name: emri,
        email: email,
        password: password,
      })
      .then((response) => {
        console.log(response);
        setEmri("");
        setEmail("");
        setPassword("");
      })
      .catch((error) => {
        console.log("error");
      });
  }

  return (
    <div className="sign-up">
      <Helmet>
        <title>Sign Up | Tech Store</title>
      </Helmet>
      <NavBar />
      <Form className="sign-up-form">
        <Form.Text className="formTitle">Sign Up</Form.Text>
        <FloatingLabel
          controlId="floatingInput"
          label="Name"
          className="mb-3 label"
        >
          <Form.Control 
          value={emri}
          className="input" 
          placeholder=" Name" 
          type="text"
          onChange={(e) => vendosEmrin(e.target.value)} />
        </FloatingLabel>

        <FloatingLabel
          controlId="floatingInput"
          label="Email"
          className="mb-3 label"
        >
          <Form.Control
          value={email}
            className="input"
            placeholder=" exmple@email.com"
            type="email"
            onChange={(e) => vendosEmail(e.target.value)}
          />
        </FloatingLabel>

        <FloatingLabel
          controlId="floatingInput"
          label="Password"
          className="mb-3 label"
        >
          <Form.Control 
          value={password}
          className="input" 
          placeholder="Password" 
          type="text" 
          onChange={(e) => vendosPasswordin(e.target.value)}/>
        </FloatingLabel>
        <button className="sign-up-button" onClick={CreateAcc}>Create Account</button>
      </Form>
      <Footer />
    </div>
  );
};

export default SignUp;

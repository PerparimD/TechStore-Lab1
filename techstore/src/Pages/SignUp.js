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
import Col from "react-bootstrap/Col";
import { Row } from "react-bootstrap";

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

        <Row className="mb-3">
          <Form.Group as={Col}  className="p-0" controlId="formGridName">
            <Form.Label>Name</Form.Label>
            <Form.Control type="name" placeholder="Enter Name" />
          </Form.Group>

          <Form.Group as={Col} className="p-0" controlId="formGridLastName">
            <Form.Label>Last Name</Form.Label>
            <Form.Control type="last name" placeholder="Last Name" />
          </Form.Group>
        </Row>

        <Form.Group className="mb-3" controlId="formGridAddress2">
          <Form.Label>Username</Form.Label>
          <Form.Control placeholder="Username" />
        </Form.Group>

        <Form.Group className="mb-3" controlId="formGridAddress2">
          <Form.Label>Email</Form.Label>
          <Form.Control placeholder="example@hotmail.com" />
        </Form.Group>

        <Form.Group className="mb-3" controlId="formGridAddress2">
          <Form.Label>Password</Form.Label>
          <Form.Control type="password" placeholder="Password" />
        </Form.Group>

        <Form.Group className="mb-3" controlId="formGridAddress2">
          <Form.Label>Phone Number</Form.Label>
          <Form.Control placeholder="045-000-000" />
        </Form.Group>

        <Row className="mb-3">
          <Form.Group as={Col} className="p-0" controlId="formGridCity">
            <Form.Label>City</Form.Label>
            <Form.Control />
          </Form.Group>

          <Form.Group as={Col} className="p-0" controlId="formGridState">
            <Form.Label>State</Form.Label>
            <Form.Select defaultValue="Choose...">
              <option>Choose...</option>
              <option>...</option>
            </Form.Select>
          </Form.Group>

          <Form.Group as={Col} className="p-0" controlId="formGridZip">
            <Form.Label>Zip</Form.Label>
            <Form.Control />
          </Form.Group>
        </Row>
        <Button variant="primary" type="submit" onClick={CreateAcc}>
        Create Account
        </Button>
      </Form>
      {/* <Form className="sign-up-form">
        <Form.Text className="formTitle">Sign Up</Form.Text>

        <Row>
          <Col>
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
                onChange={(e) => vendosEmrin(e.target.value)}
              />
            </FloatingLabel>
          </Col>

          <Col>
            <FloatingLabel
              controlId="floatingInput"
              label="Last Name"
              className="mb-3 label "
            >
              <Form.Control
                className="input"
                placeholder="Last Name"
                type="text"
              />
            </FloatingLabel>
          </Col>
        </Row>

        <FloatingLabel
          controlId="floatingInput"
          label="User Name"
          className="mb-3 label "
        >
          <Form.Control className="input" placeholder="User Name" type="text" />
        </FloatingLabel>

        <FloatingLabel
          controlId="floatingInput"
          label="Phone Number"
          className="mb-3 label "
        >
          <Form.Control
            className="input"
            placeholder="Phone Number"
            type="text"
          />
        </FloatingLabel>

        <FloatingLabel
          controlId="floatingInput"
          label="Adress"
          className="mb-3 label "
        >
          <Form.Control className="input" placeholder="Adress" type="text" />
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
            onChange={(e) => vendosPasswordin(e.target.value)}
          />
        </FloatingLabel>
        <button className="sign-up-button" onClick={CreateAcc}>
          Create Account
        </button>
      </Form> */}
      <Footer />
    </div>
  );
};

export default SignUp;

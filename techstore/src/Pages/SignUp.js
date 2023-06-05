import React from "react";
import { Helmet } from "react-helmet";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/esm/Button";
import "./Styles/SignUp.css";
import { useState } from "react";
import axios from "axios";
import Col from "react-bootstrap/Col";
import { Row } from "react-bootstrap";

const SignUp = () => {
  const [emri, setEmri] = useState("");
  const [mbimeri, setMbiemri] = useState("");
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [nrTelefonit, setNrTelefonit] = useState("");
  const [qyteti, setQyteti] = useState("");
  const [adresa, setAdresa] = useState("");
  const [shteti, setShteti] = useState("");
  const [zipKodi, setZipKodi] = useState("");

  const getToken = localStorage.getItem("token");

  const authentikimi = {
    headers: {
      Authorization: `Bearer ${getToken}`,
    },
  };

  const handleChange = (setState) => (event) => {
    setState(event.target.value);
  }

  const handleShtetiChange = (event) => {
    setShteti(event.target.value);
  };

  function CreateAcc(e) {
    e.preventDefault();

    axios
      .post("https://localhost:7285/api/Authenticate/register", {
        name: emri,
        lastName: mbimeri,
        email: email,
        username: username,
        password: password,
        adresa: adresa,
        qyteti: qyteti,
        shteti: shteti,
        zipKodi: zipKodi !== "" ? zipKodi : 0,
        nrTelefonit: nrTelefonit
      }, authentikimi)
      .then((response) => {
        console.log(response);
      })
      .catch((error) => {
        console.error(error);
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
          <Form.Group as={Col} className="p-0" controlId="formGridName">
            <Form.Label>Name*</Form.Label>
            <Form.Control type="name" placeholder="Enter Name" value={emri} onChange={handleChange(setEmri)} required />
          </Form.Group>

          <Form.Group as={Col} className="p-0" controlId="formGridLastName">
            <Form.Label>Last Name*</Form.Label>
            <Form.Control type="last name" placeholder="Last Name" value={mbimeri} onChange={handleChange(setMbiemri)} required />
          </Form.Group>
        </Row>

        <Form.Group className="mb-3" controlId="formGridAddress2">
          <Form.Label>Username*</Form.Label>
          <Form.Control placeholder="Username" value={username} onChange={handleChange(setUsername)} required />
        </Form.Group>

        <Form.Group className="mb-3" controlId="formGridAddress2">
          <Form.Label>Email*</Form.Label>
          <Form.Control placeholder="example@hotmail.com" value={email} onChange={handleChange(setEmail)} required />
        </Form.Group>

        <Form.Group className="mb-3" controlId="formGridAddress2">
          <Form.Label>Password*</Form.Label>
          <Form.Control type="password" placeholder="Password" value={password} onChange={handleChange(setPassword)} required />
        </Form.Group>

        <Form.Group className="mb-3" controlId="formGridAddress2">
          <Form.Label>Phone Number</Form.Label>
          <Form.Control placeholder="045123123 ose +38343123132" value={nrTelefonit} onChange={handleChange(setNrTelefonit)} />
        </Form.Group>
        <Row>
          <Form.Group as={Col} className="p-0" controlId="formGridCity">
            <Form.Label>Adresa</Form.Label>
            <Form.Control placeholder="Agim Bajrami 60" value={adresa} onChange={handleChange(setAdresa)} />
          </Form.Group>
          <Form.Group as={Col} className="p-0" controlId="formGridCity">
            <Form.Label>Qyteti</Form.Label>
            <Form.Control placeholder="Kaçanik" value={qyteti} onChange={handleChange(setQyteti)} />
          </Form.Group>
        </Row>

        <Row className="mb-3">
          <Form.Group as={Col} className="p-0" controlId="formGridState">
            <Form.Label>State</Form.Label>
            <Form.Select value={setShteti} onChange={handleShtetiChange}>
              <option hidden disabled>Zgjedhni Shtetin</option>
              <option>Kosovë</option>
              <option>Shqipëri</option>
              <option>Maqedoni e Veriut</option>
            </Form.Select>
          </Form.Group>

          <Form.Group as={Col} className="p-0" controlId="formGridZip">
            <Form.Label>Zip</Form.Label>
            <Form.Control type="number" placeholder="71000" value={zipKodi} onChange={handleChange(setZipKodi)} />
          </Form.Group>
        </Row>
        <Button variant="primary" type="submit" onClick={CreateAcc}>
          Create Account
        </Button>
      </Form>
      <Footer />
    </div>
  );
};

export default SignUp;

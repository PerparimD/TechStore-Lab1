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
import Mesazhi from "../Components/layout/Mesazhi";
import { Link } from "react-router-dom";

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

  const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
  const [tipiMesazhit, setTipiMesazhit] = useState("");
  const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");

  const getToken = localStorage.getItem("token");

  const handleChange = (setState) => (event) => {
    setState(event.target.value);
  };

  const handleShtetiChange = (event) => {
    setShteti(event.target.value);
  };

  function isNullOrEmpty(value) {
    return value === null || value === "" || value === undefined;
  }

  async function CreateAcc(e) {
    e.preventDefault();

    if (
      isNullOrEmpty(emri) ||
      isNullOrEmpty(mbimeri) ||
      isNullOrEmpty(username) ||
      isNullOrEmpty(email) ||
      isNullOrEmpty(password)
    ) {
      setPershkrimiMesazhit(
        "<strong>Ju lutemi plotesoni te gjitha fushat me *</strong>"
      );
      setTipiMesazhit("danger");
      setShfaqMesazhin(true);
    } else {
      const passREGEX =
        /^[A-Z][A-Za-z0-9@$!%*?&]*[a-z][A-Za-z0-9@$!%*?&]*[0-9][A-Za-z0-9@$!%*?&]*$/;
      const telefoniREGEX = /^(?:\+\d{11}|\d{9})$/;

      if (!passREGEX.test(password)) {
        setPershkrimiMesazhit(
          "Fjalekalimi duhet te permbaj <strong>shkronja, numra dhe simbole si dhe shkroja e pare duhet te jete e madhe!</strong>"
        );
        setTipiMesazhit("danger");
        setShfaqMesazhin(true);
      } else if (
        !isNullOrEmpty(nrTelefonit) &&
        !telefoniREGEX.test(nrTelefonit)
      ) {
        setPershkrimiMesazhit(
          "Numri telefonit duhet te jete ne formatin: <strong>045123123 ose +38343123132</strong>"
        );
        setTipiMesazhit("danger");
        setShfaqMesazhin(true);
      } else {
        setPershkrimiMesazhit(
          "<strong>Llogaria juaj u krija me sukses! Ju Deshirojme blerje te kendshme</strong>"
        );
        setTipiMesazhit("success");
        setShfaqMesazhin(true);
      }
    }
  }

  return (
    <div className="sign-up">
      <Helmet>
        <title>Sign Up | Tech Store</title>
      </Helmet>
      <NavBar />
      {shfaqMesazhin && (
        <Mesazhi
          setShfaqMesazhin={setShfaqMesazhin}
          pershkrimi={pershkrimiMesazhit}
          tipi={tipiMesazhit}
        />
      )}
      <Form className="sign-up-form">
        <Form.Text className="formTitle">Sign Up</Form.Text>

        <Row className="mb-3">
          <Form.Group as={Col} className="p-0" controlId="formGridName">
            <Form.Label>
              Name<span style={{ color: "red" }}>*</span>
            </Form.Label>
            <Form.Control
              type="name"
              placeholder="Enter Name"
              value={emri}
              onChange={handleChange(setEmri)}
              required
              autoFocus
            />
          </Form.Group>

          <Form.Group as={Col} className="p-0" controlId="formGridLastName">
            <Form.Label>
              Last Name<span style={{ color: "red" }}>*</span>
            </Form.Label>
            <Form.Control
              type="last name"
              placeholder="Last Name"
              value={mbimeri}
              onChange={handleChange(setMbiemri)}
              required
            />
          </Form.Group>
        </Row>

        <Form.Group className="mb-3" controlId="formGridUsername">
          <Form.Label>
            Username<span style={{ color: "red" }}>*</span>
          </Form.Label>
          <Form.Control
            placeholder="Username"
            value={username}
            onChange={handleChange(setUsername)}
            required
          />
        </Form.Group>

        <Form.Group className="mb-3" controlId="formGridEmail">
          <Form.Label>
            Email<span style={{ color: "red" }}>*</span>
          </Form.Label>
          <Form.Control
            placeholder="example@hotmail.com"
            value={email}
            onChange={handleChange(setEmail)}
            required
          />
        </Form.Group>

        <Form.Group className="mb-3" controlId="formGridPassword">
          <Form.Label>
            Password<span style={{ color: "red" }}>*</span>
          </Form.Label>
          <Form.Control
            type="password"
            placeholder="Password"
            value={password}
            onChange={handleChange(setPassword)}
            required
          />
        </Form.Group>

        <Form.Group className="mb-3" controlId="formGridPhoneNumber">
          <Form.Label>Phone Number</Form.Label>
          <Form.Control
            placeholder="045123123 ose +38343123132"
            value={nrTelefonit}
            onChange={handleChange(setNrTelefonit)}
          />
        </Form.Group>
        <Row>
          <Form.Group as={Col} className="p-0" controlId="formGridAdresa">
            <Form.Label>Adresa</Form.Label>
            <Form.Control
              placeholder="Agim Bajrami 60"
              value={adresa}
              onChange={handleChange(setAdresa)}
            />
          </Form.Group>
          <Form.Group as={Col} className="p-0" controlId="formGridQyteti">
            <Form.Label>Qyteti</Form.Label>
            <Form.Control
              placeholder="Kaçanik"
              value={qyteti}
              onChange={handleChange(setQyteti)}
            />
          </Form.Group>
        </Row>

        <Row className="mb-3">
          <Form.Group as={Col} className="p-0" controlId="formGridState">
            <Form.Label>State</Form.Label>
            <Form.Select value={setShteti} onChange={handleShtetiChange}>
              <option hidden disabled>
                Zgjedhni Shtetin
              </option>
              <option>Kosovë</option>
              <option>Shqipëri</option>
              <option>Maqedoni e Veriut</option>
            </Form.Select>
          </Form.Group>

          <Form.Group as={Col} className="p-0" controlId="formGridZip">
            <Form.Label>Zip</Form.Label>
            <Form.Control
              type="number"
              placeholder="71000"
              value={zipKodi}
              onChange={handleChange(setZipKodi)}
            />
          </Form.Group>
        </Row>
        <div style={{ display: "flex", flexDirection: "column", width: "30%" }}>
          <Link to="/login" className="text-white-20 mb-4 p-text">
            Keni llogari? Kyçuni
          </Link>
          <Button variant="primary" type="submit" onClick={CreateAcc}>
            Create Account
          </Button>
        </div>
      </Form>
      <Footer />
    </div>
  );
};

export default SignUp;

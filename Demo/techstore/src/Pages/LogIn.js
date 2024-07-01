import React from "react";
import { Helmet } from "react-helmet";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import Form from "react-bootstrap/Form";
import "./Styles/LogIn.css";
import { useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import axios from "axios";
import jwt_decode from "jwt-decode";
import {
  MDBContainer,
  MDBRow,
  MDBCol,
  MDBCard,
  MDBCardBody,
  MDBInput,
} from "mdb-react-ui-kit";
import { Link } from "react-router-dom";
import Mesazhi from "../Components/layout/Mesazhi";

const LogIn = () => {
  const navigate = useNavigate();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loggedIn, setLoggedIn] = useState(false);
  const [roles, setRoles] = useState([]);

  const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
  const [tipiMesazhit, setTipiMesazhit] = useState("");
  const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");

  const getToken = localStorage.getItem("token");

  const authentikimi = {
    headers: {
      Authorization: `Bearer ${getToken}`,
    },
  };

  function vendosEmail(value) {
    setEmail(value);
  }

  function vendosPasswordin(value) {
    setPassword(value);
  }


  return (
    <div className="logIn">
      <Helmet>
        <title>Log In | Tech Store</title>
      </Helmet>
      <NavBar />
      {shfaqMesazhin && (
        <Mesazhi
          setShfaqMesazhin={setShfaqMesazhin}
          pershkrimi={pershkrimiMesazhit}
          tipi={tipiMesazhit}
        />
      )}
      <MDBContainer fluid>
        <MDBRow className="d-flex justify-content-center align-items-center h-100">
          <MDBCol col="12">
            <MDBCard
              className="bg-white my-5 mx-auto"
              style={{
                border: "none",
                boxShadow: "0 0 20px #ddd",
                borderRadius: "2rem",
                maxWidth: "500px",
              }}>
              <MDBCardBody className="p-5 w-100 d-flex flex-column">
                <Form.Text className="formTitle">Log In</Form.Text>
                <p className="text-white-20 mb-4 p-text">
                  Please enter your email and password!
                </p>

                <MDBInput
                  wrapperClass="mb-4 w-100"
                  label="Email address"
                  id="formControlEmailAddress"
                  type="email"
                  size="lg"
                  onChange={(e) => vendosEmail(e.target.value)}
                />
                <MDBInput
                  wrapperClass="mb-4 w-100"
                  label="Password"
                  id="formControlPassword"
                  type="password"
                  size="lg"
                  onChange={(e) => vendosPasswordin(e.target.value)}
                />
                <Link to="/SignUp" className="text-white-20 mb-4 p-text">
                  Don't have an Account?
                </Link>
                <button class="btn btn-primary btn-lg mb-3" role="button">
                  Login
                </button>

                <button
                  class="btn btn-primary btn-lg"
                  role="button"
                  onClick={() => {
                    localStorage.setItem(
                      "id",
                      "f2bb7622-23ac-4c5f-8d71-00032b281e37"
                    );
                    navigate("/dashboard");
                  }}>
                  Kyqu si Admin
                </button>
                <button
                  class="btn btn-primary btn-lg"
                  role="button"
                  onClick={() => {
                    localStorage.setItem(
                      "id",
                      "d2a7088f-a25e-4f3f-8488-b616eeaff928"
                    );
                    navigate("/dashboard");
                  }}>
                  Kyqu si Menagjer
                </button>
                <button
                  class="btn btn-primary btn-lg"
                  role="button"
                  onClick={() => {
                    localStorage.setItem(
                      "id",
                      "9d6b2651-641d-4c85-9154-99761863fc65"
                    );
                    navigate("/dashboard");
                  }}>
                  Kyqu si Klient
                </button>
              </MDBCardBody>
            </MDBCard>
          </MDBCol>
        </MDBRow>
      </MDBContainer>

      <Footer />
    </div>
  );
};

export default LogIn;

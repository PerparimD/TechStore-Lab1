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

const LogIn = () => {
  const navigate = useNavigate();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loggedIn, setLoggedIn] = useState(false);
  const [roles, setRoles] = useState([]);

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

  useEffect(() => {
    const loggedUser = localStorage.getItem("user");

    if (loggedUser) {
      setLoggedIn(true);
    }
  });

  async function handleLogIn(e) {
    e.preventDefault();

    try {
      const response = await axios.post("https://localhost:7285/api/Authenticate/login", {
        email: email,
        password: password,
      }, authentikimi);

      if (response.status === 200) {
        const { token } = response.data;

        localStorage.setItem("token", token);

        const decodedToken = jwt_decode(token);

        localStorage.setItem("id", decodedToken.id);

        const roles = decodedToken.role;
        setRoles(roles);

        if (roles.includes("Admin") || roles.includes("Menaxher")) {
          navigate("/dashboard");
        } else {
          navigate("/dashboard");
        }
      } else {
        throw new Error("Authentication failed");
      }
    } catch (error) {
      console.error("Error:", error);
    }
  };


  return (
    <div className="logIn">
      <Helmet>
        <title>Log In | Tech Store</title>
      </Helmet>
      <NavBar />
      <MDBContainer fluid >
        <MDBRow className="d-flex justify-content-center align-items-center h-100">
          <MDBCol col="12">
            <MDBCard
              className="bg-white my-5 mx-auto"
              style={{ border: "none", boxShadow: "0 0 20px #ddd", borderRadius: "2rem", maxWidth: "500px" }}
            >
              <MDBCardBody className="p-5 w-100 d-flex flex-column">
                <Form.Text className="formTitle">Log In</Form.Text>
                <p className="text-white-20 mb-4 p-text">
                  Please enter your email and password!
                </p>

                <MDBInput
                  wrapperClass="mb-4 w-100"
                  label="Email address"
                  id="formControlLg"
                  type="email"
                  size="lg"
                  onChange={(e) => vendosEmail(e.target.value)}
                />
                <MDBInput
                  wrapperClass="mb-4 w-100"
                  label="Password"
                  id="formControlLg"
                  type="password"
                  size="lg"
                  onChange={(e) => vendosPasswordin(e.target.value)}
                />
                <Link to="/SignUp" className="text-white-20 mb-4 p-text">Don't have an Account?</Link>
                <button class="btn btn-primary btn-lg" role="button" onClick={handleLogIn}>Login</button>


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


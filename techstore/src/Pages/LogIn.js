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
import { useNavigate } from "react-router-dom";
import { useEffect,useState } from "react";
import axios from "axios";
import Mesazhi from "../Components/layout/Mesazhi";
import jwt_decode from "jwt-decode";





const LogIn = () => {

  const navigate = useNavigate();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loggedIn, setLoggedIn] = useState(false)

  function vendosEmail(value) {
    setEmail(value);
  }

  function vendosPasswordin(value) {
    setPassword(value);
  }

  useEffect(() => {
    const loggedUser = localStorage.getItem('user')

    if (loggedUser) {
      setLoggedIn(true)
    }
  })

  const handleLogIn = (e) => {
    e.preventDefault();

    fetch('https://localhost:7285/api/Authenticate/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        email: email,
        password: password
      })
    })
      .then(async response => {
        if (response.ok) {

          const data = await response.json();
          const user = {
            email: email
          }

          if (data.token) {
            localStorage.setItem("user", JSON.stringify(data));
          }
          if (data) {
            localStorage.setItem("userInfo", JSON.stringify(user));
          }

          console.log('Token:', data.token);
          // console.log('Expiration:', data.expiration);
          const token = data.token;

          // Decode the token to extract the claims
          const decodedToken = jwt_decode(token);

          // Access the roles claim
          const roles = decodedToken["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/email"];
          console.log(roles)

          if (roles == 'Admin') {
            navigate("/dashboard");
          } else if (roles == 'Manager') {
            navigate('/dashboard')
          } else if (roles == 'User') {
            navigate('/')
          }
        } else {
          throw new Error('Authentication failed');
        }
      })
      .catch(error => {
        console.error('Error:', error);
      });
  }


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
            label="Email"
            className="mb-3 label"
          >
            <Form.Control className="input"
              placeholder="Email"
              type="text"
             />
          </FloatingLabel>
          <FloatingLabel

            controlId="floatingInput"
            label="Password"
            className="mb-3 label"
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

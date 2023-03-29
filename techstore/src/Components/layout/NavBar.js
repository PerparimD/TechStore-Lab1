import React from "react";
import "./styles/navbar.css";
import logo from "../../assets/web/favicon.ico";
import { Link } from "react-router-dom";

const NavBar = () => {
  return (
    <>
      <nav className="nav">
        <div className="logo">
          <Link to='/'><img src={logo} alt="" /></Link>
        </div>
        <ul className="nav-links">
          <Link to='/'><li className="nav-link">Home</li></Link>
          <Link to='/aboutus'><li className="nav-link">About Us</li></Link>
          <Link to='/contactus'><li className="nav-link">Contact Us</li></Link>
        </ul>
        <div className="auth">
          <p>Log In</p>
          <p>Sign Up</p>
        </div>
      </nav>
    </>
  );
};

export default NavBar;

import React from "react";
import "./styles/navbar.css";
import { Link } from "react-router-dom";

const NavBar = () => {
  return (
      <nav className="nav">
        <div className="logo">
          <Link to='/'><img src={`${process.env.PUBLIC_URL}/img/web/techstoreLogoWhiteSquare.png`} alt="" /></Link>
        </div>
        <ul className="nav-links">
          <Link to='/'><li className="nav-link">Home</li></Link>
          <Link to='/aboutus'><li className="nav-link">About Us</li></Link>
          <Link to='/contactus'><li className="nav-link">Contact Us</li></Link>
          <Link to='/dashboard'><li className="dash">Dashboard</li></Link>
        </ul>
        <div className="auth">
          <p>Log In</p>
          <p>Sign Up</p>
        </div>
      </nav>
  );
};

export default NavBar;

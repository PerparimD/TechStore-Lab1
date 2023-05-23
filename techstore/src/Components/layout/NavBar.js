import classes from './Styles/NavBar.module.css';
import './Styles/ModalDheTabela.css';

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCircleUser } from '@fortawesome/free-regular-svg-icons';
import { faRightFromBracket, faRightToBracket, faCartShopping } from '@fortawesome/free-solid-svg-icons';
import { faUserPlus } from '@fortawesome/free-solid-svg-icons';
import { Link } from "react-router-dom";
import { useStateValue } from '../../Context/StateProvider';
import jwtDecode from 'jwt-decode';
import { useNavigate } from 'react-router-dom';
import { useEffect, useState } from 'react';


function NavBar(props) {
  const navigate = useNavigate();
  

  const [{ cart }, dispatch] = useStateValue();
  const token = localStorage.getItem("token");

  useEffect(() => {
    if (token) {
      const decodedToken = jwtDecode(token);
      const kohaAktive = new Date(decodedToken.exp * 1000);
      const kohaTanishme = new Date();
      const id = localStorage.getItem("id");

      if (kohaAktive < kohaTanishme) {
        localStorage.removeItem("token");
        localStorage.removeItem("id");
        navigate("/LogIn");
      }

      if(id !== decodedToken.id){
        localStorage.removeItem("token");
        localStorage.removeItem("id");
        navigate("/LogIn");
      }
    }
  }, []);

  const handleSignOut = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("id");
  }

  return (
    <header>
      <nav className={classes.nav}>
        <div className={classes.navleft}>
          <Link className={classes.logo} to="/"><img src={`${process.env.PUBLIC_URL}/img/web/techstoreLogoWhiteSquare.png`}
            alt="" /></Link>
        </div>
        <ul className={classes.navLinks}>
          <div className={classes.navCenter}>
            <li className={classes.navItem}>
              <Link to='/'>Home</Link>
              <span className={classes.line}></span>
            </li>
            <li className={classes.navItem}>
              <Link to='/AboutUs'>About Us</Link>
              <span className={classes.line}></span>
            </li>
            <li className={classes.navItem}>
              <Link to='/ContactUs'>Contact Us</Link>
              <span className={classes.line}></span>
            </li>
            <li className={classes.navItem}>
              <a href='/Produktet'>Products</a>
              <span className={classes.line}></span>
            </li>
          </div>
          <div className={classes.navRight}>
            <li className={classes.navItem}>
              <Link to='/Cart'><FontAwesomeIcon icon={faCartShopping} />
                <span className={classes.badge} value={cart.length} />
              </Link>
              <span className={classes.line}></span>
            </li>
            {token &&
              <>
                <li className={classes.navItem}>
                  <Link to='/Dashboard'><span
                  >Dashboard <FontAwesomeIcon icon={faCircleUser} /></span></Link>
                  <span className={classes.line}></span>
                </li>
                <li className={classes.navItem}>
                  <Link to='/' onClick={handleSignOut}>Log out <FontAwesomeIcon icon={faRightFromBracket} /></Link>
                  <span className={classes.line}></span>
                </li>
              </>
            }
            {!token &&
              <>
                <li className={classes.navItem}>
                  <Link to='/LogIn'>Log in <FontAwesomeIcon icon={faRightToBracket} /></Link>
                  <span className={classes.line}></span>
                </li>
                <li className={classes.navItem}>
                  <Link to='/SignUp'>Sign up <FontAwesomeIcon icon={faUserPlus} /></Link>
                  <span className={classes.line}></span>
                </li>
              </>
            }
          </div>
        </ul>

        <ul className={classes.mobileShporta}>
          <li className={classes.navItem}>
            <Link to='/Cart'><FontAwesomeIcon icon={faCartShopping} />
              <span className={classes.badge} value={cart.length} />
            </Link>
          </li>
        </ul>
        <div className={classes.hamburger}>
          <div className={classes.dropdown}>
            <button className={classes.dropbtn}>
              <span className={classes.hamIkona}></span>
              <span className={classes.hamIkona}></span>
              <span className={classes.hamIkona}></span>
            </button>
            <div className={classes.dropdownContent}>
              <Link to='/'>Home</Link>
              <Link to='/AboutUs'>About Us</Link>
              <Link to='/ContactUs'>Contact Us</Link>
              <a href='/Produktet'>Products</a>
              {token &&
                <>
                  <Link to='/Dashboard'>Dashboard <FontAwesomeIcon icon={faCircleUser} /></Link>
                  <Link to='/' onClick={handleSignOut}>Sign out <FontAwesomeIcon icon={faRightFromBracket} /></Link>
                </>
              }
              {!token &&
                <>
                  <Link to='/LogIn'>Sign in <FontAwesomeIcon icon={faRightToBracket} /></Link>
                  <Link to='/SignUp'>Sign up <FontAwesomeIcon icon={faUserPlus} /></Link>
                </>
              }
            </div>
          </div>
        </div>
      </nav>
    </header >
  );
}

export default NavBar;
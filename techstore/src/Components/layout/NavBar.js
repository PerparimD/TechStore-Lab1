import classes from './NavBar.module.css';
import '../layout/styles/ModalDheTabela.css';

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCircleUser } from '@fortawesome/free-regular-svg-icons';
import { faRightFromBracket, faRightToBracket } from '@fortawesome/free-solid-svg-icons';
import { faUserPlus } from '@fortawesome/free-solid-svg-icons';
import { Link } from "react-router-dom";

function NavBar(props) {
  return (
    <header>
      <nav className={classes.nav}>
        <div className={classes.navleft}>
          <Link className={classes.logo} href=""><img src={`${process.env.PUBLIC_URL}/img/web/techstoreLogoWhiteSquare.png`}
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
              <Link to='/'>Products</Link>
              <span className={classes.line}></span>
            </li>
          </div>
          <div className={classes.navRight}>
            <li className={classes.navItem}>
              <Link to='/Dashboard'><span
              >Dashboard <FontAwesomeIcon icon={faCircleUser} /></span></Link>
              <span className={classes.line}></span>
            </li>
            <li className={classes.navItem}>
              <Link to='/'>Sign out <FontAwesomeIcon icon={faRightFromBracket} /></Link>
              <span className={classes.line}></span>
            </li>
            <li className={classes.navItem}>
              <Link to='/'>Sign in <FontAwesomeIcon icon={faRightToBracket} /></Link>
              <span className={classes.line}></span>
            </li>
            <li className={classes.navItem}>
              <Link to='/'>Sign up <FontAwesomeIcon icon={faUserPlus} /></Link>
              <span className={classes.line}></span>
            </li>
          </div>
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
              <Link to='/'>Products</Link>
              <Link to='/Dashboard'>Dashboard <FontAwesomeIcon icon={faCircleUser} /></Link>
              <Link to='/'>Sign out <FontAwesomeIcon icon={faRightFromBracket} /></Link>
              <Link to='/'>Sign in <FontAwesomeIcon icon={faRightToBracket} /></Link>
              <Link to='/'>Sign up <FontAwesomeIcon icon={faUserPlus} /></Link>
            </div>
          </div>
        </div>
      </nav>
    </header >
  );
}

export default NavBar;
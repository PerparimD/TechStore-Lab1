import classes from './Styles/Footer.module.css';
import { Link } from "react-router-dom";

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faFacebook, faTwitter, faInstagram } from '@fortawesome/free-brands-svg-icons';
import { faCopyright } from '@fortawesome/free-regular-svg-icons';

function Footer(props) {
    return (
        <footer>
            <div className={classes.footer}>
                <div className={classes.footerLogo}>
                    <img src={`${process.env.PUBLIC_URL}/img/web/techstoreLogoWhiteSquare.png`} alt="" />
                </div>
                <div className={classes.footerNav}>
                    <h2 className={classes.footerNavTitle}>Quick Links</h2>
                    <ul>
                        <li><Link to="/">Home</Link></li>
                        <li><Link to="/AboutUs">About Us</Link></li>
                        <li><Link to="/ContactUs">Contact Us</Link></li>
                        <li><Link to="/">Products</Link></li>
                    </ul>
                </div>
                <div className={classes.footerContact}>
                    <h2 className={classes.footerNavTitle}>Get in touch</h2>
                    <ul>
                        <li><a href="tel:+11112223333">+1-111-222-3333</a></li>
                        <li><a href="mailto:contact@tech.store">contact@tech.store</a></li>
                        <li>Rr. Agim Bajrami - Perballe Xhamise, Kaçanik</li>
                    </ul>
                    <div className={classes.footerSocialIcons}>
                        <a href="https://facebook.com"><i><FontAwesomeIcon icon={faFacebook} /></i></a>
                        <a href="https://instagram.com"><i><FontAwesomeIcon icon={faInstagram} /></i></a>
                        <a href="https://twitter.com"><i><FontAwesomeIcon icon={faTwitter} /></i></a>
                    </div>
                </div>
            </div>
            <div className={classes.copyright}>
                <FontAwesomeIcon icon={faCopyright} />TechStore SH.P.K.
            </div>
        </footer>
    );
}

export default Footer;
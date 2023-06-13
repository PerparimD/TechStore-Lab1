import classes from './Styles/Footer.module.css';
import { Link } from "react-router-dom";

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faFacebook, faTwitter, faInstagram } from '@fortawesome/free-brands-svg-icons';
import { faCopyright } from '@fortawesome/free-regular-svg-icons';

import { useState, useEffect } from 'react';
import axios from 'axios';

function Footer(props) {
    const [teDhenatBiznesit, setTeDhenatBiznesit] = useState([]);
    const [perditeso, setPerditeso] = useState('');

    const getToken = localStorage.getItem("token");

    const authentikimi = {
        headers: {
            Authorization: `Bearer ${getToken}`,
        },
    };

    useEffect(() => {
        const ShfaqTeDhenat = async () => {
            try {
                const teDhenat = await axios.get("https://localhost:7285/api/TeDhenatBiznesit/ShfaqTeDhenat", authentikimi);
                setTeDhenatBiznesit(teDhenat.data);
            } catch (err) {
                console.log(err);
            }
        };

        ShfaqTeDhenat();
    }, [perditeso]);

    return (
        <footer>
            <div className={classes.footer}>
                <div className={classes.footerLogo}>
                    {teDhenatBiznesit && (teDhenatBiznesit.logo === null || teDhenatBiznesit.logo === "") ?
                        <Link to="/">
                            <h1>{teDhenatBiznesit.shkurtesaEmritBiznesit}</h1>
                        </Link> :
                        <Link className={classes.logo} to="/">
                            <img src={`${process.env.PUBLIC_URL}/img/web/${teDhenatBiznesit.logo}`} alt="" />
                        </Link>
                    }
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
                        <li><a href={teDhenatBiznesit && "tel:" + teDhenatBiznesit.nrKontaktit}>{teDhenatBiznesit && teDhenatBiznesit.nrKontaktit}</a></li>
                        <li><a href={teDhenatBiznesit && "mailto:" + teDhenatBiznesit.email}>{teDhenatBiznesit && teDhenatBiznesit.email}</a></li>
                        <li style={{color: "black"}}>{teDhenatBiznesit && teDhenatBiznesit.adresa}</li>
                    </ul>
                    <div className={classes.footerSocialIcons}>
                        <a href="https://facebook.com"><i><FontAwesomeIcon icon={faFacebook} /></i></a>
                        <a href="https://instagram.com"><i><FontAwesomeIcon icon={faInstagram} /></i></a>
                        <a href="https://twitter.com"><i><FontAwesomeIcon icon={faTwitter} /></i></a>
                    </div>
                </div>
            </div>
            <div className={classes.copyright}>
                <FontAwesomeIcon icon={faCopyright} /> {teDhenatBiznesit && teDhenatBiznesit.emriIbiznesit}
            </div>
        </footer >
    );
}

export default Footer;
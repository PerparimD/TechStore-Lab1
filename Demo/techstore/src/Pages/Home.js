import ProduktetNeHome from "../Components/produktet/ProduktetNeHome";
import classes from './Styles/Home.module.css'
import axios from 'axios';
import { useState, useEffect } from 'react';
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import BrandsSlider from "../Components/slideri/BrandsSlider";
import { Helmet } from 'react-helmet';

import data from "../Data/Data";

function Home() {
    const [produktet, setProduktet] = useState([]);

    useEffect(() => {
        const shfaqProduktet = async () => {
            try {
                setProduktet(data.shfaq15ProduktetMeTeFundit);
            } catch (err) {
                console.log(err);
            }
        }

        shfaqProduktet();
    }, [])

    return (
        <div>
            <Helmet>
                <title>Home | Tech Store</title>
            </Helmet>
            <NavBar />
            <div className={classes.banner}>
                <div className={classes.titulliPershkrim}>
                    <p>A place where technology is everything.</p>
                </div>
            </div>
            <BrandsSlider />
            <div className={classes.artikujt}>
                <div className={classes.titulliArtikuj}>
                    <h1>Latest Products</h1>
                </div>
                {produktet.map((produkti) => {
                    return (
                        <ProduktetNeHome
                            produktiID={produkti.produktiId}
                            fotoProduktit={produkti.fotoProduktit}
                            emriProduktit={produkti.emriProduktit}
                            cmimi={produkti.qmimiProduktit}
                            sasiaNeStok={produkti.sasiaNeStok}
                            cmimiMeZbritje={produkti.qmimiMeZbritjeProduktit}
                        />
                    );
                }
                )}
            </div>
            <Footer />
        </div>
    );
}

export default Home;
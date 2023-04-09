import ProduktetNeHome from "../Components/produktet/ProduktetNeHome";

import classes from './Styles/Home.module.css'


import axios from 'axios';
import { useState, useEffect } from 'react';
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import BrandsSlider from "../Components/slideri/BrandsSlider";
import { Helmet } from 'react-helmet';


function Home() {
    const [produktet, setProduktet] = useState([]);

    useEffect(() => {
        const shfaqProduktet = async () => {
            try {
                const produktet = await axios.get("https://localhost:7285/api/Produkti/15ProduktetMeTeFundit");
                setProduktet(produktet.data);
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
                            key={produkti.produktiID}
                            fotoProduktit={`${process.env.PUBLIC_URL}/img/products/${produkti.fotoProduktit}`}
                            emriProduktit={produkti.emriProduktit}
                            cmimi={produkti.qmimiProduktit}
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
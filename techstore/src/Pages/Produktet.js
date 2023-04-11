import { Helmet } from "react-helmet";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import { useEffect, useState, useCallback } from "react";
import { useParams } from 'react-router-dom';
import axios from "axios";
import ProduktetNeHome from "../Components/produktet/ProduktetNeHome";
import '../Components/produktet/Styles/produktet.css';

function Produktet() {
    const [produktet, setProduktet] = useState([]);
    const [fillimiKerkimitProduktit, setFillimiKerkimitProduktit] = useState(0);
    const [limitiKerkimitProduktit, setLimitiKerkimitProduktit] = useState(15);
    const { llojiKerkimitNgaLinku, termiPerKerkimNgaLinku } = useParams();
    const [llojiKerkimit, setLlojiKerkimit] = useState(llojiKerkimitNgaLinku ? llojiKerkimitNgaLinku : "a");
    const [termiPerKerkim, setTermiPerKerkim] = useState(termiPerKerkimNgaLinku ? termiPerKerkimNgaLinku : "a");
    const [perditeso, setPerditeso] = useState("");
    const [perd, setPerditesoA] = useState("");
    const [numriAktualFaqes, setNumriAktualFaqes] = useState(1);
    const [nrTotProd, setNrTot] = useState(0);
    const [nrFaqev, setNrFaqev] = useState(1);
    const numriFaqeveNeNav = [];
    


    useEffect(() => {
        const shfaqProduktet = async () => {
            try {
                const produkti = await axios.get(`https://localhost:7285/api/Produkti/shfaqProduktetENdara?fillimiKerkimitProduktit=${fillimiKerkimitProduktit}&LimitiKerkimitProduktit=${limitiKerkimitProduktit}&llojiKerkimit=${llojiKerkimit}&termiPerKerkim=${termiPerKerkim}`);
                setProduktet(produkti.data);
            } catch (err) {
                console.log(err);
            }
        }

        shfaqProduktet();
        setNrFaqev(Math.ceil(nrTotProd / limitiKerkimitProduktit));
        console.log(nrFaqev)
        setPerditesoA(Date.now());
    }, [perditeso, fillimiKerkimitProduktit, limitiKerkimitProduktit, llojiKerkimit, termiPerKerkim]);

    useEffect(() => {
        const prod = async () => {
            try {
                const produkti = await axios.get(`https://localhost:7285/api/Produkti/shfaqNumrinEProdukteve?llojiKerkimit=${llojiKerkimit}&termiPerKerkim=${termiPerKerkim}`);
                setNrTot(produkti.data)
                console.log(nrTotProd);
            }
            catch (err) {
                console.log(err);
            }
        }

        prod();
        setPerditesoA(Date.now());
    }, [produktet, perditeso, fillimiKerkimitProduktit, limitiKerkimitProduktit, llojiKerkimit, termiPerKerkim])

    const handleNumriFaqes = (nrFaqes) => {
        setNumriAktualFaqes(nrFaqes);
        setFillimiKerkimitProduktit(nrFaqes * limitiKerkimitProduktit);
        setPerditeso(Date.now());
        setPerditesoA(Date.now());
    }

    useEffect(() => {
        for (let i = 1; i <= nrFaqev; i++) {
            numriFaqeveNeNav.push(i);
        }
        
        console.log(nrFaqev)
    }, [perd])
    
    
    return (
        <div>
            <Helmet>
                <title>Produktet | Tech Store</title>
            </Helmet>
            <NavBar />
            <div className="artikujt">
                <div className="titulliArtikuj">
                    <h1>Latest Products</h1>
                </div>
                {produktet.map((x) => {
                    return (
                        <ProduktetNeHome
                            produktiID={x.produktiId}
                            fotoProduktit={x.fotoProduktit}
                            emriProduktit={x.emriProduktit}
                            cmimi={x.qmimiProduktit}
                        />
                    )
                })}
            </div>


            <div className="navigimiFaqev">
                {nrFaqev > 1 &&
                    <a className='faqjaTjeter' ><i className='fa-solid'>&#xf104;</i>Next</a>
                }
                {numriFaqeveNeNav.map((faqja) => (
                    <a
                        key={faqja}
                        className={faqja === numriAktualFaqes ? "faqjaAktive" : "faqjaTjeter"}
                        onClick={() => handleNumriFaqes(faqja)}
                    >
                        {faqja}
                    </a>
                ))}

            </div>
            <Footer />
        </div>
    )
}

export default Produktet;
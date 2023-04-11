import { Helmet } from "react-helmet";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import { useEffect, useState } from "react";
import { useParams } from 'react-router-dom';
import axios from "axios";
import ProduktetNeHome from "../Components/produktet/ProduktetNeHome";
import '../Components/produktet/Styles/produktet.css';

function Produktet() {
    const [produktet, setProduktet] = useState([]);
    const [prodPerNrFaqes, setProdPerNrFaqes] = useState([]);
    const [fillimiKerkimitProduktit, setFillimiKerkimitProduktit] = useState(0);
    const [limitiKerkimitProduktit, setLimitiKerkimitProduktit] = useState(15);
    const { llojiKerkimitNgaLinku, termiPerKerkimNgaLinku } = useParams();
    const [llojiKerkimit, setLlojiKerkimit] = useState(llojiKerkimitNgaLinku ? llojiKerkimitNgaLinku : "teGjitha");
    const [termiPerKerkim, setTermiPerKerkim] = useState(termiPerKerkimNgaLinku ? termiPerKerkimNgaLinku : "teGjitha");
    const [nrFaqev, setNrFaqev] = useState(1);
    const [perditeso, setPerditeso] = useState("");
    const [nrAktualFaqes, setNumriAktualFaqes] = useState(1);
    const numriFaqeveNeNav = [];


    useEffect(() => {
        if (!llojiKerkimitNgaLinku || llojiKerkimitNgaLinku.trim() === '') {
            setLlojiKerkimit("teGjitha");
        }
        if (!termiPerKerkimNgaLinku || termiPerKerkimNgaLinku.trim() === '') {
            setTermiPerKerkim("teGjitha");
        }
        setPerditeso(Date.now());
    }, [llojiKerkimitNgaLinku, termiPerKerkimNgaLinku]);




    useEffect(() => {
        console.log(llojiKerkimit, termiPerKerkim);
        console.log("nrAktualFaqes: " + nrAktualFaqes, "nrFaqev: " + nrFaqev, "numriFaqeveNeNav: " + numriFaqeveNeNav)
        const shfaqProduktet = async () => {
            try {
                const produkti = await axios.get(`https://localhost:7285/api/Produkti/shfaqProduktetENdara?`
                    + `fillimiKerkimitProduktit=${fillimiKerkimitProduktit}&`
                    + `LimitiKerkimitProduktit=${limitiKerkimitProduktit}&`
                    + `llojiKerkimit=${llojiKerkimit}&`
                    + `termiPerKerkim=${termiPerKerkim}`);

                setProduktet(produkti.data);
            } catch (err) {
                console.log(err);
            }
        }
        
        numriFaqev;
        
        shfaqProduktet();

    }, [perditeso])
    const numriFaqev = async () => {
        try {
            const datat = await axios.get(`https://localhost:7285/api/Produkti/shfaqNumrinEProdukteve?llojiKerkimit=${llojiKerkimit}&termiPerKerkim=${termiPerKerkim}`)

            setProdPerNrFaqes(datat.data)
        } catch (err) {
            console.log(err);
        }
    }


    const handleNumriFaqes = (nrFaqes) => {
        setNumriAktualFaqes(nrFaqes);
        setFillimiKerkimitProduktit(nrFaqes * limitiKerkimitProduktit);
        setPerditeso(Date.now());
    }
    const handleTest = () => {
        setNrFaqev(prodPerNrFaqes.length / limitiKerkimitProduktit)
        console.log(prodPerNrFaqes.length, limitiKerkimitProduktit, prodPerNrFaqes.length / limitiKerkimitProduktit)
    }

    useEffect(() => {
        handleTest();
        for (let i = 1; i <= nrFaqev; i++) {
            numriFaqeveNeNav.push(i);
        }

    }, [perditeso]);
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
                {prodPerNrFaqes.map((x) => {
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


            <div class="navigimiFaqev">
                {nrFaqev > 1 &&
                    <a class='faqjaTjeter' ><i class='fa-solid'>&#xf104;</i></a>
                }
                {numriFaqeveNeNav.map((faqja) => (
                    <a
                        key={faqja}
                        className={faqja === nrAktualFaqes ? "faqjaAktive" : "faqjaTjeter"}
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
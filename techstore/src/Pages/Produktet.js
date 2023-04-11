import { Helmet } from "react-helmet";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import { useEffect, useState, useCallback } from "react";
import { Link, useParams } from 'react-router-dom';
import axios from "axios";
import ProduktetNeHome from "../Components/produktet/ProduktetNeHome";
import '../Components/produktet/Styles/produktet.css';
import Pagination from 'react-bootstrap/Pagination';
import Dropdown from 'react-bootstrap/Dropdown';

function Produktet() {
    const [produktet, setProduktet] = useState([]);
    const [kompania, setKompania] = useState(false);
    const [kategoria, setKateogria] = useState(false);
    const [kerkimi, setKermikim] = useState(false);
    const [kategorit, setKategorit] = useState([]);
    const [fillimiKerkimitProduktit, setFillimiKerkimitProduktit] = useState(0);
    const [limitiKerkimitProduktit, setLimitiKerkimitProduktit] = useState(15);
    const { llojiKerkimitNgaLinku, termiPerKerkimNgaLinku } = useParams();
    const [llojiKerkimit, setLlojiKerkimit] = useState(llojiKerkimitNgaLinku ? llojiKerkimitNgaLinku : "teGjitha");
    const [termiPerKerkim, setTermiPerKerkim] = useState(termiPerKerkimNgaLinku ? termiPerKerkimNgaLinku : "teGjitha");
    const [perditeso, setPerditeso] = useState("");
    const [numriAktualFaqes, setNumriAktualFaqes] = useState(1);
    const [nrTotProd, setNrTot] = useState(0);
    const [nrFaqev, setNrFaqev] = useState(1);
    const [kerkimiNgaSearch, setKerkimiNgaSearch] = useState("");

    let faqet = [];
    for (let faqja = 1; faqja <= nrFaqev; faqja++) {
        faqet.push(
            <Pagination.Item key={faqja} active={faqja === numriAktualFaqes} onClick={() => handleNumriFaqes(faqja)}>
                {faqja}
            </Pagination.Item>,
        );
    }
    useEffect(() => {
        const vendosKategorit = async () => {
            try {
                const kategorit = await axios.get(`https://localhost:7285/api/Kategoria/shfaqKategorit`);
                setKategorit(kategorit.data);
            } catch (err) {
                console.log(err);
            }
        }

        vendosKategorit();
    }, [perditeso]);

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
    }, [perditeso, fillimiKerkimitProduktit, limitiKerkimitProduktit, llojiKerkimit, termiPerKerkim]);

    useEffect(() => {
        const prod = async () => {
            try {
                const produkti = await axios.get(`https://localhost:7285/api/Produkti/shfaqNumrinEProdukteve?llojiKerkimit=${llojiKerkimit}&termiPerKerkim=${termiPerKerkim}`);
                setNrTot(produkti.data)
                setNrFaqev(Math.ceil(nrTotProd / limitiKerkimitProduktit));
            }
            catch (err) {
                console.log(err);
            }
        }


        const vendosEmrinKompanis = async () => {
            try {
                if (llojiKerkimit === "kompania") {
                    const kompania = await axios.get(`https://localhost:7285/api/Kompania/shfaqKompanin?id=${termiPerKerkim}`);
                    setKompania(kompania.data);
                }
            } catch (err) {
                console.log(err);
            }
        }


        const vendosEmrinKategoris = async () => {
            try {
                if (llojiKerkimit === "kategoria") {
                    const kategoria = await axios.get(`https://localhost:7285/api/Kategoria/shfaqKategorinSipasIDs?id=${termiPerKerkim}`);
                    setKateogria(kategoria.data);
                }
            } catch (err) {
                console.log(err);
            }
        }

        vendosEmrinKompanis();
        vendosEmrinKategoris();
        prod();
    }, [produktet, perditeso, fillimiKerkimitProduktit, limitiKerkimitProduktit, llojiKerkimit, termiPerKerkim])

    const handleNumriFaqes = (nrFaqes) => {
        setNumriAktualFaqes(nrFaqes);
        setFillimiKerkimitProduktit((nrFaqes - 1) * limitiKerkimitProduktit);
        setPerditeso(Date.now());
    }

    const handleNdryshimiKategoris = (e, kategoriaId) => {
        e.preventDefault();
        setLlojiKerkimit("kategoria");
        setTermiPerKerkim(kategoriaId);
        setKermikim(false);
        setKompania(false);
        setPerditeso(Date.now())
    }

    const handleSearchChange = (kerkimi) => {
        setKerkimiNgaSearch(kerkimi);
        console.log(kerkimiNgaSearch)
    }

    const handleKerko = (e) => {
        e.preventDefault();
        setLlojiKerkimit("kerko");
        setTermiPerKerkim(kerkimiNgaSearch);
        setKerkimiNgaSearch("");
        setKateogria(false);
        setKompania(false);
        setKermikim(true);
        setPerditeso(Date.now());
    }


    return (
        <div>
            <Helmet>
                <title>Produktet | Tech Store</title>
            </Helmet>
            <NavBar />
            <div className="navKerkimi">
                <Dropdown>
                    <Dropdown.Toggle className="button button-kategoria" variant="success" id="dropdown-basic">
                        Kategorit
                    </Dropdown.Toggle>

                    <Dropdown.Menu className="dropdown-content dropdown-content-kategoria">
                        {kategorit.map((k) => {
                            return (
                                <Link to='/Produktet'>
                                    <Dropdown.Item href={`/Produktet/kategoria/${k.kategoriaId}`} onClick={(e) => handleNdryshimiKategoris(e, k.kategoriaId)}>{k.llojiKategoris}</Dropdown.Item>
                                </Link>
                            )
                        }
                        )}
                    </Dropdown.Menu>
                </Dropdown>
                <form className="searchBarForm" onSubmit={(e) => handleKerko(e)} action={`/Produktet/kerko/${kerkimiNgaSearch}`}>
                    <input
                        className="searchBar"
                        type="search"
                        placeholder="Search"
                        value={kerkimiNgaSearch}
                        onChange={(e) => handleSearchChange(e.target.value)}
                    />
                </form>
            </div>
            <div className="artikujt">
                <div className="titulliArtikuj">
                    {kompania &&
                        <h1>Te gjitha produktet nga Partneri: {kompania.emriKompanis}</h1>
                    }
                    {kategoria &&
                        <h1>Te gjitha produktet e Kategoris: {kategoria.llojiKategoris}</h1>
                    }
                    {kerkimi &&
                        <h1>Produktet nga Kerkimi si: {termiPerKerkim}</h1>
                    }
                    {!kompania && !kategoria && !kerkimi &&
                        <h1>Te gjitha produktet</h1>
                    }
                </div>
                {produktet.length === 0 ? (
                    <h2>Nuk u gjet asnje produkte</h2>
                ) : (
                    produktet.map((x) => {
                        return (
                            <ProduktetNeHome
                                produktiID={x.produktiId}
                                fotoProduktit={x.fotoProduktit}
                                emriProduktit={x.emriProduktit}
                                cmimi={x.qmimiProduktit}
                            />
                        )
                    })
                )}
            </div>

            <div className="navigimiFaqev">
                <Pagination>
                    {numriAktualFaqes > 1 &&
                        <Pagination.First onClick={() => handleNumriFaqes(1)} />
                    }
                    {numriAktualFaqes > 1 &&
                        <Pagination.Prev onClick={() => handleNumriFaqes(numriAktualFaqes > 1 ? numriAktualFaqes - 1 : 1)} />
                    }
                    {faqet}
                    {numriAktualFaqes < nrFaqev &&
                        <Pagination.Next onClick={() => handleNumriFaqes(numriAktualFaqes + 1)} />
                    }
                    {numriAktualFaqes < nrFaqev &&
                        <Pagination.Last onClick={() => handleNumriFaqes(nrFaqev)} />
                    }
                </Pagination>
            </div>
            <Footer />
        </div>
    )
}

export default Produktet;
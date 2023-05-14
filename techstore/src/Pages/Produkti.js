import { useParams } from "react-router-dom";
import "./Styles/produkti.css";
import { useState } from "react";
import axios from 'axios';
import { useEffect } from "react";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import ProduktetNeHome from "../Components/produktet/ProduktetNeHome";
import { Helmet } from "react-helmet";
import { Link } from "react-router-dom";
import Mesazhi from "../Components/layout/Mesazhi";
import { useStateValue } from "../Context/StateProvider";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faCartShopping } from "@fortawesome/free-solid-svg-icons";

function Produkti() {
    const { produktiID } = useParams();
    const [produkti, setProdukti] = useState([]);
    const [perditeso, setPerditeso] = useState("");
    const [kaPershkrim, setKaPershkrim] = useState(false);
    const [produktet, setProduktet] = useState([]);
    const [{ cart }, dispatch] = useStateValue();
    const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
    const [tipiMesazhit, setTipiMesazhit] = useState("success");
    const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");

    useEffect(() => {
        const teDhenatProd = async () => {
            try {
                const teDhenatProduktit = await axios.get(`https://localhost:7285/api/Produkti/${produktiID}`)
                setProdukti(teDhenatProduktit.data);
                if (teDhenatProduktit.data.pershkrimi !== "") {
                    setKaPershkrim(true);
                } else {
                    setKaPershkrim(false);
                }
            } catch (err) {
                console.log(err);
            }
        }
        teDhenatProd();
    }, [perditeso, produktiID])

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

    const handleShtoNeShporte = () => {
        const eshteNeShporte = cart.find((item) => item.id === produkti.produktiId);
        console.log(produkti.sasiaNeStok)

        if (eshteNeShporte && eshteNeShporte.sasia >= produkti.sasiaNeStok) {
            setTipiMesazhit("danger")
            setPershkrimiMesazhit(`Sasia maksimale per <strong>${produkti.emriProduktit}</strong> eshte <strong>${produkti.sasiaNeStok}</strong> ne shporte!`);
            localStorage.setItem('shfaqMesazhinPasRef', true);
        } else {
            dispatch({
                type: "ADD_TO_CART",
                item: {
                    id: produkti.produktiId,
                    foto: produkti.fotoProduktit,
                    emri: produkti.emriProduktit,
                    cmimi: (produkti.qmimiMeZbritjeProduktit != null ? produkti.qmimiMeZbritjeProduktit : produkti.qmimiProduktit),
                    sasia: 1,
                },
            });
            setTipiMesazhit("success")
            setPershkrimiMesazhit(`<strong>${produkti.emriProduktit}</strong> u shtua ne shporte!`);
        }
    };

    useEffect(() => {
        const shfaqMesazhinStorage = localStorage.getItem('shfaqMesazhin');
        const pershkrimiMesazhitStorage = localStorage.getItem('pershkrimiMesazhit');
        const tipiMesazhitStorage = localStorage.getItem('tipiMesazhit');

        setShfaqMesazhin(shfaqMesazhinStorage === 'true');
        setPershkrimiMesazhit(pershkrimiMesazhitStorage || '');
        setTipiMesazhit(tipiMesazhitStorage || '');
        if (localStorage.getItem('shfaqMesazhinPasRef') === 'true') {
            setShfaqMesazhin(true);
        }
        localStorage.setItem("shfaqMesazhinPasRef", false)
    }, []);

    useEffect(() => {
        localStorage.setItem('shfaqMesazhin', shfaqMesazhin);
        localStorage.setItem('pershkrimiMesazhit', pershkrimiMesazhit);
        localStorage.setItem('tipiMesazhit', tipiMesazhit);
    }, [shfaqMesazhin, pershkrimiMesazhit, tipiMesazhit]);

    return (
        <div className="container">
            <Helmet>
                <title>{produkti.emriProduktit !== "" ? produkti.emriProduktit + " | Tech Store" : "Tech Store"}</title>
            </Helmet>
            <NavBar />
            {shfaqMesazhin && <Mesazhi
                setShfaqMesazhin={setShfaqMesazhin}
                pershkrimi={pershkrimiMesazhit}
                tipi={tipiMesazhit}
            />}
            <div className="produkti">
                <div className="detajet">


                    <div className="foto">
                        <img src={`${process.env.PUBLIC_URL}/img/products/${produkti.fotoProduktit}`} alt={produkti.emriProduktit} />
                    </div>
                    <div>
                        <div className="teDhenatProduktit">
                            <table>
                                <tbody>
                                    <tr>
                                        <th colSpan="2">
                                            <h1 className="emriProd">
                                                {produkti.emriProduktit}
                                            </h1>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>Kompania:</td>
                                        <td>
                                            <Link to={`/Produktet/kompania/${produkti.kompaniaId}`}>{produkti.emriKompanis}</Link>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Kategoria:</td>
                                        <td>
                                            <Link to={`/Produktet/kategoria/${produkti.kategoriaId}`}>{produkti.llojiKategoris}</Link>

                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                        <div className="blerja">
                            <form>
                                <h5 className="qmimiPaZbritje">
                                    {produkti.qmimiMeZbritjeProduktit != null && parseFloat(produkti.qmimiProduktit).toFixed(2) + " €"}
                                </h5>
                                <h5>{produkti.qmimiMeZbritjeProduktit != null &&
                                    ("Ju Kureseni: " + (produkti.qmimiProduktit - produkti.qmimiMeZbritjeProduktit).toFixed(2) + " €"
                                        + " (" +
                                        (((produkti.qmimiProduktit - produkti.qmimiMeZbritjeProduktit) / produkti.qmimiProduktit) * 100).toFixed(0)
                                        + "%)")}
                                </h5>
                                <h1 className="">
                                    {produkti.qmimiMeZbritjeProduktit != null ?
                                        parseFloat(produkti.qmimiMeZbritjeProduktit).toFixed(2)
                                        : parseFloat(produkti.qmimiProduktit).toFixed(2)} €
                                </h1>
                                <p>
                                    {produkti.qmimiMeZbritjeProduktit != null ?
                                        parseFloat(produkti.qmimiMeZbritjeProduktit - (produkti.qmimiMeZbritjeProduktit * 0.18)).toFixed(2)
                                        : parseFloat(produkti.qmimiProduktit - (produkti.qmimiProduktit * 0.18)).toFixed(2)} € pa TVSH
                                </p>
                                <p>
                                    Disponueshmëria: {produkti.sasiaNeStok > 10 ? "Me shume se 10 artikuj" : produkti.sasiaNeStok + " artikuj"}
                                </p>

                                <div>
                                    {produkti.sasiaNeStok > 0 &&
                                        <button onClick={handleShtoNeShporte} type="submit" className="button" >Buy Now</button>
                                    }
                                    {produkti.sasiaNeStok > 0 &&
                                        <button
                                            onClick={handleShtoNeShporte}
                                            className="buttonat"
                                        >
                                            <FontAwesomeIcon icon={faCartShopping} />
                                        </button>
                                    }
                                    {produkti.sasiaNeStok <= 0 &&
                                        <button
                                            className={"button"} disabled style={{ backgroundColor: "lightgray", color: "black" }}
                                        >
                                            Out of Stock
                                        </button>
                                    }
                                </div>
                            </form>


                        </div>
                    </div>
                </div>
                {kaPershkrim &&
                    <div className="pershkrimi">
                        <h2>Pershkrimi: </h2>
                        <p>
                            {produkti.pershkrimi}
                        </p>
                    </div>
                }
            </div>



            <div className="artikujt">
                <div className="titulliArtikuj">
                    <h1 className="">Me te fundit</h1>
                </div>
                {produktet.map((produkti) => {
                    return (
                        <ProduktetNeHome
                            key={produkti.produktiId}
                            produktiID={produkti.produktiId}
                            fotoProduktit={produkti.fotoProduktit}
                            emriProduktit={produkti.emriProduktit}
                            cmimi={produkti.qmimiProduktit}
                            sasiaNeStok={produkti.sasiaNeStok}
                        />
                    );
                }
                )}
            </div>
            <div className="footer">
                <Footer />
            </div>

        </div>
    )
}

export default Produkti;
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

function Produkti() {
    const { produktiID } = useParams();
    const [produkti, setProdukti] = useState([]);
    const [perditeso, setPerditeso] = useState("");
    const [kaPershkrim, setKaPershkrim] = useState(false);
    const [produktet, setProduktet] = useState([]);

    useEffect(() => {
        const teDhenatProd = async () => {
            try {
                const teDhenatProduktit = await axios.get(`https://localhost:7285/api/Produkti/${produktiID}`)
                setProdukti(teDhenatProduktit.data);
                if (teDhenatProduktit.data.pershkrimi !== "") {
                    setKaPershkrim(true);
                }else{
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

    return (
        <div className="container">
            <Helmet>
                <title>{produkti.emriProduktit !== ""? produkti.emriProduktit + " | Tech Store": "Tech Store"}</title>
            </Helmet>
            <NavBar />
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
                                <h1>
                                    {parseFloat(produkti.qmimiProduktit).toFixed(2)} €
                                </h1>
                                <p>
                                    {parseFloat(produkti.qmimiProduktit - (produkti.qmimiProduktit * 0.18)).toFixed(2)} € pa TVSH
                                </p>

                                <div>
                                    <button type="submit" className="button" >Buy now</button>
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
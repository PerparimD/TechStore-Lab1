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
import { faCartShopping, faPenToSquare } from "@fortawesome/free-solid-svg-icons";
import EditoProduktin from "../Components/produktet/EditoProduktin";

import data from "../Data/Data";

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
    const [edito, setEdito] = useState(false);
    const [teDhenat, setTeDhenat] = useState([]);

    const getToken = localStorage.getItem("token");

    const authentikimi = {
        headers: {
            Authorization: `Bearer ${getToken}`,
        },
    };

    const getID = localStorage.getItem("id");

    useEffect(() => {
        if (getID) {
            const vendosTeDhenat = async () => {
                try {
                    const perdoruesi = data.shfaqPerdoruesit.find((item) => item.perdoruesi.aspNetUserId === getID);
                    setTeDhenat(perdoruesi);
                } catch (err) {
                    console.log(err);
                }
            };

            vendosTeDhenat();
        }
    }, [perditeso]);

    useEffect(() => {
        const teDhenatProd = async () => {
            try {
                const teDhenatProduktit = data.shfaqProduktet.find((item) => item.produktiId == produktiID);
                setProdukti(teDhenatProduktit);
                console.log(produktiID)
                console.log(teDhenatProduktit)
                if (teDhenatProduktit && teDhenatProduktit.pershkrimi !== "") {
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
        const shfaqProd = async () => {
            try {
                setProduktet(data.shfaq15ProduktetMeTeShitura);
            } catch (err) {
                console.log(err);
            }
        }

        shfaqProd();
    }, [])

    const handleShtoNeShporte = () => {
        const eshteNeShporte = cart.find((item) => item.id === produkti.produktiId);

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

    const handleEdito = (e) => {
        e.preventDefault();
        setEdito(true);
    };

    return (
        <div className="container">
            <Helmet>
                <title>{produkti && produkti.emriProduktit !== "" ? produkti.emriProduktit + " | Tech Store" : "Tech Store"}</title>
            </Helmet>
            <NavBar />
            {shfaqMesazhin && <Mesazhi
                setShfaqMesazhin={setShfaqMesazhin}
                pershkrimi={pershkrimiMesazhit}
                tipi={tipiMesazhit}
            />}
            {edito && (
                <EditoProduktin
                    show={edito}
                    hide={() => setEdito(false)}
                    id={produkti &&  produkti.produktiId}
                    shfaqmesazhin={() => setShfaqMesazhin(true)}
                    perditesoTeDhenat={() => setPerditeso(Date.now())}
                    setTipiMesazhit={setTipiMesazhit}
                    setPershkrimiMesazhit={setPershkrimiMesazhit}
                />
            )}
            <div className="produkti">
                <div className="detajet">


                    <div className="foto">
                        <img src={`${process.env.PUBLIC_URL}/img/products/${produkti && produkti.fotoProduktit}`} alt={produkti && produkti.emriProduktit} />
                    </div>
                    <div>
                        <div className="teDhenatProduktit">
                            <table>
                                <tbody>
                                    <tr>
                                        <th colSpan="2">
                                            <h1 className="emriProd">
                                                {produkti && produkti.emriProduktit}
                                            </h1>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>Kompania:</td>
                                        <td>
                                            <Link to={`/Produktet/${produkti && produkti.emriKompanis}`}>{produkti && produkti.emriKompanis}</Link>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Kategoria:</td>
                                        <td>
                                            <Link to={`/Produktet/kategoria/${produkti && produkti.llojiKategoris}`}>{produkti && produkti.llojiKategoris}</Link>

                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                        <div className="blerja">
                            <form>
                                <h5 className="qmimiPaZbritje">
                                    {produkti && produkti.qmimiMeZbritjeProduktit != null && parseFloat(produkti && produkti.qmimiProduktit).toFixed(2) + " €"}
                                </h5>
                                <h5>{produkti && produkti.qmimiMeZbritjeProduktit != null &&
                                    ("Ju Kureseni: " + ((produkti && produkti.qmimiProduktit) - (produkti && produkti.qmimiMeZbritjeProduktit)).toFixed(2) + " €"
                                        + " (" +
                                        ((((produkti && (produkti.qmimiProduktit - produkti.qmimiMeZbritjeProduktit))) / (produkti && produkti.qmimiProduktit)) * 100).toFixed(0)
                                        + "%)")}
                                </h5>
                                <h1 className="">
                                    {produkti && (produkti.qmimiMeZbritjeProduktit != null ?
                                        parseFloat(produkti.qmimiMeZbritjeProduktit).toFixed(2)
                                        : parseFloat(produkti.qmimiProduktit).toFixed(2))} €
                                </h1>
                                <p>
                                    {produkti && (produkti.qmimiMeZbritjeProduktit != null ?
                                        parseFloat(produkti.qmimiMeZbritjeProduktit - (produkti.qmimiMeZbritjeProduktit * 0.152542)).toFixed(2)
                                        : parseFloat(produkti.qmimiProduktit - (produkti.qmimiProduktit * 0.152542)).toFixed(2))} € pa TVSH
                                </p>
                                <p>
                                    Disponueshmëria: {produkti && (produkti.sasiaNeStok > 10 ? "Me shume se 10 artikuj" : produkti.sasiaNeStok + " artikuj")}
                                </p>

                                <div style={{ display: "flex", gap: "1em" }}>
                                    {produkti && produkti.sasiaNeStok > 0 &&
                                        <button
                                            onClick={handleShtoNeShporte}
                                            className="button"
                                        >
                                            Shto ne Shporte  <FontAwesomeIcon icon={faCartShopping} />
                                        </button>
                                    }
                                    {teDhenat != '' && (teDhenat.rolet.includes("Admin") ||
                                        teDhenat.rolet.includes("Menaxher")) && (produkti && produkti.sasiaNeStok) > 0 &&
                                        <button
                                            onClick={(e) => handleEdito(e)}
                                            className="button"
                                        >
                                            Perditeso <FontAwesomeIcon icon={faPenToSquare} />
                                        </button>
                                    }
                                    {produkti && produkti.sasiaNeStok <= 0 &&
                                        <button
                                            className={"button"} disabled style={{ backgroundColor: "lightgray", color: "black", cursor: "unset" }}
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
                            {produkti && produkti.pershkrimi}
                        </p>
                    </div>
                }
            </div>

            <div className="artikujt">
                <div className="titulliArtikuj">
                    <h1 className="">Me te Shiturat</h1>
                </div>
                {produktet.map((produkti) => {
                    return (
                        <ProduktetNeHome
                            produktiID={produkti && produkti.produkti && produkti.produkti.produktiId}
                            fotoProduktit={produkti && produkti.produkti && produkti.produkti.fotoProduktit}
                            emriProduktit={produkti && produkti.produkti && produkti.produkti.emriProduktit}
                            cmimi={produkti && produkti.produkti && produkti.produkti.qmimiProduktit}
                            sasiaNeStok={produkti && produkti.produkti && produkti.produkti.sasiaNeStok}
                            cmimiMeZbritje={produkti && produkti.produkti && produkti.produkti.qmimiMeZbritjeProduktit}
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
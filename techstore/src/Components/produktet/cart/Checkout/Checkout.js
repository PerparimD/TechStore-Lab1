import { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useStateValue } from "../../../../Context/StateProvider";
import PagesaMeSukses from "./PagesaMeSukses";

function Checkout(props) {
    const [teDhenat, setTeDhenat] = useState([]);
    const [loading, setLoading] = useState(true);
    const [perditeso, setPerditeso] = useState("");
    const [{ cart }, dispatch] = useStateValue();
    const [pagesaMeSukses, setPagesaMeSukses] = useState(false);
    const [pagesaDeshtoi, setPagesaDeshtoi] = useState(false);
    const [vendosjaTeDhenaveSukses, setVendosjaTeDhenaveSukses] = useState(false);
    const [vendosjaPorosisSukses, setVendosjaPorosisSukses] = useState(false);
    const [rregulloUseEffect, setRregulloUseEffect] = useState(true);

    const getID = localStorage.getItem("id");
    const navigate = useNavigate();
    const [nrFatures, setNrFatures] = useState(0);

    useEffect(() => {
        if (getID) {
            const vendosTeDhenat = async () => {
                try {
                    const perdoruesi = await axios.get(
                        `https://localhost:7285/api/Perdoruesi/shfaqSipasID?idUserAspNet=${getID}`
                    );
                    setTeDhenat(perdoruesi.data);
                } catch (err) {
                    console.log(err);
                } finally {
                    setLoading(false);
                }
            };

            vendosTeDhenat();
        } else {
            navigate("/login");
        }
    }, [perditeso]);

    const handlePerfundoPorosine = async () => {
        try {
            await axios
                .post("https://localhost:7285/api/Porosia/vendosPorosine", {
                    totaliPorosis: props.qmimiTotal,
                    idKlienti: teDhenat.perdoruesi.userId,
                    zbritja: props.zbritja,
                    totaliProdukteve: props.totaliProdukteve,
                })
                .then((response) => {
                    if (response.status === 201 || response.status === 200) {
                        setVendosjaPorosisSukses(true);
                        setNrFatures(nrFatures + response.data.idPorosia);
                    }

                    let vendosjetESakta = 0;
                    const totaliPerVendosje = cart.length;

                    cart.forEach((produkti) => {
                        axios
                            .post("https://localhost:7285/api/Porosia/vendosTeDhenatPorosise", {
                                qmimiTotal: produkti.cmimi * produkti.sasia,
                                sasiaPorositur: produkti.sasia,
                                idPorosia: response.data.idPorosia,
                                idProdukti: produkti.id,
                                qmimiProduktit: produkti.cmimi,
                            })
                            .then((r) => {
                                if (r.status === 201 || r.status === 200) {
                                    vendosjetESakta++;
                                    if (vendosjetESakta === totaliPerVendosje) {
                                        setVendosjaTeDhenaveSukses(true);
                                    }
                                }
                            })
                    });


                })
                .finally(() => {
                    setTimeout(() => {
                        if (rregulloUseEffect) {
                            setRregulloUseEffect(false);
                        } else {
                            setVendosjaTeDhenaveSukses(vendosjaTeDhenaveSukses);
                            setVendosjaPorosisSukses(vendosjaPorosisSukses);
                        }
                    }, 0);
                });

        } catch (e) {
            console.error(e)
        }
    }

    useEffect(() => {
        if (rregulloUseEffect) {
            return; 
        }

        if (vendosjaTeDhenaveSukses && vendosjaPorosisSukses) {
            setPagesaMeSukses(true);
            localStorage.removeItem("cart");
            console.log("sukses");
        } else if (!vendosjaTeDhenaveSukses || !vendosjaPorosisSukses) {
            setPagesaDeshtoi(true);
        }
    }, [vendosjaTeDhenaveSukses, vendosjaPorosisSukses]);
    return (
        <>
            {pagesaMeSukses && <PagesaMeSukses nrFatures={nrFatures}/>}
            {(pagesaMeSukses === false && pagesaDeshtoi === false) &&
                <div className="containerDashboardP">

                    <h1>Konfirmimi Porosis</h1>

                    <table>
                        <tr>
                            <th colspan="2" style={{ textAlign: "center", textTransform: "uppercase" }}>Te dhenat e Transportit</th>
                        </tr>
                        <tr>
                            <th>Klienti</th>
                            <td>
                                {teDhenat.perdoruesi &&
                                    (teDhenat.perdoruesi.emri + " " + teDhenat.perdoruesi.mbiemri)}
                            </td>
                        </tr>
                        <tr>
                            <th>Adresa</th>
                            <td id='adresa'>
                                {teDhenat.perdoruesi &&
                                    (
                                        teDhenat.perdoruesi.teDhenatPerdoruesit.adresa + ", " + teDhenat.perdoruesi.teDhenatPerdoruesit.qyteti + ", " + teDhenat.perdoruesi.teDhenatPerdoruesit.shteti + " " + teDhenat.perdoruesi.teDhenatPerdoruesit.zipKodi
                                    )}
                            </td>
                        </tr>
                        <tr>
                            <th>Numri Kontaktues</th>
                            <td id='nrKontaktit'>
                                {teDhenat.perdoruesi && teDhenat.perdoruesi.teDhenatPerdoruesit.nrKontaktit}
                            </td>
                        </tr>
                        <br />
                        <tr>
                            <th colspan="2" style={{ textAlign: "center", textTransform: "uppercase" }}>Te dhenat e Porosise</th>
                        </tr>
                        <tr>
                            <th>Totali i Produkteve</th>
                            <td>
                                <strong>
                                    {props.totaliProdukteve}
                                </strong>
                            </td>
                        </tr>
                        {props.kodiZbrijtes !== "" &&
                            <>
                                <tr>
                                    <th>Nentotali:</th>
                                    <td>
                                        {(parseFloat(props.qmimiTotal) + parseFloat(props.zbritja)).toFixed(2)} €
                                    </td>
                                </tr>
                                <tr>
                                    <th>Qmimi Zbritjes:</th>
                                    <td>
                                        - {props.zbritja} €
                                    </td>
                                </tr>
                                <tr>
                                    <th>Totali i Pergjithshem:</th>
                                    <td>
                                        <strong>
                                            {props.qmimiTotal} €
                                        </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Totali pa TVSH:</th>
                                    <td>
                                        <strong>
                                            {(props.qmimiTotal - props.qmimiTotal * 0.18).toFixed(2)} €
                                        </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <th>TVSH:</th>
                                    <td>
                                        <strong>
                                            {(props.qmimiTotal * 0.18).toFixed(2)} €
                                        </strong>
                                    </td>
                                </tr>
                            </>
                        }
                        {props.kodiZbrijtes === "" &&
                            <>
                                <tr>
                                    <th>Totali i Pergjithshem:</th>
                                    <td>
                                        <strong>
                                            {props.qmimiTotal} €
                                        </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Totali pa TVSH:</th>
                                    <td>
                                        <strong>
                                            {(props.qmimiTotal - props.qmimiTotal * 0.18).toFixed(2)} €
                                        </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <th>TVSH:</th>
                                    <td>
                                        <strong>
                                            {(props.qmimiTotal * 0.18).toFixed(2)} €
                                        </strong>
                                    </td>
                                </tr>
                            </>
                        }


                        <input type="hidden" name="qmimiTot" value="<?php echo number_format($total, 2); ?>" />
                        <tr>
                            <th>Pagesa:</th>
                            <td>Paguaj pas Pranimit te Produktit</td>
                        </tr>
                        <tr>
                            <th>Transporti:</th>
                            <td>Transport Normal - Pa Pagese</td>
                        </tr>
                        <tr>
                            <td colspan={2} style={{ textAlign: "center" }}>
                                <button className="button" name='complete' type="submit" value="Perfundo Porosin " onClick={props.setCheckout}>Anulo</button>
                                <button className="button" name='complete' type="submit" value="Perfundo Porosin " onClick={handlePerfundoPorosine}>Perfundo Porosin</button>
                                <button className="button">
                                    Perditeso te Dhenat <i className="fa-solid">&#xf4ff;</i>
                                </button>
                            </td>

                        </tr>
                    </table>
                </div>
            }
        </>
    )
}

export default Checkout;
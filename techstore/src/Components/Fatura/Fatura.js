import "./Fatura.css";
import axios from "axios";
import { useState, useEffect, useRef } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { useBarcode } from 'next-barcode';
import jsPDF from "jspdf";
import html2canvas from "html2canvas";


function Fatura(props) {
    const [perditeso, setPerditeso] = useState("");
    const [fatura, setFatura] = useState([]);
    const [vendosFature, setVendosFature] = useState(false);
    const [teDhenatBiznesit, setTeDhenatBiznesit] = useState([]);
    const [teDhenat, setTeDhenat] = useState();

    const { nrFatures } = useParams();

    const dataPorosise = new Date(fatura.dataPorosis);
    const dita = dataPorosise.getDate().toString().padStart(2, '0');
    const muaji = (dataPorosise.getMonth() + 1).toString().padStart(2, '0');
    const viti = dataPorosise.getFullYear().toString().slice(-2);
    const dataMberritjes = new Date(dataPorosise.setDate(dataPorosise.getDate() + 4));
    const skadimiGarancionit = new Date(dataPorosise.setDate(dataPorosise.getDate() + 365));

    const barkodi = `${teDhenatBiznesit && teDhenatBiznesit.shkurtesaEmritBiznesit}-${dita}${muaji}${viti}-${fatura.idKlienti}-${nrFatures}`;

    const { inputRef } = useBarcode({
        value: `${barkodi}`
    });


    const getID = localStorage.getItem("id");
    const navigate = useNavigate();

    const getToken = localStorage.getItem("token");

    const authentikimi = {
        headers: {
            Authorization: `Bearer ${getToken}`,
        },
    };

    useEffect(() => {
        if (getID) {
            const vendosFature = async () => {
                try {
                    const fatura = await axios.get(
                        `https://localhost:7285/api/Porosia/shfaqPorosineNgaID?nrFatures=${nrFatures}`, authentikimi
                    );
                    setFatura(fatura.data);

                    if (fatura.status == "200") {
                        setVendosFature(true);
                    }
                } catch (err) {
                    console.log(err);
                }
            }

            vendosFature();
        } else {
            navigate("/login");
        }
    }, [perditeso]);

    useEffect(() => {
        if (teDhenat && fatura) {
            if (!teDhenat.rolet.includes("Admin", "Menaxher") && teDhenat.perdoruesi.userId !== fatura.idKlienti) {
                navigate("/dashboard")
            }
            else {
                if (vendosFature === true) {
                    printoFaturen();
                }
            }
        }
    }, [teDhenat, vendosFature])

    useEffect(() => {
        const vendosTeDhenatBiznesit = async () => {
            try {
                const teDhenat = await axios.get(
                    "https://localhost:7285/api/TeDhenatBiznesit/ShfaqTeDhenat", authentikimi
                );
                setTeDhenatBiznesit(teDhenat.data);
            } catch (err) {
                console.log(err);
            }
        }

        vendosTeDhenatBiznesit();
    }, [perditeso]);

    useEffect(() => {
        if (getID) {
            const vendosTeDhenatUserit = async () => {
                try {
                    const teDhenatUser = await axios.get(
                        `https://localhost:7285/api/Perdoruesi/shfaqSipasID?idUserAspNet=${getID}`, authentikimi
                    );
                    setTeDhenat(teDhenatUser.data);

                } catch (err) {
                    console.log(err);
                }
            }

            vendosTeDhenatUserit();
        } else {
            navigate("/login");
        }
    }, [perditeso]);



    function printoFaturen() {
        const invoiceRef = document.querySelector('.fatura');

        html2canvas(invoiceRef, { useCORS: true })
            .then((canvas) => {
                var contentWidth = canvas.width;
                var contentHeight = canvas.height;
                var pageHeight = (contentWidth / 592.28) * 841.89;
                var leftHeight = contentHeight;
                var position = 0;
                var imgWidth = 555.28;
                var imgHeight = (imgWidth / contentWidth) * contentHeight;
                var pageData = canvas.toDataURL('image/jpeg', 1.0);
                var pdf = new jsPDF('', 'pt', 'a4');

                if (leftHeight < pageHeight) {
                    pdf.addImage(pageData, 'JPEG', 20, 0, imgWidth, imgHeight);
                } else {
                    while (leftHeight > 0) {
                        pdf.addImage(pageData, 'JPEG', 20, position, imgWidth, imgHeight);
                        leftHeight -= pageHeight;
                        position -= 841.89;
                        if (leftHeight > 0) {
                            pdf.addPage();
                        }
                    }
                }

                var klienti = (fatura ? fatura.emri + " " + fatura.mbiemri : "")
                var dataFatures = (fatura ? new Date(fatura.dataPorosis).toLocaleDateString('en-GB', { dateStyle: 'short' }) : "")

                pdf.save(klienti + " - " + barkodi + " - " + dataFatures + ".pdf");
                navigate("/dashboard");
            })
            .catch((error) => {

            });
    }


    return (
        <>
            <div className="fatura">
                <div className="header">
                    <div className="teDhenatKompanis">
                        <img src="../../img/web/techstoreLogoWhiteSquare.png" style={{ width: "150px", height: "auto", marginTop: "0.5em" }} />
                        <h1 style={{ fontSize: "24pt" }}>{teDhenatBiznesit && teDhenatBiznesit.emriIbiznesit}</h1>
                        <p><strong>NUI: </strong>{teDhenatBiznesit && teDhenatBiznesit.nui}</p>
                        <p><strong>NF: </strong>{teDhenatBiznesit && teDhenatBiznesit.nf}</p>
                        <p><strong>TVSH: </strong>{teDhenatBiznesit && teDhenatBiznesit.nrtvsh}</p>
                        <p><strong>Adresa: </strong>{teDhenatBiznesit && teDhenatBiznesit.adresa}</p>
                        <p><strong>Telefoni: </strong>{teDhenatBiznesit && teDhenatBiznesit.nrKontaktit}</p>
                        <p><strong>Email: </strong>{teDhenatBiznesit && teDhenatBiznesit.email}</p>

                        <div className="teDhenatKlientit">
                            <h1 style={{ fontSize: "24pt" }}>
                                <span id="emriKlientit">{fatura && fatura.emri} {fatura && fatura.mbiemri}</span>
                            </h1>
                            <p style={{ fontSize: "18pt" }}>{fatura && fatura.nrKontaktit}</p>
                            <p style={{ fontSize: "18pt" }}>{fatura && fatura.email}</p>
                        </div>
                    </div>

                    <div className="data">
                        <span id="nrFatures">
                            <svg ref={inputRef} style={{ width: "200px", height: "200px" }} />
                        </span>
                        <br />
                        <br />
                        <h3>Data e Porosis:
                            <span style={{ fontSize: "18pt" }} id="dataPorosis">
                                &nbsp;{fatura && (new Date(fatura.dataPorosis).toLocaleDateString('en-GB', { dateStyle: 'short' }))}
                            </span>
                        </h3>
                    </div>
                </div>

                <br />
                <hr style={{ height: "2px", borderWidth: "0", color: "gray", backgroundColor: "black" }} />
                <br />
                <br />

                <h1 style={{ textAlign: "center", fontSize: "24pt" }}>Detajet e Porosis</h1>
                <div className="tabelaETeDhenaveProduktit">
                    <table>
                        <tr>
                            <th>
                                <h3 style={{ fontSize: "18pt" }}>Emri Produktit</h3>
                            </th>
                            <th>
                                <h3 style={{ fontSize: "18pt" }}>Qmimi Produktit</h3>
                            </th>
                            <th>
                                <h3 style={{ fontSize: "18pt" }}>Sasia</h3>
                            </th>
                            <th>
                                <h3 style={{ fontSize: "18pt" }}>Qmimi Total</h3>
                            </th>
                        </tr>
                        {fatura && fatura.teDhenatEporosis && fatura.teDhenatEporosis.map((item) => {
                            return (
                                <tr>
                                    <td style={{ fontSize: "18pt" }}>{item.emriProduktit}</td>
                                    <td style={{ fontSize: "18pt" }}>{parseFloat(item.qmimiProduktit).toFixed(2)} €</td>
                                    <td style={{ fontSize: "18pt" }}>{item.sasiaPorositur}</td>
                                    <td style={{ fontSize: "18pt" }}>{parseFloat(item.qmimiTotal).toFixed(2)} €</td>
                                </tr>
                            );
                        })}
                    </table>
                </div>

                <br />
                <hr style={{ height: "2px", borderWidth: "0", color: "gray", backgroundColor: "black" }} />
                <br />
                <br />
                <br />
                <br />
                <div className="containerFatura">
                    <div className="detajetDorezimit">
                        <h1 style={{ fontSize: "24pt" }}>Detajet e dorezimit</h1>
                        <br />
                        <table>
                            <tr>
                                <td>
                                    <strong>Klienti: </strong>
                                </td>
                                <td>
                                    {fatura && fatura.emri} {fatura && fatura.mbiemri}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Numri Kontaktit: </strong>
                                </td>
                                <td>
                                    {fatura && fatura.nrKontaktit}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Email: </strong>
                                </td>
                                <td>
                                    {fatura && fatura.email}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Adresa: </strong>
                                </td>
                                <td>
                                    {fatura && (fatura.adresa + ", ")} {fatura && (fatura.qyteti + ", ")} {fatura && fatura.shteti} {fatura && fatura.zipKodi}
                                </td>
                            </tr>
                        </table>

                        <br />

                        <h1 style={{ fontSize: "24pt" }}>Shenime shtes</h1>
                        <br />
                        <h3 style={{ fontSize: "18pt" }}>Paguani pas pranimit te porosis ose me transfer bankar!</h3>
                        <p style={{ fontSize: "18pt" }}>Ne rast te pageses me transfer bankar vendosni numrin e references <strong>{barkodi}</strong></p>


                        <p style={{ fontSize: "18pt" }}>Porosia arrin me se largu:
                            <strong> {dataMberritjes.toLocaleDateString('en-GB', { day: '2-digit', month: '2-digit', year: '2-digit' })}</strong>
                        </p>
                        <br />
                    </div>
                    <div className="detajetPoresis">
                        <table className="tabelaQmimit">
                            {(fatura && fatura.zbritja !== 0.00) && (
                                <>
                                    <tr>
                                        <td>
                                            <strong>Nentotali: </strong>
                                        </td>
                                        <td>{fatura && (parseFloat(fatura.totaliPorosis) + parseFloat(fatura.zbritja)).toFixed(2)} €</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Zbritja: </strong>
                                        </td>
                                        <td>- {fatura && parseFloat(fatura.zbritja).toFixed(2)} €</td>
                                    </tr>
                                </>
                            )}
                            <tr>
                                <td>
                                    <strong>Totali Pa TVSH: </strong>
                                </td>
                                <td>{fatura && parseFloat(fatura.totaliPorosis - (fatura.totaliPorosis * 0.18)).toFixed(2)} €</td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>TVSH 18%: </strong>
                                </td>
                                <td>{fatura && parseFloat(fatura.totaliPorosis * 0.18).toFixed(2)} €</td>
                            </tr>
                            <tr>
                                <td style={{ fontSize: "18pt" }}>
                                    <strong>Qmimi Total: </strong>
                                </td>
                                <td style={{ fontSize: "18pt" }}>
                                    <strong>{fatura && parseFloat(fatura.totaliPorosis * 0.18).toFixed(2)} €</strong>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div>
                    <div className="nenshkrimet">
                        <div className="nenshkrimi">
                            <span>_________________________________________________________________</span>
                            <span>(Emri, Mbiemri, Nenshkrimi & Vula)</span>
                            <span>(Personi Përgjegjës)</span>
                        </div>
                        <div className="nenshkrimi">
                            <span>_________________________________________________________________</span>
                            <span>(Emri, Mbiemri, Nenshkrimi)</span>
                            <span>(Klienti)</span>
                        </div>

                    </div>
                    <br />
                    <h3 style={{ fontSize: "18pt" }}>Ne rast te pageses me transfer bankar ju lutem kontakotni me stafin!</h3>
                    <h3 style={{ fontSize: "18pt" }}>Te gjitha produktet ne kete fature kane garancion 1 Vjet!</h3>
                    <h3 style={{ fontSize: "18pt" }}>Garancioni vlene deri me: {skadimiGarancionit.toLocaleDateString('en-GB', { day: '2-digit', month: '2-digit', year: '2-digit' })}</h3>
                </div>

            </div>

        </>
    )
}

export default Fatura
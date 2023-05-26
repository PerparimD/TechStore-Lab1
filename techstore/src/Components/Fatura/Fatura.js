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
    const { nrFatures } = useParams();

    const dataPorosise = new Date(fatura.dataPorosis);
    const dataMberritjes = new Date(dataPorosise.setDate(dataPorosise.getDate() + 4));
    const dita = dataPorosise.getDate().toString().padStart(2, '0');
    const muaji = (dataPorosise.getMonth() + 1).toString().padStart(2, '0');
    const viti = dataPorosise.getFullYear().toString().slice(-2);

    const barkodi = `TS-${dita}${muaji}${viti}-${fatura.idKlienti}-${nrFatures}`;

    const { inputRef } = useBarcode({
        value: `${barkodi}`
    });

    useEffect(() => {
        if (vendosFature === true) {
            printoFaturen();
        }
    }, [vendosFature]);


    const getID = localStorage.getItem("id");
    const navigate = useNavigate();

    useEffect(() => {
        if (getID) {
            const vendosFature = async () => {
                try {
                    const fatura = await axios.get(
                        `https://localhost:7285/api/Porosia/shfaqPorosineNgaID?nrFatures=${nrFatures}`
                    );
                    setFatura(fatura.data);
                    console.log(fatura)
                    if(fatura.status == "200"){
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
                var nrFatures = (fatura?.idPorosia)
                var dataFatures = (fatura ? new Date(fatura.dataPorosis).toLocaleDateString('en-GB', { dateStyle: 'short' }) : "")

                pdf.save(klienti + " - " + nrFatures + " - " + dataFatures + ".pdf");
                navigate("/dashboard");
            })
            .catch((error) => {
                console.log('An error occurred while generating the PDF:', error);
            });
    }


    return (
        <>
            <div className="fatura">
                <div className="header">
                    <div className="teDhenatKompanis">
                        <img src="../../img/web/techstoreLogoWhiteSquare.png" style={{ width: "150px", height: "150px" }} />
                        <h1 style={{ fontSize: "24pt" }}>TechStore SH.P.K.</h1>
                        <p>Rr. Agim Bajrami - Perballe Xhamise, Kaçanik 71000</p>
                        <p>contact@tech.store</p>
                        <p>+1-111-222-3333</p>

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
                        <p style={{ fontSize: "18pt" }}>Paguani pas pranimit te porosis</p>
                        <p style={{ fontSize: "18pt" }}>Porosia arrin me se largu: 
                            <strong> {dataMberritjes.toLocaleDateString('en-GB', { day: '2-digit', month: '2-digit', year: '2-digit' })}</strong>
                        </p>
                        <h3 style={{ fontSize: "18pt" }}>Ju lutemi qe pas pranimit ta konfirmoni porosine ne Sistem!</h3>
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
            </div>

        </>
    )
}

export default Fatura
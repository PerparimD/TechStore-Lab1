import "./Fatura.css";
import axios from "axios";
import { useState, useEffect, useRef } from "react";
import { useNavigate, useParams } from "react-router-dom";
import jsPDF from "jspdf";
import html2canvas from "html2canvas";
import Barkodi from "./Barkodi";

import data from "../../Data/Data";

function Fatura(props) {
  const [perditeso, setPerditeso] = useState("");
  const [fatura, setFatura] = useState([]);
  const [vendosFature, setVendosFature] = useState(false);
  const [teDhenatBiznesit, setTeDhenatBiznesit] = useState([]);
  const [teDhenat, setTeDhenat] = useState();
  const [faturaTeDhenat, setFaturaTeDhenat] = useState([]);

  const { nrFatures } = useParams();

  const dataPorosise = new Date(fatura.dataPorosis);
  const dita = dataPorosise.getDate().toString().padStart(2, "0");
  const muaji = (dataPorosise.getMonth() + 1).toString().padStart(2, "0");
  const viti = dataPorosise.getFullYear().toString().slice(-2);
  const dataMberritjes = new Date(
    dataPorosise.setDate(dataPorosise.getDate() + 4)
  );
  const skadimiGarancionit = new Date(
    dataPorosise.setDate(dataPorosise.getDate() + 365)
  );

  const barkodi = `${
    teDhenatBiznesit && teDhenatBiznesit.shkurtesaEmritBiznesit
  }-${dita}${muaji}${viti}-${fatura.idKlienti}-${nrFatures}`;

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
          const fatura = data.shfaqPorosit.find(
            (item) => item.idPorosia == nrFatures
          );
          setFatura(fatura);

          const teDhenatFat = data.shfaqTeDhenatEPorosise.filter((item) => item.idPorosia == nrFatures);
          setFaturaTeDhenat(teDhenatFat);

          setVendosFature(true);
        } catch (err) {
          console.log(err);
        }
      };

      vendosFature();
    } else {
      navigate("/login");
    }
  }, [perditeso]);

  useEffect(() => {
          FaturaPerRuajtje();
  }, [teDhenat, vendosFature, faturaTeDhenat]);

  useEffect(() => {
    const vendosTeDhenatBiznesit = async () => {
      try {
        const teDhenat = data.shfaqTeDhenatBiznesit;
        setTeDhenatBiznesit(teDhenat);
      } catch (err) {
        console.log(err);
      }
    };

    vendosTeDhenatBiznesit();
  }, [perditeso]);

  useEffect(() => {
    if (getID) {
      const vendosTeDhenatUserit = async () => {
        try {
          const teDhenatUser = data.shfaqPerdoruesit.find((item) => item.perdoruesi.aspNetUserId == getID);
          setTeDhenat(teDhenatUser.data);
        } catch (err) {
          console.log(err);
        }
      };

      vendosTeDhenatUserit();
    } else {
      navigate("/login");
    }
  }, [perditeso]);

  function FaturaPerRuajtje() {
    const FaturaRef = document.querySelector(".fatura");
    const PjesaNenshkrimeveRef = document.querySelector(".PjesaNenshkrimeve");

    html2canvas(FaturaRef, { useCORS: true })
      .then((invoiceCanvas) => {
        var contentWidth = invoiceCanvas.width;
        var contentHeight = invoiceCanvas.height;
        var pageHeight = (contentWidth / 592.28) * 841.89;
        var leftHeight = contentHeight;
        var position = 0;
        var imgWidth = 555.28;
        var imgHeight = (imgWidth / contentWidth) * contentHeight;
        var invoicePageData = invoiceCanvas.toDataURL("image/jpeg", 1.0);
        var pdf = new jsPDF("", "pt", "a4");

        if (leftHeight < pageHeight) {
          pdf.addImage(invoicePageData, "JPEG", 20, 0, imgWidth, imgHeight);
        } else {
          while (leftHeight > 0) {
            pdf.addImage(
              invoicePageData,
              "JPEG",
              20,
              position,
              imgWidth,
              imgHeight
            );
            leftHeight -= pageHeight;
            position -= 841.89;
            if (leftHeight > 0) {
              pdf.addPage();
            }
          }
        }

        if (PjesaNenshkrimeveRef) {
          html2canvas(PjesaNenshkrimeveRef, { useCORS: true })
            .then((PjesaNenshkrimeveCanvas) => {
              var PjesaNenshkrimeveWidth = PjesaNenshkrimeveCanvas.width;
              var PjesaNenshkrimeveHeight = PjesaNenshkrimeveCanvas.height;
              var PjesaNenshkrimevePageHeight =
                (PjesaNenshkrimeveWidth / 592.28) * 841.89;
              var PjesaNenshkrimeveLeftHeight = PjesaNenshkrimeveHeight;
              var PjesaNenshkrimevePosition = 0;
              var PjesaNenshkrimeveImgWidth = 555.28;
              var PjesaNenshkrimeveImgHeight =
                (PjesaNenshkrimeveImgWidth / PjesaNenshkrimeveWidth) *
                PjesaNenshkrimeveHeight;
              var PjesaNenshkrimevePageData = PjesaNenshkrimeveCanvas.toDataURL(
                "image/jpeg",
                1.0
              );

              if (PjesaNenshkrimeveLeftHeight < PjesaNenshkrimevePageHeight) {
                pdf.addPage();
                pdf.addImage(
                  PjesaNenshkrimevePageData,
                  "JPEG",
                  20,
                  0,
                  PjesaNenshkrimeveImgWidth,
                  PjesaNenshkrimeveImgHeight
                );
              } else {
                while (PjesaNenshkrimeveLeftHeight > 0) {
                  pdf.addPage();
                  pdf.addImage(
                    PjesaNenshkrimevePageData,
                    "JPEG",
                    20,
                    PjesaNenshkrimevePosition,
                    PjesaNenshkrimeveImgWidth,
                    PjesaNenshkrimeveImgHeight
                  );
                  PjesaNenshkrimeveLeftHeight -= PjesaNenshkrimevePageHeight;
                  PjesaNenshkrimevePosition -= 841.89;
                  if (PjesaNenshkrimeveLeftHeight > 0) {
                    pdf.addPage();
                  }
                }
              }

              ruajFaturen(pdf);
            })
            .catch((error) => {
              ruajFaturen(pdf);
            });
        } else {
          ruajFaturen(pdf);
        }
      })
      .catch((error) => {
        console.error(error);
      });
  }

  function ruajFaturen(pdf) {
    var klienti = fatura ? fatura.emri + " " + fatura.mbiemri : "";
    var dataFatures = fatura
      ? new Date(fatura.dataPorosis).toLocaleDateString("en-GB", {
          dateStyle: "short",
        })
      : "";

    pdf.save(klienti + " - " + barkodi + " - " + dataFatures + ".pdf");
    navigate("/dashboard");
  }

  return (
    <>
      <div className="fatura">
        <div className="header">
          <div className="teDhenatKompanis">
            <img
              src={`${process.env.PUBLIC_URL}/img/web/${teDhenatBiznesit.logo}`}
              style={{ width: "150px", height: "auto", marginTop: "0.5em" }}
            />
            <h1 style={{ fontSize: "24pt" }}>
              {teDhenatBiznesit && teDhenatBiznesit.emriIbiznesit}
            </h1>
            <p>
              <strong>NUI: </strong>
              {teDhenatBiznesit && teDhenatBiznesit.nui}
            </p>
            <p>
              <strong>NF: </strong>
              {teDhenatBiznesit && teDhenatBiznesit.nf}
            </p>
            <p>
              <strong>TVSH: </strong>
              {teDhenatBiznesit && teDhenatBiznesit.nrtvsh}
            </p>
            <p>
              <strong>Adresa: </strong>
              {teDhenatBiznesit && teDhenatBiznesit.adresa}
            </p>
            <p>
              <strong>Telefoni: </strong>
              {teDhenatBiznesit && teDhenatBiznesit.nrKontaktit}
            </p>
            <p>
              <strong>Email: </strong>
              {teDhenatBiznesit && teDhenatBiznesit.email}
            </p>

            <div className="teDhenatKlientit">
              <h1 style={{ fontSize: "24pt" }}>
                <span id="emriKlientit">
                  {fatura && fatura.emri} {fatura && fatura.mbiemri}
                </span>
              </h1>
              <p style={{ fontSize: "18pt" }}>044322444</p>
              <p style={{ fontSize: "18pt" }}>email@example.com</p>
            </div>
          </div>

          <div className="data">
            <span id="nrFatures">
              <Barkodi value={barkodi} />
            </span>
            <br />
            <br />
            <h3>
              Data e Porosis:
              <span style={{ fontSize: "18pt" }} id="dataPorosis">
                &nbsp;
                {fatura &&
                  new Date(fatura.dataPorosis).toLocaleDateString("en-GB", {
                    dateStyle: "short",
                  })}
              </span>
            </h3>
            <h3>
              Statusi:
              <span style={{ fontSize: "18pt" }} id="dataPorosis">
                &nbsp;{fatura && fatura.statusiPorosis}
              </span>
            </h3>
          </div>
        </div>

        <br />
        <hr
          style={{
            height: "2px",
            borderWidth: "0",
            color: "gray",
            backgroundColor: "black",
          }}
        />
        <br />
        <br />

        <h1 style={{ textAlign: "center", fontSize: "24pt" }}>
          Detajet e Porosis
        </h1>
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
            {faturaTeDhenat &&
              faturaTeDhenat.map((item) => {
                return (
                  <tr>
                    <td style={{ fontSize: "18pt" }}>Emri Prod</td>
                    <td style={{ fontSize: "18pt" }}>
                      {parseFloat(item.qmimiProduktit).toFixed(2)} €
                    </td>
                    <td style={{ fontSize: "18pt" }}>{item.sasiaPorositur}</td>
                    <td style={{ fontSize: "18pt" }}>
                      {parseFloat(item.qmimiTotal).toFixed(2)} €
                    </td>
                  </tr>
                );
              })}
          </table>
        </div>

        <br />
        <hr
          style={{
            height: "2px",
            borderWidth: "0",
            color: "gray",
            backgroundColor: "black",
          }}
        />
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
                <td>044111222</td>
              </tr>
              <tr>
                <td>
                  <strong>Email: </strong>
                </td>
                <td>email@example.com</td>
              </tr>
              <tr>
                <td>
                  <strong>Adresa: </strong>
                </td>
                <td>
                Agim Bajrami, Kaçanik, Kosove 71000
                </td>
              </tr>
            </table>

            <br />

            <h1 style={{ fontSize: "24pt" }}>Shenime shtes</h1>
            <br />
            <h3 style={{ fontSize: "18pt" }}>
              Paguani pas pranimit te porosis ose me transfer bankar!
            </h3>
            <p style={{ fontSize: "18pt" }}>
              Ne rast te pageses me transfer bankar vendosni numrin e references{" "}
              <strong>{barkodi}</strong>
            </p>

            <p style={{ fontSize: "18pt" }}>
              Porosia arrin me se largu:
              <strong>
                {" "}
                {dataMberritjes.toLocaleDateString("en-GB", {
                  day: "2-digit",
                  month: "2-digit",
                  year: "2-digit",
                })}
              </strong>
            </p>
            <br />
          </div>
          <div className="detajetPoresis">
            <table className="tabelaQmimit">
              {fatura && fatura.zbritja !== 0.0 && (
                <>
                  <tr>
                    <td>
                      <strong>Nentotali: </strong>
                    </td>
                    <td>
                      {fatura &&
                        (
                          parseFloat(fatura.totaliPorosis) +
                          parseFloat(fatura.zbritja)
                        ).toFixed(2)}{" "}
                      €
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <strong>Zbritja: </strong>
                    </td>
                    <td>
                      - {fatura && parseFloat(fatura.zbritja).toFixed(2)} €
                    </td>
                  </tr>
                </>
              )}
              <tr>
                <td>
                  <strong>Totali Pa TVSH: </strong>
                </td>
                <td>
                  {fatura &&
                    parseFloat(
                      fatura.totaliPorosis - fatura.totaliPorosis * 0.152542
                    ).toFixed(2)}{" "}
                  €
                </td>
              </tr>
              <tr>
                <td>
                  <strong>TVSH 18%: </strong>
                </td>
                <td>
                  {fatura &&
                    parseFloat(fatura.totaliPorosis * 0.152542).toFixed(2)}{" "}
                  €
                </td>
              </tr>
              <tr>
                <td style={{ fontSize: "18pt" }}>
                  <strong>Qmimi Total: </strong>
                </td>
                <td style={{ fontSize: "18pt" }}>
                  <strong>
                    {fatura && parseFloat(fatura.totaliPorosis).toFixed(2)} €
                  </strong>
                </td>
              </tr>
            </table>
          </div>
        </div>
      </div>

      <div className="PjesaNenshkrimeve">
        <div className="header">
          <div className="teDhenatKompanis">
            <img
              src={`${process.env.PUBLIC_URL}/img/web/${teDhenatBiznesit.logo}`}
              style={{ width: "150px", height: "auto", marginTop: "0.5em" }}
            />
            <h1 style={{ fontSize: "24pt" }}>
              {teDhenatBiznesit && teDhenatBiznesit.emriIbiznesit}
            </h1>
            <p>
              <strong>NUI: </strong>
              {teDhenatBiznesit && teDhenatBiznesit.nui}
            </p>
            <p>
              <strong>NF: </strong>
              {teDhenatBiznesit && teDhenatBiznesit.nf}
            </p>
            <p>
              <strong>TVSH: </strong>
              {teDhenatBiznesit && teDhenatBiznesit.nrtvsh}
            </p>
            <p>
              <strong>Adresa: </strong>
              {teDhenatBiznesit && teDhenatBiznesit.adresa}
            </p>
            <p>
              <strong>Telefoni: </strong>
              {teDhenatBiznesit && teDhenatBiznesit.nrKontaktit}
            </p>
            <p>
              <strong>Email: </strong>
              {teDhenatBiznesit && teDhenatBiznesit.email}
            </p>
          </div>

          <div className="data">
            <span id="nrFatures">
              <Barkodi value={barkodi} />
            </span>
            <br />
            <br />
            <h3>
              Data e Porosis:
              <span style={{ fontSize: "18pt" }} id="dataPorosis">
                &nbsp;
                {fatura &&
                  new Date(fatura.dataPorosis).toLocaleDateString("en-GB", {
                    dateStyle: "short",
                  })}
              </span>
            </h3>
            <h3>
              Statusi:
              <span style={{ fontSize: "18pt" }} id="dataPorosis">
                &nbsp;{fatura && fatura.statusiPorosis}
              </span>
            </h3>
          </div>
        </div>
        <div className="nenshkrimet">
          <div className="nenshkrimi">
            <span>
              _________________________________________________________________
            </span>
            <span>(Emri, Mbiemri, Nenshkrimi & Vula)</span>
            <span>(Personi Përgjegjës)</span>
          </div>
          <div className="nenshkrimi">
            <span>
              _________________________________________________________________
            </span>
            <span>(Emri, Mbiemri, Nenshkrimi)</span>
            <span>(Klienti)</span>
          </div>
        </div>
        <br />
        <h3 style={{ fontSize: "18pt" }}>
          Ne rast te pageses me transfer bankar ju lutem kontaktoni me stafin!
        </h3>
        <h3 style={{ fontSize: "18pt" }}>
          Te gjitha produktet ne kete fature kane garancion 1 Vjet!
        </h3>
        <h3 style={{ fontSize: "18pt" }}>
          Garancioni vlene deri me:{" "}
          {skadimiGarancionit.toLocaleDateString("en-GB", {
            day: "2-digit",
            month: "2-digit",
            year: "2-digit",
          })}
        </h3>
      </div>
    </>
  );
}

export default Fatura;

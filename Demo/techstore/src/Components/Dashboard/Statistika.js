import classes from "./Styles/Statistika.module.css";
import Card from "react-bootstrap/Card";
import axios from "axios";
import { useState, useEffect } from "react";

import data from "../../Data/Data";

function Statistika() {
  const [totaleTeNdryshme, setTotaleTeNdryshme] = useState([]);
  const [top15Bleresit, setTop15Bleresit] = useState([]);
  const [top15Produktet, setTop15Produktet] = useState([]);
  const [shitjetJavore, setShitjetJavore] = useState([]);

  useEffect(() => {
    const vendosTotalinPerdoruesve = async () => {
      try {
        const totalet = data.shfaqTotaleTeNdryshme;
        setTotaleTeNdryshme(totalet);
      } catch (e) {
        console.error(e);
      }
    };

    const vendosTop15Bleresit = async () => {
      try {
        const bleresit = data.shfaq15PerdoruesitMeSeShumtiBlerje;
        setTop15Bleresit(bleresit);
      } catch (e) {
        console.error(e);
      }
    };

    const vendosTop15Produktet = async () => {
      try {
        const produktet = data.shfaq15ProduktetMeTeShitura;
        setTop15Produktet(produktet);
      } catch (e) {
        console.error(e);
      }
    };

    const vendosShitjetJavore = async () => {
      try {
        const dita = data.shfaqTotaletJavore;
        setShitjetJavore(dita);
      } catch (e) {
        console.error(e);
      }
    };

    vendosTotalinPerdoruesve();
    vendosTop15Bleresit();
    vendosTop15Produktet();
    vendosShitjetJavore();
  }, []);

  function shfaqDiten(data) {
    const options = { weekday: "long" };
    const dataAktuale = new Date(data);
    const emriDites = dataAktuale.toLocaleDateString("sq-AL", options);

    const shkronjatEPara = emriDites.slice(0, 3).toUpperCase();

    const emriDitesIKonvertuar = shkronjatEPara + emriDites.slice(3);

    return emriDitesIKonvertuar;
  }

  return (
    <div className={classes.containerDashboardP}>
      <h1 className="title">Statistikat e Dyqanit</h1>
      <hr />
      <h1 className="title">Statistikat e Pergjithshme</h1>
      <div className={classes.cardStatisitkat}>
        <Card className={classes.KartaStatistikave} border="dark">
          <Card.Header>Totali Shitjeve</Card.Header>
          <Card.Body>
            <Card.Text>
              <span className={classes.TekstiStatistika}>
                {parseFloat(totaleTeNdryshme.totaliShitjeve).toFixed(2)} €
              </span>
            </Card.Text>
          </Card.Body>
        </Card>
        <Card className={classes.KartaStatistikave} border="dark">
          <Card.Header>Totali Porosive</Card.Header>
          <Card.Body>
            <Card.Text>
              <span className={classes.TekstiStatistika}>
                {totaleTeNdryshme.totaliPorosive}
              </span>
            </Card.Text>
          </Card.Body>
        </Card>
        <Card className={classes.KartaStatistikave} border="dark">
          <Card.Header>Totali Produkteve</Card.Header>
          <Card.Body>
            <Card.Text>
              <span className={classes.TekstiStatistika}>
                {totaleTeNdryshme.totaliProdukteve}
              </span>
            </Card.Text>
          </Card.Body>
        </Card>
        <Card className={classes.KartaStatistikave} border="dark">
          <Card.Header>Totali Perdoruesve</Card.Header>
          <Card.Body>
            <Card.Text>
              <span className={classes.TekstiStatistika}>
                {totaleTeNdryshme.totaliUsers}
              </span>
            </Card.Text>
          </Card.Body>
        </Card>
      </div>
      <hr />
      <h1 className="title">Statistikat Ditore dhe Mujore</h1>
      <div className={classes.cardStatisitkat}>
        <Card
          className={classes.KartaStatistikave}
          bg={
            totaleTeNdryshme.totaliShitjeveSotme >
            totaleTeNdryshme.totaliShitjeveDjeshme
              ? "success"
              : totaleTeNdryshme.totaliShitjeveDjeshme ===
                totaleTeNdryshme.totaliShitjeveSotme
              ? "light"
              : "danger"
          }
          text={
            totaleTeNdryshme.totaliShitjeveSotme ===
            totaleTeNdryshme.totaliShitjeveDjeshme
              ? "dark"
              : "white"
          }>
          <Card.Header>Totali Shitjev Sotme</Card.Header>
          <Card.Body>
            <Card.Text>
              <span className={classes.TekstiStatistika}>
                {parseFloat(totaleTeNdryshme.totaliShitjeveSotme).toFixed(2)} €
              </span>
              <p>
                {totaleTeNdryshme.totaliShitjeveSotme >
                totaleTeNdryshme.totaliShitjeveDjeshme
                  ? (
                      totaleTeNdryshme.totaliShitjeveSotme -
                      totaleTeNdryshme.totaliShitjeveDjeshme
                    ).toFixed(2) + "€ Shitje me shume se Dje"
                  : totaleTeNdryshme.totaliShitjeveDjeshme ===
                    totaleTeNdryshme.totaliShitjeveSotme
                  ? "Njesoj si Dje"
                  : (
                      totaleTeNdryshme.totaliShitjeveDjeshme -
                      totaleTeNdryshme.totaliShitjeveSotme
                    ).toFixed(2) + "€ Shitje me pak se Dje"}
              </p>
            </Card.Text>
          </Card.Body>
        </Card>
        <Card
          className={classes.KartaStatistikave}
          bg={
            totaleTeNdryshme.totaliPorosiveSotme >
            totaleTeNdryshme.totaliPorosiveDjeshme
              ? "success"
              : totaleTeNdryshme.totaliPorosiveDjeshme ===
                totaleTeNdryshme.totaliPorosiveSotme
              ? "light"
              : "danger"
          }
          text={
            totaleTeNdryshme.totaliPorosiveSotme ===
            totaleTeNdryshme.totaliPorosiveDjeshme
              ? "dark"
              : "white"
          }>
          <Card.Header>Totali Porosive Sotme</Card.Header>
          <Card.Body>
            <Card.Text>
              <span className={classes.TekstiStatistika}>
                {totaleTeNdryshme.totaliPorosiveSotme}
              </span>
              <p>
                {totaleTeNdryshme.totaliPorosiveSotme >
                totaleTeNdryshme.totaliPorosiveDjeshme
                  ? totaleTeNdryshme.totaliPorosiveSotme -
                    totaleTeNdryshme.totaliPorosiveDjeshme +
                    " Porosi me shume se Dje"
                  : totaleTeNdryshme.totaliPorosiveDjeshme ===
                    totaleTeNdryshme.totaliPorosiveSotme
                  ? "Njesoj si Dje"
                  : totaleTeNdryshme.totaliPorosiveDjeshme -
                    totaleTeNdryshme.totaliPorosiveSotme +
                    " Porosi me pak se Dje"}
              </p>
            </Card.Text>
          </Card.Body>
        </Card>
        <Card
          className={classes.KartaStatistikave}
          bg={
            totaleTeNdryshme.totaliShitjeveKeteMuaj >
            totaleTeNdryshme.totaliShitjeveMuajinKaluar
              ? "success"
              : totaleTeNdryshme.totaliShitjeveMuajinKaluar ===
                totaleTeNdryshme.totaliShitjeveKeteMuaj
              ? "light"
              : "danger"
          }
          text={
            totaleTeNdryshme.totaliShitjeveKeteMuaj ===
            totaleTeNdryshme.totaliShitjeveMuajinKaluar
              ? "dark"
              : "white"
          }>
          <Card.Header>Totali Shitjev Kete muaj</Card.Header>
          <Card.Body>
            <Card.Text>
              <span className={classes.TekstiStatistika}>
                {parseFloat(totaleTeNdryshme.totaliShitjeveKeteMuaj).toFixed(2)}{" "}
                €
              </span>
              <p>
                {totaleTeNdryshme.totaliShitjeveKeteMuaj >
                totaleTeNdryshme.totaliShitjeveMuajinKaluar
                  ? (
                      totaleTeNdryshme.totaliShitjeveKeteMuaj -
                      totaleTeNdryshme.totaliShitjeveMuajinKaluar
                    ).toFixed(2) + "€ Shitje me shume se muajin e Kaluar"
                  : totaleTeNdryshme.totaliShitjeveMuajinKaluar ===
                    totaleTeNdryshme.totaliShitjeveKeteMuaj
                  ? "Njesoj si muajin e kaluar"
                  : (
                      totaleTeNdryshme.totaliShitjeveMuajinKaluar -
                      totaleTeNdryshme.totaliShitjeveKeteMuaj
                    ).toFixed(2) + "€ Shitje me pak se muajin e Kaluar"}
              </p>
            </Card.Text>
          </Card.Body>
        </Card>
        <Card
          className={classes.KartaStatistikave}
          bg={
            totaleTeNdryshme.totaliPorosiveKeteMuaj >
            totaleTeNdryshme.totaliPorosiveMuajinKaluar
              ? "success"
              : totaleTeNdryshme.totaliPorosiveMuajinKaluar ===
                totaleTeNdryshme.totaliPorosiveKeteMuaj
              ? "light"
              : "danger"
          }
          text={
            totaleTeNdryshme.totaliPorosiveKeteMuaj ===
            totaleTeNdryshme.totaliPorosiveMuajinKaluar
              ? "dark"
              : "white"
          }>
          <Card.Header>Totali Porosive Kete muaj</Card.Header>
          <Card.Body>
            <Card.Text>
              <span className={classes.TekstiStatistika}>
                {totaleTeNdryshme.totaliPorosiveKeteMuaj}
              </span>
              <p>
                {totaleTeNdryshme.totaliPorosiveKeteMuaj >
                totaleTeNdryshme.totaliPorosiveMuajinKaluar
                  ? totaleTeNdryshme.totaliPorosiveKeteMuaj -
                    totaleTeNdryshme.totaliPorosiveMuajinKaluar +
                    " Porosi me shume se muajin e Kaluar"
                  : totaleTeNdryshme.totaliPorosiveMuajinKaluar ===
                    totaleTeNdryshme.totaliPorosiveKeteMuaj
                  ? "Njesoj si muajin e kaluar"
                  : totaleTeNdryshme.totaliPorosiveMuajinKaluar -
                    totaleTeNdryshme.totaliPorosiveKeteMuaj +
                    " Porosi me pak se muajin e Kaluar"}
              </p>
            </Card.Text>
          </Card.Body>
        </Card>
      </div>
      <hr />
      <h1 className="title">Statistikat Tabelare</h1>

      <div className={classes.cardStatisitkat}>
        <Card border="dark">
          <Card.Header>Produktet me Te Shitura</Card.Header>
          <Card.Body>
            <Card.Text>
              <table style={{ whiteSpace: "unset", width: "100%" }}>
                <tr>
                  <th>ID Produktit</th>
                  <th>Emri Produktit</th>
                  <th>Qmimi Shites €</th>
                  <th>Totali i Porosive</th>
                  <th>Totali Shitjeve €</th>
                </tr>
                {top15Produktet.map((k) => (
                  <tr key={k.produkti.produktiId}>
                    <td>{k.produkti.produktiId}</td>
                    <td>{k.produkti.emriProduktit}</td>
                    <td>
                      {parseFloat(k.produkti.qmimiProduktit).toFixed(2)} €
                    </td>
                    <td>{k.totaliPorosive}</td>
                    <td>{parseFloat(k.totaliBlerjeve).toFixed(2)} €</td>
                  </tr>
                ))}
              </table>
            </Card.Text>
          </Card.Body>
        </Card>
      </div>
      <div className={classes.cardStatisitkat}>
        <Card border="dark">
          <Card.Header>Klientet me se Shumti Blerje</Card.Header>
          <Card.Body>
            <Card.Text>
              <table style={{ whiteSpace: "unset", width: "100%" }}>
                <tr>
                  <th>ID Klientit</th>
                  <th>Emri & Mbiemri</th>
                  <th>Totali Porosive</th>
                  <th>Shuma Totale Porosive</th>
                </tr>
                {top15Bleresit.map((k) => (
                  <tr key={k.user.id}>
                    <td>{k.user.id}</td>
                    <td>
                      {k.user.emri} {k.user.mbiemri}
                    </td>
                    <td>{k.totaliPorosive}</td>
                    <td>{parseFloat(k.totaliBlerjeve).toFixed(2)} €</td>
                  </tr>
                ))}
              </table>
            </Card.Text>
          </Card.Body>
        </Card>
        <Card border="dark">
          <Card.Header>Statistikat Javore</Card.Header>
          <Card.Body>
            <Card.Text>
              <table style={{ whiteSpace: "unset", width: "100%" }}>
                <tr>
                  <th>Data</th>
                  <th>Dita</th>
                  <th>Porosite Ditore</th>
                  <th>Shitjet Ditore €</th>
                </tr>
                {shitjetJavore.totaletDitore &&
                  shitjetJavore.totaletDitore.map((k) => (
                    <tr key={k.data}>
                      <td>
                        {new Date(k.data).toLocaleDateString("en-GB", {
                          dateStyle: "short",
                        })}
                      </td>
                      <td>{shfaqDiten(k.data)}</td>
                      <td>{k.totaliPorosiveDitore}</td>
                      <td>{parseFloat(k.totaliShitjeveDitore).toFixed(2)} €</td>
                    </tr>
                  ))}
                {shitjetJavore.totaletJavore && (
                  <tr key="totaletJavore" style={{ fontWeight: "bold" }}>
                    <td colSpan={2}>Totali:</td>
                    <td>{shitjetJavore.totaletJavore.totaliPorosiveJavore}</td>
                    <td>
                      {parseFloat(
                        shitjetJavore.totaletJavore.totaliShitjeveJavore
                      ).toFixed(2)}{" "}
                      €
                    </td>
                  </tr>
                )}
              </table>
            </Card.Text>
          </Card.Body>
        </Card>
      </div>
    </div>
  );
}

export default Statistika;

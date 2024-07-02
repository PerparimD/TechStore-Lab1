import { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useStateValue } from "../../../../Context/StateProvider";
import PagesaMeSukses from "./PagesaMeSukses";
import EditoTeDhenat from "./EditoTeDhenat";
import Mesazhi from "../../../layout/Mesazhi";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faUserPen } from "@fortawesome/free-solid-svg-icons";

import shfaqPerdouresit from "../../../../Data/shfaqPerdoruesit.json";

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
  const [mbyllPerditesoTeDhenat, setMbyllPerditesoTeDhenat] = useState(true);
  const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
  const [tipiMesazhit, setTipiMesazhit] = useState("");
  const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");

  const getID = localStorage.getItem("id");
  const navigate = useNavigate();
  const [nrFatures, setNrFatures] = useState(0);

  useEffect(() => {
    if (getID) {
      const vendosTeDhenat = async () => {
        try {
          const perdoruesi = shfaqPerdouresit.find(
            (item) => item.perdoruesi.aspNetUserId == getID
          );
          setTeDhenat(perdoruesi);
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
    setVendosjaPorosisSukses(true);
    setNrFatures(nrFatures + 1);
    setVendosjaTeDhenaveSukses(true);

    setVendosjaTeDhenaveSukses(vendosjaTeDhenaveSukses);
    setVendosjaPorosisSukses(vendosjaPorosisSukses);
    setPagesaMeSukses(true);
      localStorage.removeItem("cart");
  };
  return (
    <>
      {shfaqMesazhin && (
        <Mesazhi
          setShfaqMesazhin={setShfaqMesazhin}
          pershkrimi={pershkrimiMesazhit}
          tipi={tipiMesazhit}
        />
      )}
      {pagesaMeSukses && <PagesaMeSukses nrFatures={nrFatures} />}
      {!mbyllPerditesoTeDhenat && (
        <EditoTeDhenat
          setMbyllPerditesoTeDhenat={() => setMbyllPerditesoTeDhenat(true)}
          perditeso={() => setPerditeso(Date.now())}
          setShfaqMesazhin={() => setShfaqMesazhin(true)}
          pershkrimi={setPershkrimiMesazhit}
          tipi={setTipiMesazhit}
        />
      )}
      {pagesaMeSukses === false && pagesaDeshtoi === false && (
        <div className="containerDashboardPP containerCheckoutForma">
          <h3 className="titleP">Konfirmimi Porosis</h3>

          <table>
            <tr>
              <th
                colspan="2"
                style={{
                  textAlign: "center",
                  textTransform: "uppercase",
                  borderBottom: "0",
                }}>
                Te dhenat e Transportit
              </th>
            </tr>
            <tr>
              <th>Klienti:</th>
              <td>
                {teDhenat.perdoruesi &&
                  teDhenat.perdoruesi.emri + " " + teDhenat.perdoruesi.mbiemri}
              </td>
            </tr>
            <tr>
              <th>Adresa:</th>
              <td id="adresa">
                {teDhenat.perdoruesi &&
                  teDhenat.perdoruesi.teDhenatPerdoruesit &&
                  teDhenat.perdoruesi.teDhenatPerdoruesit.adresa +
                    ", " +
                    teDhenat.perdoruesi.teDhenatPerdoruesit.qyteti +
                    ", " +
                    teDhenat.perdoruesi.teDhenatPerdoruesit.shteti +
                    " " +
                    teDhenat.perdoruesi.teDhenatPerdoruesit.zipKodi}
              </td>
            </tr>
            <tr>
              <th>Numri Kontaktues:</th>
              <td id="nrKontaktit">
                {teDhenat.perdoruesi &&
                  teDhenat.perdoruesi.teDhenatPerdoruesit &&
                  teDhenat.perdoruesi.teDhenatPerdoruesit.nrKontaktit}
              </td>
            </tr>
            <tr>
              <th
                colspan="2"
                style={{
                  textAlign: "center",
                  textTransform: "uppercase",
                  borderBottom: "0",
                }}>
                Te dhenat e Porosise
              </th>
            </tr>
            <tr>
              <th>Totali i Produkteve:</th>
              <td>
                <strong>{props.totaliProdukteve}</strong>
              </td>
            </tr>
            {props.kodiZbrijtes !== "" && (
              <>
                <tr>
                  <th>Nentotali:</th>
                  <td>
                    {(
                      parseFloat(props.qmimiTotal) + parseFloat(props.zbritja)
                    ).toFixed(2)}{" "}
                    €
                  </td>
                </tr>
                <tr>
                  <th>Qmimi Zbritjes:</th>
                  <td>- {props.zbritja} €</td>
                </tr>
                <tr>
                  <th>Totali i Pergjithshem:</th>
                  <td>
                    <strong>{props.qmimiTotal} €</strong>
                  </td>
                </tr>
                <tr>
                  <th>Totali pa TVSH:</th>
                  <td>
                    <strong>
                      {(props.qmimiTotal - props.qmimiTotal * 0.152542).toFixed(
                        2
                      )}{" "}
                      €
                    </strong>
                  </td>
                </tr>
                <tr>
                  <th>TVSH:</th>
                  <td>
                    <strong>
                      {(props.qmimiTotal * 0.152542).toFixed(2)} €
                    </strong>
                  </td>
                </tr>
              </>
            )}
            {props.kodiZbrijtes === "" && (
              <>
                <tr>
                  <th>Totali i Pergjithshem:</th>
                  <td>
                    <strong>{props.qmimiTotal} €</strong>
                  </td>
                </tr>
                <tr>
                  <th>Totali pa TVSH:</th>
                  <td>
                    <strong>
                      {(props.qmimiTotal - props.qmimiTotal * 0.152542).toFixed(
                        2
                      )}{" "}
                      €
                    </strong>
                  </td>
                </tr>
                <tr>
                  <th>TVSH:</th>
                  <td>
                    <strong>
                      {(props.qmimiTotal * 0.152542).toFixed(2)} €
                    </strong>
                  </td>
                </tr>
              </>
            )}

            <input
              type="hidden"
              name="qmimiTot"
              value="<?php echo number_format($total, 2); ?>"
            />
            <tr>
              <th>Pagesa:</th>
              <td>Paguaj pas Pranimit te Produktit</td>
            </tr>
            <tr>
              <th>Transporti:</th>
              <td>Transport Normal - Pa Pagese</td>
            </tr>
            <tr>
              <td colspan={2}>
                <div
                  style={{
                    display: "flex",
                    gap: "1em",
                    justifyContent: "center",
                    marginBottom: "1em",
                  }}>
                  <button
                    className="button"
                    name="complete"
                    type="submit"
                    value="Perfundo Porosin "
                    onClick={props.setCheckout}>
                    Anulo
                  </button>
                  <button
                    className="button"
                    onClick={() => setMbyllPerditesoTeDhenat(false)}>
                    {" "}
                    Perditeso te Dhenat <FontAwesomeIcon
                      icon={faUserPen}
                    />{" "}
                  </button>
                  <button
                    className="button"
                    name="complete"
                    type="submit"
                    value="Perfundo Porosin "
                    onClick={handlePerfundoPorosine}>
                    Perfundo Porosin
                  </button>
                </div>
              </td>
            </tr>
          </table>
        </div>
      )}
    </>
  );
}

export default Checkout;

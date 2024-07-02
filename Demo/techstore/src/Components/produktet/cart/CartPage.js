import { React, useState, useEffect } from "react";
import { useStateValue } from "../../../Context/StateProvider";
import CartProduct from "./CartProduct";
import Mesazhi from "../../layout/Mesazhi";
import "./CartPage.css";
import { faFaceFrown } from "@fortawesome/free-regular-svg-icons";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCheck } from "@fortawesome/free-solid-svg-icons";
import axios from "axios";
import Checkout from "./Checkout/Checkout";

import data from "../../../Data/Data";

function CartPage() {
  const [{ cart }, dispatch] = useStateValue();
  const [promoCode, setPromoCode] = useState('');
  const [kontrollo, setKontrollo] = useState('');
  const [teDhenatZbritje, setTeDhenatZbritjes] = useState([]);
  const [qmimiTot, setQmimiTot] = useState(0);
  const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
  const [tipiMesazhit, setTipiMesazhit] = useState("");
  const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");
  const [checkout, setCheckout] = useState(false);

  useEffect(() => {
    const KontrolloKodin = async () => {
      try {
        const kodiZbritjes = data.shfaqKodet.find((item) => item.kodi == promoCode);

        setTeDhenatZbritjes(kodiZbritjes)

        if (kodiZbritjes && kodiZbritjes.idProdukti == null) {
          if (qmimiTot > (kodiZbritjes && kodiZbritjes.qmimiZbritjes)) {
            setQmimiTot((p) => p - (kodiZbritjes && kodiZbritjes.qmimiZbritjes));
          } else {
            let shumaZbritjes = (kodiZbritjes && kodiZbritjes.qmimiZbritjes);
            setTeDhenatZbritjes([]);
            setTipiMesazhit("danger");
            setPershkrimiMesazhit(`Shuma e zbritjes eshte: <strong>${shumaZbritjes.toFixed(2)} €</strong> ndersa totali juaj eshte: <strong>${qmimiTot.toFixed(2)} € </strong>ju lutemi provoni nje kod tjeter ose shtoni produkte ne shporte!`);
            setShfaqMesazhin(true);
            setPromoCode('');
          }
        } else {
          {
            cart.length !== 0 && cart.map((item) => {
              if (cart.find((item) => item.id === kodiZbritjes.idProdukti)) {
                setQmimiTot((p) => p - kodiZbritjes.qmimiZbritjes);
              } else {
                setTeDhenatZbritjes([]);
                setTipiMesazhit("danger");
                setPershkrimiMesazhit(`Ky kod nuk vlen për produktet në shportën tuaj!`);
                setShfaqMesazhin(true);
                setPromoCode('');
              }

            })
          }
        }

      } catch (err) {
        console.log(err);
      }
    };

    KontrolloKodin();
  }, [kontrollo]);

  useEffect(() => {
    let totali = 0;
    cart.forEach((item) => {
      totali += item.cmimi * item.sasia;
    });

    setQmimiTot(totali);
  }, [cart]);

  const handlePromoCodeChange = (event) => {
    setPromoCode(event.target.value);
  }

  const handleApplyPromoCode = () => {
    setKontrollo(Date.now());

  }
  return (
    <>
      {shfaqMesazhin && <Mesazhi
        setShfaqMesazhin={setShfaqMesazhin}
        pershkrimi={pershkrimiMesazhit}
        tipi={tipiMesazhit}
      />}
      {checkout &&
        <Checkout
          setCheckout={() => setCheckout(false)}
          qmimiTotal={qmimiTot.toFixed(2)}
          zbritja={(teDhenatZbritje && teDhenatZbritje.qmimiZbritjes) ? (teDhenatZbritje && teDhenatZbritje.qmimiZbritjes).toFixed(2) : 0}
          kodiZbrijtes={(teDhenatZbritje && teDhenatZbritje.kodi) ? (teDhenatZbritje && teDhenatZbritje.kodi) : ""}
          totaliProdukteve={cart.length}
        />
      }
      {!checkout && <>
        <h2 className="cart-title"></h2>
        <div className="cart-page" >
          <div className="cart-items">
            {cart.length !== 0 && cart.map((item) => {
              return (
                <CartProduct
                  key={item.id}
                  id={item.id}
                  fotoProduktit={item.foto}
                  emriProduktit={item.emri}
                  cmimi={item.cmimi}
                  sasia={item.sasia}
                  sasiaNeStok={item.sasiaNeStok}
                />
              );

            })
            }
            {cart.length === 0 && <h1 className="shporta-zbrazet">Nuk Keni asnje Produkt ne Shporte! <FontAwesomeIcon icon={faFaceFrown} /></h1>}
          </div>
          {cart.length !== 0 &&
            <div className="details">
              <h3 className="d-title">Detajet e Shportes</h3>
              <h4>Totali produkteve: {cart.length}</h4>
              {teDhenatZbritje && teDhenatZbritje.length == 0 &&
                <div className="promo-input-container">
                  <input
                    id="promo-input"
                    type="text"
                    placeholder="Kodi Zbritjes"
                    value={promoCode}
                    onChange={handlePromoCodeChange}
                  />
                  <button className="promo-button" onClick={handleApplyPromoCode}><FontAwesomeIcon icon={faCheck} /></button>
                </div>}
              {teDhenatZbritje && teDhenatZbritje.length !== 0 &&
                <>
                  <h4>Qmimi total: {(qmimiTot + teDhenatZbritje.qmimiZbritjes).toFixed(2)} €</h4>
                  <h4>Qmimi total - Zbritja: {qmimiTot.toFixed(2)} €</h4>
                </>
              }
              {teDhenatZbritje && teDhenatZbritje.length === 0 && <h4>Qmimi total: {qmimiTot.toFixed(2)} €</h4>}
              <p><strong>Qmimi total pa TVSH: </strong>{(qmimiTot - qmimiTot * 0.152542).toFixed(2)} €</p>
              <p><strong>TVSH: </strong>{(qmimiTot * 0.152542).toFixed(2)} €</p>
              {teDhenatZbritje && teDhenatZbritje.length !== 0 &&
                <div className="zbritja">
                  <hr />
                  <p><strong>Kodi i Perdorur: </strong>{teDhenatZbritje.kodi}</p>
                  <p><strong>Qmimi i Zbritjes: </strong>{teDhenatZbritje.qmimiZbritjes.toFixed(2)} €</p>
                </div>
              }

              <button className="cart-button" onClick={() => setCheckout(true)}> Buy Now</button>
            </div>
          }
        </div>
      </>}
    </>
  );
};

export default CartPage;

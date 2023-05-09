import { React, useState, useEffect } from "react";
import { useStateValue } from "../../../Context/StateProvider";
import CartProduct from "./CartProduct";
import Mesazhi from "../../layout/Mesazhi";
import "./CartPage.css";
import { faFaceFrown } from "@fortawesome/free-regular-svg-icons";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCheck } from "@fortawesome/free-solid-svg-icons";
import axios from "axios";

function CartPage() {
  const [{ cart }, dispatch] = useStateValue();
  const [promoCode, setPromoCode] = useState('');
  const [kontrollo, setKontrollo] = useState('');
  const [teDhenatZbritje, setTeDhenatZbritjes] = useState([]);
  const [qmimiTot, setQmimiTot] = useState(0);
  const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
  const [tipiMesazhit, setTipiMesazhit] = useState("");
  const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");
  useEffect(() => {
    const KontrolloKodin = async () => {
      try {
        const kodiZbritjes = await axios.get(`https://localhost:7285/api/KodiZbritje/gjejKodin?kodi=${promoCode}`);

        setTeDhenatZbritjes(kodiZbritjes.data)

        if (kodiZbritjes.data.idProdukti === null) {
          if (qmimiTot > kodiZbritjes.data.qmimiZbritjes) {
            setQmimiTot((p) => p - kodiZbritjes.data.qmimiZbritjes);
          } else {
            let shumaZbritjes = kodiZbritjes.data.qmimiZbritjes;
            setTeDhenatZbritjes([]);
            setTipiMesazhit("danger");
            setPershkrimiMesazhit(`Shuma e zbritjes eshte: <strong>${shumaZbritjes.toFixed(2)} €</strong> ndersa totali juaj eshte: <strong>${qmimiTot.toFixed(2)} € </strong>ju lutemi provoni nje kod tjeter ose shtoni produkte ne shporte!`);
            setShfaqMesazhin(true);
            setPromoCode('');
          }
        } else {
          {
            cart.length !== 0 && cart.map((item) => {
              if (cart.find((item) => item.id === kodiZbritjes.data.idProdukti)) {
                setQmimiTot((p) => p - kodiZbritjes.data.qmimiZbritjes);
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
    // Calculate the total price from the items in the cart
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
    console.log(teDhenatZbritje)
  }
  return (
    <>
      {shfaqMesazhin && <Mesazhi
        setShfaqMesazhin={setShfaqMesazhin}
        pershkrimi={pershkrimiMesazhit}
        tipi={tipiMesazhit}
      />}
      <h2 className="cart-title"></h2>
      <div className="cart-page">
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
            {teDhenatZbritje.length === 0 &&
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
            <h4>Qmimi total: {qmimiTot.toFixed(2)} €</h4>
            <p><strong>Qmimi total pa TVSH: </strong>{(qmimiTot - qmimiTot * 0.18).toFixed(2)} €</p>
            <p><strong>TVSH: </strong>{(qmimiTot * 0.18).toFixed(2)} €</p>
            {teDhenatZbritje.length !== 0 &&
              <div className="zbritja">
                <hr />
                <p><strong>Kodi i Perdorur: </strong>{teDhenatZbritje.kodi}</p>
                <p><strong>Qmimi i Zbritjes: </strong>{teDhenatZbritje.qmimiZbritjes.toFixed(2)} €</p>
              </div>
            }

            <button className="cart-button"> Buy Now</button>
          </div>
        }
      </div>
    </>
  );
};

export default CartPage;

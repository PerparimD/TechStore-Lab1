import "./CartPage.css";
import "../../layout/Styles/Buton.module.css";
import { useStateValue } from "../../../Context/StateProvider";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faMinus, faPlus } from "@fortawesome/free-solid-svg-icons";

const CartProduct = (props) => {
  const [{ cart }, dispatch] = useStateValue();

  const removeCart = () => {
    dispatch({
      type: "REMOVE_CART",
      id: props.id
    });
  };
  
  const handelSasiaChange = (sasiaERe) => {
    if (sasiaERe < 1) {
      sasiaERe = 1;
    }
    dispatch({
      type: "NDRYSHO_SASISNE",
      id: props.id,
      sasia: sasiaERe,
    });
  };

  const handleInputChange = (event) => {
    let sasiaERe = parseInt(event.target.value);
    if (isNaN(sasiaERe) || sasiaERe < 1) {
      sasiaERe = 1;
    }
    dispatch({
      type: "NDRYSHO_SASISNE",
      id: props.id,
      sasia: sasiaERe,
    });
  };


  return (
    <div className="produkti-cart">
      <div className="info">
        <div className="foto">
          <img
            src={`${process.env.PUBLIC_URL}/img/products/${props.fotoProduktit}`}
            alt={props.emriProduktit}
          />
        </div>
        <div className="teDhenatProduktit">
          <h1 className="emriProd">{props.emriProduktit}</h1>
          <div className="blerja">
            <form>
              <h1>{props.cmimi.toFixed(2)} €</h1>
              <p>{(props.cmimi - props.cmimi * 0.18).toFixed(2)} € pa TVSH</p>

              <div className="funksionet">
                <div className="sasia">
                  <label>Sasia: </label>
                  <div className="sasiaInputi">
                    <button className="decrement" onClick={() => handelSasiaChange(props.sasia - 1)}><FontAwesomeIcon icon={faMinus}/></button>
                    <input type="number" value={props.sasia} onChange={handleInputChange}/>
                    <button className="increment" onClick={() => handelSasiaChange(props.sasia + 1)}><FontAwesomeIcon icon={faPlus}/></button>
                  </div>
                </div>
                <button className="remove-button" onClick={() => removeCart()}>
                  Remove From Cart 
                </button>
              </div>
            </form>
          </div>
        </div>
      </div >
    </div >
  );
};

export default CartProduct;

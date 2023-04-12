import Buton from '../layout/Buton';
import './Styles/produktet.css';


function ProduktetNeHome(props) {
    const handleShporta = (e) => {
        e.preventDefault();
    };

    return (
        <form className="artikulli" key={props.produktiID}>
            <a href="/">
                <img src={`${process.env.PUBLIC_URL}/img/products/${props.fotoProduktit}`} alt={props.emriProduktit} />
                <p className="artikulliLabel">{props.emriProduktit}</p>
            </a>
            <p className="cmimi">{props.cmimi.toFixed(2)} €</p>
            <div className="butonatDiv">
                <Buton Label="Buy Now" name="blej" onClick={(e) => handleShporta(e)} />
            </div>
        </form>
    );
}

export default ProduktetNeHome;
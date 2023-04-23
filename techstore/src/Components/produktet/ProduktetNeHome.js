import { Link } from 'react-router-dom';
import Buton from '../layout/Buton';
import './Styles/produktet.css';


function ProduktetNeHome(props) {
    const handleShporta = (e) => {
        e.preventDefault();
    };

    return (

        <form className="artikulli" key={props.produktiID}>
            <Link to={`/Produkti/${props.produktiID}`} >
                <div>
                    <img src={`${process.env.PUBLIC_URL}/img/products/${props.fotoProduktit}`} alt={props.emriProduktit} />
                    <p className="artikulliLabel">{props.emriProduktit}</p>
                </div>
                <p className="cmimi">{props.cmimi.toFixed(2)} €</p>
                <div className="butonatDiv">
                    <Buton Label="Buy Now" name="blej" onClick={(e) => handleShporta(e)} />
                </div>
            </Link>
        </form >

    );
}

export default ProduktetNeHome;
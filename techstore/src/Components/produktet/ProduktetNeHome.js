import Buton from '../layout/Buton';
import classes from './Styles/ProduktetNeHome.module.css'


function ProduktetNeHome(props) {
    return (
        <form className={classes.artikulli} key={props.produktiID}>
            <a href='/'>
                <img src={props.fotoProduktit} alt={props.emriProduktit} />
                <p className={classes.artikulliLabel}>
                    {props.emriProduktit}
                </p>
            </a>
            <p className={classes.cmimi}>
                {props.cmimi.toFixed(2)} €
            </p>
            <div className={classes.butonatDiv}>
                <Buton Label="Buy Now" name="blej" />
            </div>
        </form>
    );
}

export default ProduktetNeHome;
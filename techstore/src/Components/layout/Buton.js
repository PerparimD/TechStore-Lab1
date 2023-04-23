import classes from './Styles/Buton.module.css';

function Buton(props) {
    return (
        <button  type="submit" onClick={props.onClick} className={classes.buttonat} name={props.Name}>{props.Label}</button>
    );
}

export default Buton;
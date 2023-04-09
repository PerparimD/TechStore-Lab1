import classes from './Styles/Buton.module.css';

function Buton(props) {
    return (
        <button type="submit" className={classes.button} name={props.Name}>{props.Label}</button>
    );
}

export default Buton;
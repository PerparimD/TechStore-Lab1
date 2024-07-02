import { useEffect, useState } from "react";
import classes from './Styles/PorositeUserit.module.css';
import axios from "axios";
import Button from "react-bootstrap/Button";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faClose } from '@fortawesome/free-solid-svg-icons'
import { TailSpin } from 'react-loader-spinner';

import data from "../../Data/Data";

function MesazhetUserit(props) {
    const [mesazhet, setMesazhet] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [loading, setLoading] = useState(false);

    const getToken = localStorage.getItem("token");

    const authentikimi = {
        headers: {
            Authorization: `Bearer ${getToken}`,
        },
    };

    useEffect(() => {
        const vendosMesazhet = async () => {
            try {
                setLoading(true);
                const mesazhi = data.shfaqMesazhet.filter((item) => item.userId == props.idUseri);
                setMesazhet(mesazhi);
                setLoading(false);
            } catch (err) {
                console.log(err);
                setLoading(false);
            }
        };

        vendosMesazhet();
    }, [perditeso]);


    return (
        <div className={classes.containerDashboardP}>

            {loading ? (
                <div className="Loader">
                    <TailSpin
                        height="80"
                        width="80"
                        color="#009879"
                        ariaLabel="tail-spin-loading"
                        radius="1"
                        wrapperStyle={{}}
                        wrapperClass=""
                        visible={true}
                    />
                </div>
            ) : (<>
                <h1 className="title">
                    Mesazhet e derguara nga Ju
                </h1>
                <Button
                    className="mb-3 Butoni"
                    onClick={() => props.setShfaqMesazhet()}

                >
                    Mbyll Mesazhet <FontAwesomeIcon icon={faClose} />
                </Button>


                <table className="tableBig">
                    <tr>
                        <th>Mesazhi</th>
                        <th>Data Dergeses</th>
                        <th>Statusi</th>
                    </tr>

                    {mesazhet.map((m) => (
                        <tr key={m.mesazhiId}>
                            <td > {m.mesazhi} </td>
                            <td>{new Date(m.dataDergeses).toLocaleDateString('en-GB', { dateStyle: 'short' })}</td>
                            <td>{m.statusi}</td>
                        </tr>
                    ))}
                </table>
            </>
            )}
        </div >
    );
};

export default MesazhetUserit;

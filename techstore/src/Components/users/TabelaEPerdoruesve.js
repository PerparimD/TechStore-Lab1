import { useEffect, useState } from "react";
import classes from './Styles/TabelaEKompanive.module.css';
import axios from "axios";
import Mesazhi from "../layout/Mesazhi";
import { TailSpin } from 'react-loader-spinner';
import EditoPerdorues from "./EditoPerdorues";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {  faPenToSquare } from '@fortawesome/free-solid-svg-icons'
import Button from "react-bootstrap/Button";

function TabelaEPerdoruesve() {
    const [perdoruesit, setPerdoruesit] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [edito, setEdito] = useState(false);
    const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
    const [tipiMesazhit, setTipiMesazhit] = useState("");
    const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");
    const [id, setId] = useState(0);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        const shfaqPerdoruesit = async () => {
            try {
                setLoading(true);
                const perdoruesit = await axios.get("https://localhost:7285/api/Perdoruesi/shfaqPerdoruesit");
                setPerdoruesit(perdoruesit.data);
                setLoading(false);
            } catch (err) {
                console.log(err);
                setLoading(false);
            }
        };

        shfaqPerdoruesit();
    }, [perditeso]);

    const handleEdito = (id) => {
        setEdito(true)
        setId(id)
    };
    const handleEditoMbyll = () => setEdito(false);

    return (
        <div className={classes.containerDashboardP}>

            {shfaqMesazhin && <Mesazhi
                setShfaqMesazhin={setShfaqMesazhin}
                pershkrimi={pershkrimiMesazhit}
                tipi={tipiMesazhit}
            />}
            {edito && <EditoPerdorues
                largo={handleEditoMbyll}
                id={id}
                shfaqmesazhin={() => setShfaqMesazhin(true)}
                perditesoTeDhenat={() => setPerditeso(Date.now())}
                setTipiMesazhit={setTipiMesazhit}
                setPershkrimiMesazhit={setPershkrimiMesazhit}
            />}

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
                    Lista e Perdoruesve
                </h1>


                <table style={{ whiteSpace: "unset", }}>
                    <tr>
                        <th>ID User</th>
                        <th>Emri & Mbiemri</th>
                        <th>Email</th>
                        <th>Username</th>
                        <th>Aksesi</th>
                    </tr>

                    {perdoruesit.map((k) => (
                        <tr key={k.userId}>
                            <td>{k.userId}</td>
                            <td>{k.emri} {k.mbimeri}</td>
                            <td >
                                {k.email}
                            </td>
                            <td >{k.username}</td>
                            <td>{k.aksesi}</td>
                            <td><Button style={{ marginRight: "0.5em" }} variant="success" onClick={() => handleEdito(k.userId)}><FontAwesomeIcon icon={faPenToSquare} /></Button></td>
                        </tr>
                    ))}
                </table>
            </>
            )}
        </div >
    );
};

export default TabelaEPerdoruesve;
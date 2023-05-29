import { useState, useEffect } from "react";
import axios from "axios";
import { TailSpin } from "react-loader-spinner";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPenToSquare, faBan } from "@fortawesome/free-solid-svg-icons";
import Button from "react-bootstrap/Button";
import Mesazhi from "../layout/Mesazhi";

function Mesazhet() {
    const [mesazhet, setMesazhet] = useState([])
    const [perditeso, setPerditeso] = useState('');
    const [loading, setLoading] = useState(false);
    const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
    const [tipiMesazhit, setTipiMesazhit] = useState("");
    const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");

    function handleEdito(id) {
        axios.put(`https://localhost:7285/api/ContactForm/konfirmoMesazhin?id=${id}`, {})
            .then(x => {
                console.log(x);
                setTipiMesazhit("success");
                setPershkrimiMesazhit("Statusi i Mesazhit u Perditesua me sukses!")
                setPerditeso(Date.now());
                setShfaqMesazhin(true);
            })
            .catch(error => {
                console.error(error);
                setTipiMesazhit("danger");
                setPershkrimiMesazhit("Ndodhi nje gabim gjate perditesimit te statusit!")
                setPerditeso(Date.now());
                setShfaqMesazhin(true);
            });
    };

    async function handleFshij(id) {
        try {
            await axios.delete(`https://localhost:7285/api/ContactForm/fshiMesazhin?id=${id}`);
            setTipiMesazhit("success");
            setPershkrimiMesazhit("Mesazhi u fshi me sukses!")
            setPerditeso(Date.now());
            setShfaqMesazhin(true);
        } catch (error) {
            console.error(error);
            setTipiMesazhit("danger");
            setPershkrimiMesazhit("Ndodhi nje gabim gjate fshirjes se mesazhit!")
            setPerditeso(Date.now());
            setShfaqMesazhin(true);
        }
    };

    useEffect(() => {
        const shfaqKompanit = async () => {
            try {
                setLoading(true);
                const mesazhet = await axios.get("https://localhost:7285/api/ContactForm/shfaqMesazhet");
                setMesazhet(mesazhet.data);
                setLoading(false);
            } catch (err) {
                console.log(err);
                setLoading(false);
            }
        };

        shfaqKompanit();
    }, [perditeso]);

    return (
        <div className="containerDashboardP">
            {shfaqMesazhin && <Mesazhi
                setShfaqMesazhin={setShfaqMesazhin}
                pershkrimi={pershkrimiMesazhit}
                tipi={tipiMesazhit}
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
                    Mesazhet e derguara nga Perdoruesit
                </h1>

                
                <table className="tableBig">
                    <tr>
                        <th>ID Mesazhit</th>
                        <th>Perdoruesi</th>
                        <th>Emri</th>
                        <th>Email</th>
                        <th>Mesazhi</th>
                        <th>Data Dergeses</th>
                        <th>Statusi</th>
                        <th>Funksione</th>
                    </tr>

                    {mesazhet.map((m) => (
                        <tr key={m.mesazhiId}>
                            <td>{m.mesazhiId}</td>
                            <td>{m.user ? m.user.userId + " - " + m.user.username : 'Nuk ka Llogari'}</td>
                            <td > {m.emri} </td>
                            <td > {m.email} </td>
                            <td > {m.mesazhi} </td>
                            <td>{new Date(m.dataDergeses).toLocaleDateString('en-GB', { dateStyle: 'short' })}</td>
                            <td>{m.statusi}</td>
                            <td >
                                <Button style={{ marginRight: "0.5em" }} variant="success" onClick={() => handleEdito(m.mesazhiId)}><FontAwesomeIcon icon={faPenToSquare} /></Button>
                                <Button variant="danger" onClick={() => handleFshij(m.mesazhiId)}><FontAwesomeIcon icon={faBan} /></Button>
                            </td>
                        </tr>
                    ))}
                </table>
            </>
            )}
        </div>
    )
}

export default Mesazhet;
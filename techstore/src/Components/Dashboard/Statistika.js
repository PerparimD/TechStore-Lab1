import classes from "./Styles/Statistika.module.css";
import Card from 'react-bootstrap/Card';
import axios from "axios";
import { useState, useEffect } from "react";
function Statistika() {
    const [totaleTeNdryshme, setTotaleTeNdryshme] = useState([]);
    const [top15Bleresit, setTop15Bleresit] = useState([]);
    const [top15Produktet, setTop15Produktet] = useState([]);

    useEffect(() => {
        const vendosTotalinPerdoruesve = async () => {
            try {
                const totalet = await axios.get("https://localhost:7285/api/Statistikat/totaleTeNdryshme");
                setTotaleTeNdryshme(totalet.data);
            } catch (e) {
                console.error(e);
            }
        }

        const vendosTop15Bleresit = async () => {
            try {
                const bleresit = await axios.get("https://localhost:7285/api/Statistikat/15PerdoruesitMeSeShumtiBlerje");
                setTop15Bleresit(bleresit.data);
            } catch (e) {
                console.error(e);
            }
        }

        const vendosTop15Produktet = async () => {
            try {
                const produktet = await axios.get("https://localhost:7285/api/Statistikat/15ProduktetMeTeShitura");
                setTop15Produktet(produktet.data);
            } catch (e) {
                console.error(e);
            }
        }


        vendosTotalinPerdoruesve();
        vendosTop15Bleresit();
        vendosTop15Produktet();
    }, [])
    return (
        <div className={classes.containerDashboardP}>
            <h1 className="title">Statistikat e Dyqanit</h1>
            <hr />
            <h1 className="title">Statistikat e Pergjithshme</h1>
            <div className={classes.cardStatisitkat}>
                <Card border="dark" style={{ width: '18rem' }}>
                    <Card.Header>Totali Shitjeve</Card.Header>
                    <Card.Body>
                        <Card.Text>
                            {parseFloat(totaleTeNdryshme.totaliShitjeve).toFixed(2)} €
                        </Card.Text>
                    </Card.Body>
                </Card>
                <Card border="dark" style={{ width: '18rem' }}>
                    <Card.Header>Totali Porosive</Card.Header>
                    <Card.Body>
                        <Card.Text>
                            {totaleTeNdryshme.totaliPorosive}
                        </Card.Text>
                    </Card.Body>
                </Card>
                <Card border="dark" style={{ width: '18rem' }}>
                    <Card.Header>Totali Produkteve</Card.Header>
                    <Card.Body>
                        <Card.Text>
                            {totaleTeNdryshme.totaliProdukteve}
                        </Card.Text>
                    </Card.Body>
                </Card>
                <Card border="dark" style={{ width: '18rem' }}>
                    <Card.Header>Totali Perdoruesve</Card.Header>
                    <Card.Body>
                        <Card.Text>
                            {totaleTeNdryshme.totaliUsers}
                        </Card.Text>
                    </Card.Body>
                </Card>

            </div>
            <hr />
            <h1 className="title">Statistikat Ditore</h1>
            <div className={classes.cardStatisitkat}>
                <Card border="dark" style={{ width: '18rem' }}>
                    <Card.Header>Totali Shitjev Sotme</Card.Header>
                    <Card.Body>
                        <Card.Text>
                            {parseFloat(totaleTeNdryshme.totaliShitjeveSotme).toFixed(2)} €
                        </Card.Text>
                    </Card.Body>
                </Card>
                <Card border="dark" style={{ width: '18rem' }}>
                    <Card.Header>Totali Porosive Sotme</Card.Header>
                    <Card.Body>
                        <Card.Text>
                            {totaleTeNdryshme.totaliPorosiveSotme}
                        </Card.Text>
                    </Card.Body>
                </Card>
            </div>
            <hr />
            <h1 className="title">Statistikat Tabelare</h1>
            <div className={classes.cardStatisitkat}>
                <Card border="dark" >
                    <Card.Header>Klientet me se Shumti Blerje</Card.Header>
                    <Card.Body>
                        <Card.Text>
                            <table style={{ whiteSpace: "unset", }}>
                                <tr>
                                    <th>ID Klientit</th>
                                    <th>Emri & Mbiemri</th>
                                    <th>Totali Porosive</th>
                                    <th>Shuma Totale Porosive</th>
                                </tr>
                                {top15Bleresit.map((k) => (
                                    <tr key={k.user.id}>
                                        <td>{k.user.id}</td>
                                        <td>{k.user.emri} {k.user.mbiemri}</td>
                                        <td>{k.totaliPorosive}</td>
                                        <td>{parseFloat(k.totaliBlerjeve).toFixed(2)} €</td>
                                    </tr>
                                ))}
                            </table>
                        </Card.Text>
                    </Card.Body>
                </Card>
            </div>
            <div className={classes.cardStatisitkat}>
                <Card border="dark" >
                    <Card.Header>Produktet me Te Shitura</Card.Header>
                    <Card.Body>
                        <Card.Text>
                            <table style={{ whiteSpace: "unset", }}>
                                <tr>
                                    <th>ID Produktit</th>
                                    <th>Emri Produktit</th>
                                    <th>Qmimi Shites €</th>
                                    <th>Totali i Porosive</th>
                                    <th>Totali Shitjeve €</th>
                                </tr>
                                {top15Produktet.map((k) => (
                                    <tr key={k.produkti.id}>
                                        <td>{k.produkti.id}</td>
                                        <td>{k.produkti.emri}</td>
                                        <td>{parseFloat(k.produkti.qmimiShites).toFixed(2)} €</td>
                                        <td>{k.totaliPorosive}</td>
                                        <td>{parseFloat(k.totaliBlerjeve).toFixed(2)} €</td>  
                                    </tr>
                                ))}
                            </table>
                        </Card.Text>
                    </Card.Body>
                </Card>
            </div>
        </div >
    )
}

export default Statistika
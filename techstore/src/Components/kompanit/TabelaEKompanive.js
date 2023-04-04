import { useEffect, useState } from "react";
import classes from './TabelaEKompanive.module.css';
import axios from "axios";

function TabelaEKompanive() {
    const [kompanit, setKompanit] = useState([]);

    useEffect(() => {
        const shfaqKompanit = async () => {
            try {
                const kompania = await axios.get("https://localhost:7285/api/Kompania/shfaqKompanit");
                setKompanit(kompania.data);
            } catch (err) {
                console.log(err);
            }
        }

        shfaqKompanit();
    }, [])

    return (
        <div className={classes.containerDashboardP}>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Emri i Kompanis</th>
                        <th>Logo</th>
                        <th>Adresa</th>
                    </tr>
                </thead>

                <tbody>
                    {kompanit.map((k) => (
                        <tr>
                            <td>{k.kompaniaId}</td>
                            <td>{k.emriKompanis}</td>
                            <td >
                                <img
                                    src={`${process.env.PUBLIC_URL}/img/slider/sliderIcons/${k.logo}`}
                                    width="50"
                                    alt=""
                                />
                            </td>
                            <td >{k.adresa}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
};

export default TabelaEKompanive;

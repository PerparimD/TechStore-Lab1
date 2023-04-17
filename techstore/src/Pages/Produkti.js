import { useParams } from "react-router-dom";
import "./Styles/produkti.css";
import { useState } from "react";
import axios from 'axios';
import { useEffect } from "react";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";

function Produkti() {
    const { produktiID } = useParams();
    const [produkti, setProdukti] = useState([]);
    const [perditeso, setPerditeso] = useState("");

    useEffect(() => {
        const teDhenatProd = async () => {
            try {
                const produkti = await axios.get(`https://localhost:7285/api/Produkti/${produktiID}`)
                setProdukti(produkti.data);
            } catch (err) {
                console.log(err);
            }
        }

        teDhenatProd();
    }, [perditeso])
    return (

        <div className="container">
            <NavBar />
            <div className="produkti">
                <div className="detajet">


                    <div className="foto">
                    <img src={`${process.env.PUBLIC_URL}/img/products/${produkti.fotoProduktit}`} alt={produkti.emriProduktit} />
                    </div>
                    <div>
                        <div className="teDhenatProduktit">
                            <table>
                                <tbody>
                                    <tr>
                                        <th colSpan="2">
                                            <h1 className="emriProd">
                                                {produkti.emriProduktit}
                                            </h1>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>Kompania:</td>
                                        <td>
                                            {produkti.kompaniaId}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Kategoria:</td>
                                        <td>
                                            {produkti.kategoriaId}
                                        </td>
                                    </tr>
                                    {/* <?php if ($produkti['kodi'] != null) {
                                ?>
                                <tr>
                                    <td>Kodi Zbritjes: </td>
                                    <td>
                                        <strong>
                                            <?php echo $produkti['kodi'] ?>
                                        </strong>
                                    </td>
                                </tr>
                                <?php

                            }
                            ?> */}
                                </tbody>
                            </table>

                        </div>
                        <div className="blerja">
                            <form>
                                {/* <input type="hidden" name="produktiID" value=<?php echo $produkti['produktiID'] ?>>
                            <input type="hidden" name="emriProduktit" value="<?php echo $produkti['emriProduktit'] ?>">
                            <input type="hidden" name="qmimiProduktit" value=<?php echo $produkti['qmimiProduktit'] ?>> */}

                                {/*                             
                            //     ?>
                            //     <h1>
                            //         <?php echo number_format($produkti['qmimiProduktit'] - $produkti['qmimiZbritjes'], 2) ?>
                            //         €
                            //     </h1>
                            //     <p>
                            //         <strong>
                            //             <?php echo $produkti['qmimiZbritjes'] ?> € Zbritja
                            //         </strong>
                            //     </p>
                            //     <p>
                            //         <?php echo $produkti['qmimiProduktit'] ?> € qmimi pa zbritje
                            //     </p>
                            //     <p>
                            //         <?php echo number_format($produkti['qmimiProduktit'] - ($produkti['qmimiProduktit'] * 0.18), 2) ?>€
                            //         pa TVSH
                            //     </p>

                            //     <?php
                            // } else { */}
                                <h1>
                                    {produkti.qmimiProduktit + "€"}
                                </h1>
                                <p>
                                    {produkti.qmimiProduktit - (produkti.qmimiProduktit * 0.18) + "€ pa TVSH"}
                                </p>

                                <div>
                                    <button type="submit" className="button" >Buy now</button>
                                    <input type="submit" className="button button-shporta fa-solid" value="&#xf07a;"
                                        name="submit" />

                                    {/* <?php if ($_SESSION['aksesi'] != 0) {
                                    ?>

                                    <a href="../admin/editoProduktin.php?produktID=<?php echo $_GET['produktiID']; ?>"><input
                                            type="button" value="&#xf044;"
                                            className="button button-edit-produktin fa-solid"></a>
                                    <?php
                                }
                                ?> */}
                                </div>
                                {/* <?php if ($produkti['kodi'] != null) {
                                ?>
                                <p className="mesazhiZbritjes" style="font-size: 8pt;">
                                    Ju lutemi qe gjat perfundimit te pageses te aplikoni kodin i cili gjendet tek pjesa e
                                    info-ve te
                                    Produktit
                                </p>
                                <?php
                            }
                            ?> */}
                            </form>


                        </div>
                    </div>
                </div>
                <div className="pershkrimi">
                    <h2>Pershkrimi: </h2>
                    <p>
                        {produkti.pershkrimi}
                    </p>
                </div>
            </div>



            <div className="artikujt">
                <div className="titulliArtikuj">
                    <h1 className="">Me te shiturat</h1>
                </div>
                {/* <?php
            $produktet = $produktiCRUD->shfaq10MeTeShiturat();
            foreach ($produktet as $produkti) {
                ?>
                <form action="../funksione/shtoNeShport.php" method="POST" className="artikulli">
                    <input type="hidden" name="produktiID" value=<?php echo $produkti['produktiID'] ?>>
                    <input type="hidden" name="emriProduktit" value="<?php echo $produkti['emriProduktit'] ?>">
                    <input type="hidden" name="qmimiProduktit" value=<?php echo $produkti['qmimiProduktit'] ?>>
                    <a href="../pages/produkti.php?produktiID=<?php echo $produkti['produktiID'] ?> ">
                        <img src="../../img/products/<?php echo $produkti['fotoProduktit'] ?>" />
                        <p className=" artikulliLabel">
                            <?php echo $produkti['emriProduktit'] ?>
                        </p>
                    </a>
                    <p className="cmimi">
                        <?php echo $produkti['qmimiProduktit'] ?> €
                    </p>
                    <div className="butonatDiv">
                        <input type="submit" className="button" value="Buy now" name="blej">
                        <input type="submit" className="button button-shporta fa-solid" value="&#xf07a;" name="submit">
                    </div>
                </form>
                <?php
            }

            ?> */}
            </div>
            <Footer />
        </div>
    )
}

export default Produkti;
import { useEffect, useState } from "react";
import classes from './Styles/AdminDashboard.css';
import axios from "axios";
import Mesazhi from "../layout/Mesazhi";
import { TailSpin } from 'react-loader-spinner';
import { useNavigate } from "react-router-dom";
import {
    MDBRow,
    MDBCol,
    MDBInput,
    MDBBtn,
} from 'mdb-react-ui-kit';

function PerditesoTeDhenat(props) {
    const [teDhenat, setTeDhenat] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
    const [tipiMesazhit, setTipiMesazhit] = useState("");
    const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");
    const [loading, setLoading] = useState(false);


    const [editoTeDhenat, setEditoTeDhenat] = useState(false);
    const [editoAdresen, setEditoAdresen] = useState(false);
    const [editoFjalekalimin, setEditoFjalekalimin] = useState(false);

    const [fjalekalimiAktual, setFjalekalimiAktual] = useState("");
    const [fjalekalimiIRi, setFjalekalimiIRi] = useState("");

    const navigate = useNavigate();

    const [formValue, setFormValue] = useState({
        emri: "",
        mbiemri: "",
        email: "",
        username: "",
        nrKontaktit: "",
        qyteti: "",
        zipKodi: "",
        adresa: "",
        shteti: ""
    });

    const getID = localStorage.getItem("id");

    const getToken = localStorage.getItem("token");

    const authentikimi = {
        headers: {
            Authorization: `Bearer ${getToken}`,
        },
    };

    useEffect(() => {
        if (getID) {
            const vendosTeDhenat = async () => {
                try {
                    const perdoruesi = await axios.get(
                        `https://localhost:7285/api/Perdoruesi/shfaqSipasID?idUserAspNet=${getID}`, authentikimi
                    );
                    setTeDhenat(perdoruesi.data);
                } catch (err) {
                    console.log(err);
                } finally {
                    setLoading(false);
                }
            };

            vendosTeDhenat();
        } else {
            navigate("/login");
        }
    }, [perditeso]);

    const onChange = (e) => {
        setFormValue({ ...formValue, [e.target.name]: e.target.value });
    };

    const handleFjalekalimiAktual = (e) => {
        setFjalekalimiAktual(e.target.value);
    };

    const handleFjalekalimiIRi = (e) => {
        setFjalekalimiIRi(e.target.value);
    };

    const handleEditoTeDhenat = (e) => {
        e.preventDefault();

        setEditoTeDhenat(true)
    };

    const handleEditoAdresen = (e) => {
        e.preventDefault();

        setEditoAdresen(true)
    };

    const handleEditoFjalekalimn = (e) => {
        e.preventDefault();

        setEditoFjalekalimin(true)
    };

    async function handleRuaj(e) {
        e.preventDefault();

        // try {
        //     await axios.post(`https://localhost:7285/api/VendosFotot/PerditesoTeDhenatBiznesit?logoVjeter=${teDhenatBiznesit.logo}`, formData, authentikimi)
        //         .then(async (response) => {
        //             axios.put("https://localhost:7285/api/TeDhenatBiznesit/perditesoTeDhenat", {
        //                 "emriIbiznesit": formValue.emriBiznesit,
        //                 "shkurtesaEmritBiznesit": formValue.shkurtesaEmrit,
        //                 "nui": formValue.nui,
        //                 "nf": formValue.nf,
        //                 "nrtvsh": formValue.nrtvsh,
        //                 "adresa": formValue.adresa,
        //                 "nrKontaktit": formValue.nrKontaktit,
        //                 "email": formValue.email,
        //                 "logo": response.data
        //             }, authentikimi)
        //             setPerditeso(Date.now());

        //             setEdito(false);
        //         })
        // } catch (error) {
        //     console.error(error);
        // }
        // await axios.put("https://localhost:7285/api/TeDhenatBiznesit/perditesoTeDhenat", {
        //     "emriIbiznesit": formValue.emriBiznesit,
        //     "shkurtesaEmritBiznesit": formValue.shkurtesaEmrit,
        //     "nui": formValue.nui,
        //     "nf": formValue.nf,
        //     "nrtvsh": formValue.nrtvsh,
        //     "adresa": formValue.adresa,
        //     "nrKontaktit": formValue.nrKontaktit,
        //     "email": formValue.email,
        //     "logo": "PaLogo.png"
        // }, authentikimi)
        setPerditeso(Date.now());

        setEditoAdresen(false);
        setEditoFjalekalimin(false);
        setEditoTeDhenat(false);

    }

    useEffect(() => {
        if (teDhenat) {
            setFormValue({
                ...formValue,
                emri: teDhenat.perdoruesi && teDhenat.perdoruesi.emri,
                mbiemri: teDhenat.perdoruesi && teDhenat.perdoruesi.mbiemri,
                email: teDhenat.perdoruesi && teDhenat.perdoruesi.email,
                username: teDhenat.perdoruesi && teDhenat.perdoruesi.username,
                nrKontaktit: teDhenat.perdoruesi && teDhenat.perdoruesi.teDhenatPerdoruesit.nrKontaktit,
                qyteti: teDhenat.perdoruesi && teDhenat.perdoruesi.teDhenatPerdoruesit.qyteti,
                zipKodi: teDhenat.perdoruesi && teDhenat.perdoruesi.teDhenatPerdoruesit.zipKodi,
                adresa: teDhenat.perdoruesi && teDhenat.perdoruesi.teDhenatPerdoruesit.adresa,
                shteti: teDhenat.perdoruesi && teDhenat.perdoruesi.teDhenatPerdoruesit.shteti
            });
        }
    }, [teDhenat]);

    return (
        <div className={classes.containerDashboardP}>
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
            ) :
                (<>
                    <h1 className="titulliPerditeso">Perditesimi i Te Dhenave</h1>
                    <div className="PerditesoTeDhenatContainer">


                        <h1 className="title">Te Dhenat Personale</h1>
                        <MDBRow tag="form" className='g-3'>

                            <MDBCol md="6">
                                <MDBInput
                                    value={formValue.emri}
                                    name='emri'
                                    onChange={onChange}
                                    id='emri'
                                    required
                                    label='Emri'
                                    disabled={!editoTeDhenat}
                                />
                            </MDBCol>
                            <MDBCol md="6">
                                <MDBInput
                                    value={formValue.mbiemri}
                                    name='mbiemri'
                                    onChange={onChange}
                                    id='mbiemri'
                                    required
                                    label='Mbiemri'
                                    disabled={!editoTeDhenat}
                                />
                            </MDBCol>
                            <MDBCol md="4">
                                <MDBInput
                                    value={formValue.email}
                                    name='email'
                                    onChange={onChange}
                                    id='email'
                                    required
                                    label='Email'
                                    disabled={!editoTeDhenat}
                                />
                            </MDBCol>
                            <MDBCol md="4">
                                <MDBInput
                                    value={formValue.username}
                                    name='username'
                                    onChange={onChange}
                                    id='username'
                                    required
                                    label='Username'
                                    disabled={!editoTeDhenat}
                                />
                            </MDBCol>
                            <MDBCol md="4">
                                <MDBInput
                                    value={formValue.nrKontaktit}
                                    name='nrKontaktit'
                                    onChange={onChange}
                                    id='nrKontaktit'
                                    required
                                    label='Numri Telefonit'
                                    disabled={!editoTeDhenat}
                                />
                            </MDBCol>
                            <div className='col-12'>
                                {!editoTeDhenat &&
                                    <MDBBtn onClick={handleEditoTeDhenat}>Ndrysho te dhenat Personale</MDBBtn>
                                }

                                {editoTeDhenat &&
                                    <MDBBtn onClick={handleRuaj}>Ruaj</MDBBtn>
                                }
                            </div>
                        </MDBRow>
                        <h1 className="title">Adresa</h1>
                        <MDBRow tag="form" className='g-3'>
                            <MDBCol md="6">
                                <MDBInput
                                    value={formValue.adresa}
                                    name='adresa'
                                    onChange={onChange}
                                    id='adresa'
                                    required
                                    label='Adresa'
                                    disabled={!editoAdresen}
                                />
                            </MDBCol>
                            <MDBCol md="6">
                                <MDBInput
                                    value={formValue.qyteti}
                                    name='qyteti'
                                    onChange={onChange}
                                    id='qyteti'
                                    required
                                    label='Qyteti'
                                    disabled={!editoAdresen}
                                />
                            </MDBCol>
                            <MDBCol md="6">
                                <MDBInput
                                    value={formValue.shteti}
                                    name='shteti'
                                    onChange={onChange}
                                    id='shteti'
                                    required
                                    label='Shteti'
                                    disabled={!editoAdresen}
                                />
                            </MDBCol>
                            <MDBCol md="6">
                                <MDBInput
                                    value={formValue.zipKodi}
                                    name='zipKodi'
                                    type="number"
                                    onChange={onChange}
                                    id='zipKodi'
                                    required
                                    label='Zip Kodi'
                                    disabled={!editoAdresen}
                                />
                            </MDBCol>
                            <div className='col-12'>
                                {!editoAdresen &&
                                    <MDBBtn onClick={handleEditoAdresen}>Ndrysho Adresen</MDBBtn>
                                }

                                {editoAdresen &&
                                    <MDBBtn onClick={handleRuaj}>Ruaj</MDBBtn>
                                }
                            </div>
                        </MDBRow>
                        <h1 className="title">Fjalekalimi</h1>
                        <MDBRow tag="form" className='g-3'>
                            <MDBCol md="6">
                                <MDBInput
                                    value={fjalekalimiAktual}
                                    name='fjalekalimiAktual'
                                    onChange={handleFjalekalimiAktual}
                                    id='fjalekalimiAktual'
                                    required
                                    label='Fjalekalimi aktual'
                                    disabled={!editoFjalekalimin}
                                />
                            </MDBCol>
                            <MDBCol md="6">
                                <MDBInput
                                    value={fjalekalimiIRi}
                                    name='fjalekalimiIRi'
                                    onChange={handleFjalekalimiIRi}
                                    id='fjalekalimiIRi'
                                    required
                                    label='Fjalekalimi i ri'
                                    disabled={!editoFjalekalimin}
                                />
                            </MDBCol>
                            <div className='col-12'>
                                {!editoFjalekalimin &&
                                    <MDBBtn onClick={handleEditoFjalekalimn}>Ndrysho Fjalekalimin</MDBBtn>
                                }

                                {editoFjalekalimin &&
                                    <MDBBtn onClick={handleRuaj}>Ruaj</MDBBtn>
                                }
                            </div>
                        </MDBRow>
                    </div>
                </>
                )
            }
        </div >
    );
};

export default PerditesoTeDhenat;

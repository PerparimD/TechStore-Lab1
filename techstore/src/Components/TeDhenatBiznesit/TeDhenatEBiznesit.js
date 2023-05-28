import { useEffect, useState } from "react";
import classes from './Styles/TeDhenatEBiznesit.css';
import axios from "axios";
import Mesazhi from "../layout/Mesazhi";
import { TailSpin } from 'react-loader-spinner';

import {
    MDBRow,
    MDBCol,
    MDBInput,
    MDBInputGroup,
    MDBBtn,
    MDBCheckbox
} from 'mdb-react-ui-kit';

function TeDhenatEBiznesit(props) {
    const [teDhenatBiznesit, setTeDhenatBiznesit] = useState([]);
    const [perditeso, setPerditeso] = useState('');
    const [edito, setEdito] = useState(false);
    const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
    const [tipiMesazhit, setTipiMesazhit] = useState("");
    const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");
    const [loading, setLoading] = useState(false);

    const [formValue, setFormValue] = useState({
        emriBiznesit: "",
        shkurtesaEmrit: "",
        nui: "",
        nf: "",
        nrtvsh: "",
        adresa: "",
        nrKontaktit: "",
        email: "",
    });

    const onChange = (e) => {
        setFormValue({ ...formValue, [e.target.name]: e.target.value });
    };
    
    useEffect(() => {
        const ShfaqTeDhenat = async () => {
            try {
                setLoading(true);
                const teDhenat = await axios.get("https://localhost:7285/api/TeDhenatBiznesit/ShfaqTeDhenat");
                setTeDhenatBiznesit(teDhenat.data);
                setLoading(false);
            } catch (err) {
                console.log(err);
                setLoading(false);
            }
        };

        ShfaqTeDhenat();
    }, [perditeso]);

    const handleEdito = (e) => {
        e.preventDefault();

        setEdito(true)
    };
    const handleRuaj = (e) => {
        e.preventDefault();

        axios.put("https://localhost:7285/api/TeDhenatBiznesit/perditesoTeDhenat", {
            "emriIbiznesit": formValue.emriBiznesit,
            "shkurtesaEmritBiznesit": formValue.shkurtesaEmrit,
            "nui": formValue.nui,
            "nf": formValue.nf,
            "nrtvsh": formValue.nrtvsh,
            "adresa": formValue.adresa,
            "nrKontaktit": formValue.nrKontaktit,
            "email": formValue.email
        })
        setPerditeso(Date.now());

        setEdito(false);

    }

    useEffect(() => {
        if (teDhenatBiznesit) {
            setFormValue({
                ...formValue,
                emriBiznesit: teDhenatBiznesit.emriIbiznesit,
                shkurtesaEmrit: teDhenatBiznesit.shkurtesaEmritBiznesit,
                nui: teDhenatBiznesit.nui,
                nf: teDhenatBiznesit.nf,
                nrtvsh: teDhenatBiznesit.nrtvsh,
                adresa: teDhenatBiznesit.adresa,
                nrKontaktit: teDhenatBiznesit.nrKontaktit,
                email: teDhenatBiznesit.email
            });
        }
    }, [teDhenatBiznesit]);

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
                (
                    <div className="TeDhenatContainer">
                        <h1 className="title">Te Dhenat e Biznesit</h1>
                        <MDBRow tag="form" className='g-3'>
                            <MDBCol md="6">
                                <MDBInput
                                    value={formValue.emriBiznesit}
                                    name='emriBiznesit'
                                    onChange={onChange}
                                    id='validationCustom01'
                                    required
                                    label='Emri i Biznesit'
                                    disabled={!edito}
                                />
                            </MDBCol>
                            <MDBCol md="6">
                                <MDBInput
                                    value={formValue.shkurtesaEmrit}
                                    name='shkurtesaEmrit'
                                    onChange={onChange}
                                    id='validationCustom02'
                                    required
                                    label='Shkurtesa e emrit: Sherben per Faturen'
                                    disabled={!edito}
                                />
                            </MDBCol>
                            <MDBCol md="4">
                                <MDBInput
                                    value={formValue.nui}
                                    name='nui'
                                    onChange={onChange}
                                    id='validationCustom03'
                                    required
                                    label='Numri Unik Identifikues: NUI'
                                    disabled={!edito}
                                />
                            </MDBCol>
                            <MDBCol md="4">
                                <MDBInput
                                    value={formValue.nf}
                                    name='nf'
                                    onChange={onChange}
                                    id='validationCustom03'
                                    required
                                    label='Numri Fiskal: NF / NRF'
                                    disabled={!edito}
                                />
                            </MDBCol>
                            <MDBCol md="4">
                                <MDBInput
                                    value={formValue.nrtvsh}
                                    name='nrtvsh'
                                    onChange={onChange}
                                    id='validationCustom03'
                                    required
                                    label='Numri TVSH: NRTVSH'
                                    disabled={!edito}
                                />
                            </MDBCol>
                            <MDBCol md="4">
                                <MDBInput
                                    value={formValue.email}
                                    name='email'
                                    onChange={onChange}
                                    id='validationCustom02'
                                    required
                                    label='Email'
                                    disabled={!edito}
                                />
                            </MDBCol>
                            <MDBCol md="4">
                                <MDBInput
                                    value={formValue.adresa}
                                    name='adresa'
                                    onChange={onChange}
                                    id='validationCustom03'
                                    required
                                    label='Adresa'
                                    disabled={!edito}
                                />
                            </MDBCol>
                            <MDBCol md="4">
                                <MDBInput
                                    value={formValue.nrKontaktit}
                                    name='nrKontaktit'
                                    onChange={onChange}
                                    id='validationCustom05'
                                    required
                                    label='Numri i Kontaktit'
                                    disabled={!edito}
                                />
                            </MDBCol>
                            <div className='col-12'>
                                {!edito &&
                                    <MDBBtn onClick={handleEdito}>Ndrysho te dhenat</MDBBtn>
                                }

                                {edito &&
                                    <MDBBtn onClick={handleRuaj}>Ruaj</MDBBtn>
                                }
                            </div>
                        </MDBRow>
                    </div>
                )
            }
        </div >
    );
};

export default TeDhenatEBiznesit;

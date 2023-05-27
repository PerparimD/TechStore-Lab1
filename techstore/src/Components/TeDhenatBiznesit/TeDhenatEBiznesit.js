import { useEffect, useState } from "react";
import classes from './Styles/TeDhenatEBiznesit.css';
import axios from "axios";
import Button from "react-bootstrap/Button";
import Mesazhi from "../layout/Mesazhi";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBan, faPenToSquare, faPlus, faClose } from '@fortawesome/free-solid-svg-icons'
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

    useEffect(() => {
        const shfaqKateogrit = async () => {
            try {
                setLoading(true);
                const kategoria = await axios.get("https://localhost:7285/api/TeDhenatBiznesit/ShfaqTeDhenat");
                setTeDhenatBiznesit(kategoria.data);
                setLoading(false);
            } catch (err) {
                console.log(err);
                setLoading(false);
            }
        };

        shfaqKateogrit();
    }, [perditeso]);

    const handleEdito = (id) => {
        setEdito(true)
    };
    const handleEditoMbyll = () => setEdito(false);


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
            ) : (<div className="TeDhenatContainer">
                <h1 className="title">Te Dhenat e Biznesit</h1>
                <MDBRow tag="form" className='g-3'>
                    <MDBCol md="4">
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
                    <MDBCol md="4">
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
                            value={formValue.adresa}
                            name='adresa'
                            onChange={onChange}
                            id='validationCustom03'
                            required
                            label='Adresa'
                            disabled={!edito}
                        />
                    </MDBCol>
                    <MDBCol className='col-md-6' feedback='Please provide a valid zip.' invalid>
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
                        <MDBBtn onClick={(e) => {e.preventDefault(); setEdito(true)}}>Ndrysho te dhenat</MDBBtn>
                        <MDBBtn >Reset form</MDBBtn>
                    </div>
                </MDBRow>
            </div>
            )}
        </div >
    );
};

export default TeDhenatEBiznesit;

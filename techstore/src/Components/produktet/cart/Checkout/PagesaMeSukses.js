import {
    MDBCard,
    MDBCardBody,
    MDBCardFooter,
    MDBCardHeader,
    MDBCardImage,
    MDBCol,
    MDBContainer,
    MDBRow,
    MDBTypography,
} from "mdb-react-ui-kit";
import React from "react";
import "./PagesaMeSukses.css";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import { Link } from "react-router-dom";

export default function PagesaMeSukses(props) {
    const [perditeso, setPerditeso] = useState("");
    const [fatura, setFatura] = useState([]);

    const getID = localStorage.getItem("id");
    const navigate = useNavigate();

    const [nrFatures, setNrFatures] = useState(0);

    const getToken = localStorage.getItem("token");

    const authentikimi = {
        headers: {
            Authorization: `Bearer ${getToken}`,
        },
    };

    useEffect(() => {
        if (getID) {
            const vendosFature = async () => {
                try {
                    const fatura = await axios.get(
                        `https://localhost:7285/api/Porosia/shfaqPorosineNgaID?nrFatures=${props.nrFatures}`, authentikimi
                    );
                    setFatura(fatura.data);
                    setNrFatures(fatura.data.idPorosia)
                } catch (err) {
                    console.log(err);
                }
            }

            vendosFature();
        } else {
            navigate("/login");
        }
    }, [perditeso]);

    return (
        <>
            <section
                className="h-100 gradient-custom"
                style={{ backgroundColor: "#eee" }}
            >
                <MDBContainer className="py-5 h-100">
                    <MDBRow className="justify-content-center align-items-center h-100">
                        <MDBCol lg="10" xl="8">
                            <MDBCard style={{ borderRadius: "10px" }}>
                                <MDBCardHeader className="px-4 py-5">
                                    {props.handleMbyll &&
                                        <MDBTypography tag="h5" className="text-muted mb-0">
                                            Detajet e Porosise <span style={{ color: "#01df93" }}>#{fatura && fatura.idPorosia}</span>
                                        </MDBTypography>
                                    }
                                    {!props.handleMbyll &&
                                        <MDBTypography tag="h5" className="text-muted mb-0">
                                            Porosia juaj u vendos me sukses, Faleminderit <span style={{ color: "#01df93" }}>{fatura && fatura.emri}</span>!
                                        </MDBTypography>
                                    }
                                </MDBCardHeader>
                                <MDBCardBody className="p-4">
                                    <div className="d-flex justify-content-between align-items-center mb-0">
                                        <p
                                            className="lead fw-normal mb-0"
                                            style={{ color: "#01df93" }}
                                        >
                                            Fatura
                                        </p>
                                        <p className="small text-muted mb-0">
                                            Porosia: #{fatura && fatura.idPorosia}
                                        </p>
                                    </div>
                                    <div className="d-flex justify-content-between align-items-center mb-0">
                                        <p className="lead fw-normal mb-0"> </p>
                                        <p className="small text-muted mb-0">
                                            Statusi : {fatura && fatura.statusiPorosis}
                                        </p>
                                    </div>
                                    <div className="d-flex justify-content-between align-items-center mb-4">
                                        <p className="lead fw-normal mb-0"> </p>
                                        <p className="small text-muted mb-0">
                                            Data Porosise : {fatura && (new Date(fatura.dataPorosis).toLocaleDateString('en-GB', { dateStyle: 'short' }))}
                                        </p>
                                    </div>


                                    {fatura && fatura.teDhenatEporosis && fatura.teDhenatEporosis.map((item) => {
                                        return (
                                            <MDBCard className="shadow-0 border mb-4">
                                                <MDBCardBody>
                                                    <MDBRow>

                                                        <MDBCol md="1" className="col-3 col-md-1">
                                                            <div className="image-wrapper">
                                                                <MDBCardImage
                                                                    src={`${process.env.PUBLIC_URL}/img/products/${item.fotoProduktit}`}
                                                                    fluid
                                                                    alt="foto"
                                                                />
                                                            </div>
                                                        </MDBCol>
                                                        <MDBCol
                                                            md="3"
                                                            className="text-center d-flex justify-content-center align-items-center"
                                                        >
                                                            <p className="text-muted mb-0">{item.emriProduktit}</p>
                                                        </MDBCol>
                                                        <MDBCol
                                                            md="2"
                                                            className="text-center d-flex justify-content-center align-items-center"
                                                        >
                                                            <p className="text-muted mb-0 small">Sasia: <strong>{item.sasiaPorositur}</strong></p>
                                                        </MDBCol>
                                                        <MDBCol
                                                            md="3"
                                                            className="text-center d-flex justify-content-center align-items-center"
                                                        >
                                                            <p className="text-muted mb-0 small">Qmimi Produktit: <strong>{parseFloat(item.qmimiProduktit).toFixed(2)} €</strong></p>
                                                        </MDBCol>
                                                        <MDBCol
                                                            md="3"
                                                            className="text-center d-flex justify-content-center align-items-center"
                                                        >
                                                            <p className="text-muted mb-0 small">Qmimi Total: <strong>{parseFloat(item.qmimiTotal).toFixed(2)} €</strong></p>
                                                        </MDBCol>
                                                    </MDBRow>

                                                </MDBCardBody>
                                            </MDBCard>
                                        );

                                    })}


                                    <div className="d-flex justify-content-between pt-2">
                                        <p className="fw-bold mb-0">Te dhenat e dergeses</p>
                                        <p className="fw-bold mb-0">Te dhenat e porosise</p>
                                    </div>

                                    <div className="d-flex justify-content-between pt-2">
                                        <p className="text-muted mb-0">
                                            <span className="fw-bold me-2">Klienti:</span> {fatura && fatura.emri} {fatura && fatura.mbiemri}
                                        </p>
                                        {(fatura && fatura.zbritja !== 0.00) &&
                                            <p className="text-muted mb-0">
                                                <span className="fw-bold me-2">Nentotali:</span> {fatura && (parseFloat(fatura.totaliPorosis) + parseFloat(fatura.zbritja)).toFixed(2)} €
                                            </p>
                                        }
                                        {(fatura && fatura.zbritja === 0.00) &&
                                            <p className="text-muted mb-0">
                                                <span className="fw-bold me-2">TVSH 18%:</span> {fatura && parseFloat(fatura.totaliPorosis * 0.18).toFixed(2)} €
                                            </p>
                                        }
                                    </div>

                                    <div className="d-flex justify-content-between">
                                        <p className="text-muted mb-0">
                                            <span className="fw-bold me-2">Email:</span> {fatura && fatura.email}
                                        </p>
                                        {(fatura && fatura.zbritja !== 0.00) &&
                                            <p className="text-muted mb-0">
                                                <span className="fw-bold me-2">Zbritja:</span> - {fatura && parseFloat(fatura.zbritja).toFixed(2)} €
                                            </p>
                                        }
                                        {(fatura && fatura.zbritja === 0.00) &&
                                            <p className="text-muted mb-0">
                                                <span className="fw-bold me-2">Totali pa TVSH:</span> {fatura && parseFloat(fatura.totaliPorosis - (fatura.totaliPorosis * 0.18)).toFixed(2)} €
                                            </p>
                                        }
                                    </div>

                                    <div className="d-flex justify-content-between ">
                                        <p className="text-muted mb-0">
                                            <span className="fw-bold me-2">Numri Kontaktit:</span> {fatura && fatura.nrKontaktit}
                                        </p>
                                        {(fatura && fatura.zbritja !== 0.00) &&
                                            <p className="text-muted mb-0">
                                                <span className="fw-bold me-2">TVSH 18%:</span> {fatura && parseFloat(fatura.totaliPorosis * 0.18).toFixed(2)} €
                                            </p>
                                        }
                                        {(fatura && fatura.zbritja === 0.00) &&
                                            <p className="text-muted mb-0">
                                                <span className="fw-bold me-2">Transporti:</span> Pa Pagese
                                            </p>
                                        }
                                    </div>
                                    <div className={`d-flex justify-content-between ${fatura && fatura.zbritja === 0.00 ? 'mb-5' : ''}`}>
                                        <p className="text-muted mb-0">
                                            <span className="fw-bold me-2">Adresa:</span> {fatura && (fatura.adresa + ", ")} {fatura && (fatura.qyteti + ", ")} {fatura && fatura.shteti} {fatura && fatura.zipKodi}
                                        </p>
                                        {(fatura && fatura.zbritja !== 0.00) &&
                                            <p className="text-muted mb-0">
                                                <span className="fw-bold me-2">Totali pa TVSH:</span> {fatura && parseFloat(fatura.totaliPorosis - (fatura.totaliPorosis * 0.18)).toFixed(2)} €
                                            </p>
                                        }
                                        {(fatura && fatura.zbritja === 0.00) &&
                                            <p className="text-muted mb-0">
                                                <span className="fw-bold me-2">Pagesa:</span> Paguaj pas pranimit
                                            </p>
                                        }
                                    </div>
                                    {(fatura && fatura.zbritja !== 0.00) &&
                                        <div className="d-flex justify-content-between">
                                            <p className="text-muted mb-0"></p>
                                            <p className="text-muted mb-0">
                                                <span className="fw-bold me-2">Transporti:</span> Pa Pagese
                                            </p>
                                        </div>
                                    }
                                    {(fatura && fatura.zbritja !== 0.00) &&
                                        <div className="d-flex justify-content-between mb-5">
                                            <p className="text-muted mb-0"></p>
                                            <p className="text-muted mb-0">
                                                <span className="fw-bold me-2">Pagesa:</span> Paguaj pas pranimit
                                            </p>
                                        </div>
                                    }
                                </MDBCardBody>
                                <MDBCardFooter
                                    className="border-0 px-4 py-5"
                                    style={{
                                        backgroundColor: "#01df93",
                                        borderBottomLeftRadius: "10px",
                                        borderBottomRightRadius: "10px",
                                    }}
                                >
                                    <MDBTypography
                                        tag="h5"
                                        className="d-flex align-items-center justify-content-end text-white text-uppercase mb-0"
                                    >
                                        Totali Porosise: <span className="h2 mb-0 ms-2">{fatura && parseFloat(fatura.totaliPorosis).toFixed(2)} €</span>
                                    </MDBTypography>
                                </MDBCardFooter>
                            </MDBCard>
                            <div className="butonatNeQender">
                                <Link to={`/Fatura/${nrFatures}`}>
                                    <button className="button" name='complete' type="submit" value="Perfundo Porosin " >Printo Faturen</button>
                                </Link>
                                {!props.handleMbyll &&
                                    <Link to={'/dashboard'}>
                                        <button className="button" name='complete' type="submit" value="Perfundo Porosin ">Mbyll Detajet</button>
                                    </Link>
                                }
                                {props.handleMbyll &&
                                    <button className="button" name='complete' type="submit" onClick={() => props.handleMbyll()}>Mbyll Detajet</button>
                                }
                            </div>
                        </MDBCol>
                    </MDBRow>

                </MDBContainer>
            </section>
        </>
    );
}
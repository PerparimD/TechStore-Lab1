import {
    MDBCard,
    MDBCardBody,
    MDBCardFooter,
    MDBCardHeader,
    MDBCardImage,
    MDBCol,
    MDBContainer,
    MDBProgress,
    MDBProgressBar,
    MDBRow,
    MDBTypography,
} from "mdb-react-ui-kit";
import React from "react";
import { useStateValue } from "../../../../Context/StateProvider";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";

export default function PagesaMeSukses(props) {
    const [{ cart }, dispatch] = useStateValue();
    const [teDhenat, setTeDhenat] = useState([]);
    const [perditeso, setPerditeso] = useState("");
    const [fatura, setFatura] = useState([]);

    const getID = localStorage.getItem("id");
    const navigate = useNavigate();

    useEffect(() => {
        if (getID) {
            const vendosTeDhenat = async () => {
                try {
                    const perdoruesi = await axios.get(
                        `https://localhost:7285/api/Perdoruesi/shfaqSipasID?idUserAspNet=${getID}`
                    );
                    setTeDhenat(perdoruesi.data);
                } catch (err) {
                    console.log(err);
                }
            };

            const vendosFature = async () =>{
                try {
                    const fatura = await axios.get(
                        `https://localhost:7285/api/Perdoruesi/shfaqPorosineNgaID?nrFatures=${props.nrFatures}`
                    );
                    setFatura(fatura.data);
                    console.log(fatura.data);
                    console.log(props.nrFatures);
                } catch (err) {
                    console.log(err);
                }
            }

            vendosTeDhenat();
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
                                    <MDBTypography tag="h5" className="text-muted mb-0">
                                        Porosia juaj u vendos me sukses, Faleminderit <span style={{ color: "#a8729a" }}>{teDhenat.perdoruesi && teDhenat.perdoruesi.emri}</span>!
                                    </MDBTypography>
                                </MDBCardHeader>
                                <MDBCardBody className="p-4">
                                    <div className="d-flex justify-content-between align-items-center mb-4">
                                        <p
                                            className="lead fw-normal mb-0"
                                            style={{ color: "#a8729a" }}
                                        >
                                            Fatura
                                        </p>
                                        <p className="small text-muted mb-0">
                                            Receipt Voucher : 1KAU9-84UIL
                                        </p>
                                    </div>

                                    {cart.length !== 0 && cart.map((item) => {
                                        return (
                                            <MDBCard className="shadow-0 border mb-4">
                                                <MDBCardBody>
                                                    <MDBRow>

                                                        <MDBCol md="2">
                                                            <MDBCardImage
                                                                src={`${process.env.PUBLIC_URL}/img/products/${item.foto}`}
                                                                fluid
                                                                alt="foto"
                                                            />
                                                        </MDBCol>
                                                        <MDBCol
                                                            md="5"
                                                            className="text-center d-flex justify-content-center align-items-center"
                                                        >
                                                            <p className="text-muted mb-0">{item.emri}</p>
                                                        </MDBCol>
                                                        <MDBCol
                                                            md="2"
                                                            className="text-center d-flex justify-content-center align-items-center"
                                                        >
                                                            <p className="text-muted mb-0 small">Sasia: {item.sasia}</p>
                                                        </MDBCol>
                                                        <MDBCol
                                                            md="2"
                                                            className="text-center d-flex justify-content-center align-items-center"
                                                        >
                                                            <p className="text-muted mb-0 small">{item.cmimi} €</p>
                                                        </MDBCol>
                                                    </MDBRow>
                                                    
                                                </MDBCardBody>
                                            </MDBCard>
                                        );

                                    })}


                                    <div className="d-flex justify-content-between pt-2">
                                        <p className="fw-bold mb-0">Order Details</p>
                                        <p className="text-muted mb-0">
                                            <span className="fw-bold me-4">Total</span> $898.00
                                        </p>
                                    </div>

                                    <div className="d-flex justify-content-between pt-2">
                                        <p className="text-muted mb-0">Invoice Number : 788152</p>
                                        <p className="text-muted mb-0">
                                            <span className="fw-bold me-4">Discount</span> $19.00
                                        </p>
                                    </div>

                                    <div className="d-flex justify-content-between">
                                        <p className="text-muted mb-0">
                                            Invoice Date : 22 Dec,2019
                                        </p>
                                        <p className="text-muted mb-0">
                                            <span className="fw-bold me-4">GST 18%</span> 123
                                        </p>
                                    </div>

                                    <div className="d-flex justify-content-between mb-5">
                                        <p className="text-muted mb-0">
                                            Recepits Voucher : 18KU-62IIK
                                        </p>
                                        <p className="text-muted mb-0">
                                            <span className="fw-bold me-4">Delivery Charges</span>{" "}
                                            Free
                                        </p>
                                    </div>
                                </MDBCardBody>
                                <MDBCardFooter
                                    className="border-0 px-4 py-5"
                                    style={{
                                        backgroundColor: "#a8729a",
                                        borderBottomLeftRadius: "10px",
                                        borderBottomRightRadius: "10px",
                                    }}
                                >
                                    <MDBTypography
                                        tag="h5"
                                        className="d-flex align-items-center justify-content-end text-white text-uppercase mb-0"
                                    >
                                        Total paid: <span className="h2 mb-0 ms-2">$1040</span>
                                    </MDBTypography>
                                </MDBCardFooter>
                            </MDBCard>
                        </MDBCol>
                    </MDBRow>
                </MDBContainer>
            </section>
        </>
    );
}
import React, { useState, useEffect } from "react";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import { Helmet } from 'react-helmet';
import AdminDashboard from "../Components/Dashboard/AdminDashboard";
import "./Styles/Dashboard.css";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { TailSpin } from 'react-loader-spinner';

const Dashboard = () => {
  const [shfaqAdmin, setShfaqAdmin] = useState(false);
  const [teDhenat, setTeDhenat] = useState([]);
  const [perditeso, setPerditeso] = useState("");
  const [loading, setLoading] = useState(true); 


  const navigate = useNavigate();

  const getID = localStorage.getItem("id");

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
        } finally {
          setLoading(false); 
        }
      };

      vendosTeDhenat();
    } else {
      navigate("/login");
    }
  }, [perditeso]);
  return (
    <div className="dashboard">
      <Helmet>
        <title>Dashboard | Tech Store</title>
      </Helmet>
      <NavBar />

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
      ) : (
        <div class="containerDashboard">
          <h3 class="titulliPershkrim">Miresevini {teDhenat.perdoruesi.emri}
          </h3>
          <h4 className="info">Te dhenat personale:</h4>
          <table>
            <tr>
              <td><strong>Emri:</strong></td>
              <td>
                {teDhenat.perdoruesi.emri}
              </td>
            </tr>
            <tr>
              <td><strong>Mbiemri:</strong></td>
              <td>
                {teDhenat.perdoruesi.mbiemri}
              </td>
            </tr>
            <tr>
              <td><strong>Username:</strong></td>
              <td>
                {teDhenat.perdoruesi.username}
              </td>
            </tr>
            <tr>
              <td><strong>Email:</strong></td>
              <td>
                {teDhenat.perdoruesi.email}
              </td>
            </tr>
            <tr>
              <td><strong>Numri Kontaktit:</strong></td>
              <td>
                {teDhenat.perdoruesi.teDhenatPerdoruesit.nrKontaktit}
              </td>
            </tr>
            <tr>
              <td><strong>Adresa: </strong></td>
              <td>
                {teDhenat.perdoruesi.teDhenatPerdoruesit.adresa}, {teDhenat.perdoruesi.teDhenatPerdoruesit.qyteti}, {teDhenat.perdoruesi.teDhenatPerdoruesit.shteti} {teDhenat.perdoruesi.teDhenatPerdoruesit.zipKodi}
              </td>
            </tr>
          </table>

          <div class="butonatDiv">
            <button disabled
              class="button">Perditeso te Dhenat <i class="fa-solid">&#xf4ff;</i></button>
            <button disabled class="button">Porosite e tua</button>
            {(teDhenat.rolet.includes("Admin") || teDhenat.rolet.includes("Menaxher")) &&
              <button class="button" onClick={() => setShfaqAdmin(true)}>Admin Dashboard</button>
            }
          </div>
        </div>)}

      {shfaqAdmin && <AdminDashboard setShfaqAdmin={() => setShfaqAdmin(false)} />}

      <Footer />


    </div >
  );
};

export default Dashboard;

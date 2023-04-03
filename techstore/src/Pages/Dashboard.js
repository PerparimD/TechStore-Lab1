import React from "react";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import { Helmet } from 'react-helmet';
import AdminDashboard from "../Components/Dashboard/AdminDashboard";

const Dashboard = () => {
  return (
    <div>
      <Helmet>
        <title>Home | Tech Store</title>
      </Helmet>
      <NavBar />
      <AdminDashboard/>
      <Footer/>
      

    </div>
  );
};

export default Dashboard;

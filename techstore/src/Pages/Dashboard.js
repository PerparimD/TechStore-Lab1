import React from "react";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import { Helmet } from 'react-helmet';
import AdminDashboard from "../Components/Dashboard/AdminDashboard";
import "./Dashboard.css";

const Dashboard = () => {
  return (
    <div className="dashboard">
      <Helmet>
        <title>Home | Tech Store</title>
      </Helmet>
      <NavBar />
      <AdminDashboard />
      <Footer />


    </div>
  );
};

export default Dashboard;

import React from 'react'
import Col from 'react-bootstrap/Col';
import Nav from 'react-bootstrap/Nav';
import Row from 'react-bootstrap/Row';
import Tab from 'react-bootstrap/Tab';
import { NavDropdown } from 'react-bootstrap';
import "./Styles/AdminDashboard.css";
import ProductTables from '../produktet/ProductTables';
import { useState, useEffect } from 'react';
import TabelaEKompanive from '../kompanit/TabelaEKompanive';
import Mesazhet from '../mesazhet/Mesazhet';
import TabelaEPerdoruesve from '../users/TabelaEPerdoruesve';
import TabelaEKategorive from '../kategorit/TabelaEKategorive';
import KodiZbritjes from '../kodiZbritjes/KodiZbritjes';
import KalkulimiIMallit from '../kalkulimi/KalkulimiIMallit';
import jwtDecode from 'jwt-decode';
import Statistika from './Statistika';

const AdminDashboard = (props) => {
  const [eshteAdmin, setEshteAdmin] = useState(false);
  const [key, setKey] = useState("1");
  const token = localStorage.getItem("token");

  useEffect(() => {
    if (token) {
      const decodedToken = jwtDecode(token);

      if (decodedToken.role.includes("Admin")) {
        setEshteAdmin(true);
      }
    }
  }, []);
  const ActiveStyle = {
    background: "#009879",
    color: "white",
    borderRadius: "0.6em",
    margin: "1px"
  };

  const inActiveStyle = {
    ...ActiveStyle,
    background: "white",
    color: "#009879"
  };

  return (
    <div className='admin'>

      <Tab.Container className="border" id="left-tabs-example" defaultActiveKey="1" onSelect={key => setKey(key)}>
        <Row>
          <Col>
            <Nav variant="pills" className="flex-column">
              <button className='colum normalMenu' onClick={props.setShfaqAdmin}>Mbyll Admin</button>
              {eshteAdmin &&
                <Nav.Item >
                  <Nav.Link className='colum normalMenu' eventKey="0" style={key === "0" ? ActiveStyle : inActiveStyle} >Statistikat e Dyqanit</Nav.Link>
                </Nav.Item>
              }
              <Nav.Item >
                <Nav.Link className='colum normalMenu' eventKey="1" style={key === "1" ? ActiveStyle : inActiveStyle} >Produktet</Nav.Link>
              </Nav.Item>
              <Nav.Item >
                <Nav.Link className='colum normalMenu' eventKey="2" style={key === "2" ? ActiveStyle : inActiveStyle} >Kompanit</Nav.Link>
              </Nav.Item>
              <Nav.Item >
                <Nav.Link className='colum normalMenu' eventKey="3" style={key === "3" ? ActiveStyle : inActiveStyle} >Mesazhet</Nav.Link>
              </Nav.Item>
              <Nav.Item >
                <Nav.Link className='colum normalMenu' eventKey="4" style={key === "4" ? ActiveStyle : inActiveStyle} >Perdoruesit</Nav.Link>
              </Nav.Item>
              <Nav.Item >
                <Nav.Link className='colum normalMenu' eventKey="5" style={key === "5" ? ActiveStyle : inActiveStyle} >Kategorite</Nav.Link>
              </Nav.Item>
              <Nav.Item >
                <Nav.Link className='colum normalMenu' eventKey="6" style={key === "6" ? ActiveStyle : inActiveStyle} >Kodet e Zbritjev</Nav.Link>
              </Nav.Item>
              <Nav.Item >
                <Nav.Link className='colum normalMenu' eventKey="7" style={key === "7" ? ActiveStyle : inActiveStyle}>Kalkulimi i Mallit</Nav.Link>
              </Nav.Item>
              <Nav.Item>
                <NavDropdown title="Menu" id="basic-nav-dropdown" className='hamburgerMenu'>
                  <button className='colum' onClick={props.setShfaqAdmin}>Mbyll Admin</button>
                  {eshteAdmin &&
                    <Nav.Link className='colum' eventKey="0" style={key === "0" ? ActiveStyle : inActiveStyle}>Statistikat e Dyqanit</Nav.Link>
                  }
                  <Nav.Link className='colum' eventKey="1" style={key === "1" ? ActiveStyle : inActiveStyle}>Produktet</Nav.Link>
                  <Nav.Link className='colum' eventKey="2" style={key === "2" ? ActiveStyle : inActiveStyle}>Kompanit</Nav.Link>
                  <Nav.Link className='colum' eventKey="3" style={key === "3" ? ActiveStyle : inActiveStyle}>Mesazhet</Nav.Link>
                  <Nav.Link className='colum' eventKey="4" style={key === "4" ? ActiveStyle : inActiveStyle}>Perdoruesit</Nav.Link>
                  <Nav.Link className='colum' eventKey="5" style={key === "5" ? ActiveStyle : inActiveStyle}>Kategorite</Nav.Link>
                  <Nav.Link className='colum' eventKey="6" style={key === "6" ? ActiveStyle : inActiveStyle}>Kodet e Zbritjev</Nav.Link>
                  <Nav.Link className='colum' eventKey="7" style={key === "7" ? ActiveStyle : inActiveStyle}>Kalkulimi i Mallit</Nav.Link>
                </NavDropdown>
              </Nav.Item>
            </Nav>


          </Col>
          <Col sm={10}>
            <Tab.Content>
              <Tab.Pane eventKey="0">
                <Statistika />
              </Tab.Pane>
              <Tab.Pane eventKey="1">
                <ProductTables />
              </Tab.Pane>
              <Tab.Pane eventKey="2">
                <TabelaEKompanive />
              </Tab.Pane>
              <Tab.Pane eventKey="3">
                <Mesazhet />
              </Tab.Pane>
              <Tab.Pane eventKey="4">
                <TabelaEPerdoruesve />
              </Tab.Pane>
              <Tab.Pane eventKey="5">
                <TabelaEKategorive />
              </Tab.Pane>
              <Tab.Pane eventKey="6">
                <KodiZbritjes />
              </Tab.Pane>
              <Tab.Pane eventKey="7">
                <KalkulimiIMallit />
              </Tab.Pane>
            </Tab.Content>
          </Col>
        </Row>
      </Tab.Container>
    </div>
  )
}

export default AdminDashboard
import React from 'react'
import Col from 'react-bootstrap/Col';
import Nav from 'react-bootstrap/Nav';
import Row from 'react-bootstrap/Row';
import Tab from 'react-bootstrap/Tab';
import "./Styles/AdminDashboard.css";
import ProductTables from '../produktet/ProductTables';
import { useState } from 'react';
import TabelaEKompanive from '../kompanit/TabelaEKompanive';
import Mesazhet from '../mesazhet/Mesazhet';

// import Sonnet from '../../components/Sonnet'

const AdminDashboard = () => {

  const [key, setKey] = useState("1");

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
    <div>
      <Tab.Container className="border" id="left-tabs-example" defaultActiveKey="1" onSelect={key => setKey(key)}>
        <Row>
          <Col>
            <Nav variant="pills" className="flex-column">
              <Nav.Item >
                <Nav.Link className='colum' eventKey="1" style={key === "1" ? ActiveStyle : inActiveStyle} >Produktet</Nav.Link>
              </Nav.Item>
              <Nav.Item >
                <Nav.Link className='colum' eventKey="2" style={key === "2" ? ActiveStyle : inActiveStyle} >Kompanit</Nav.Link>
              </Nav.Item>
              <Nav.Item >
                <Nav.Link className='colum' eventKey="3" style={key === "3" ? ActiveStyle : inActiveStyle} >Mesazhet</Nav.Link>
              </Nav.Item>
            </Nav>
          </Col>
          <Col sm={9}>
            <Tab.Content>
              <Tab.Pane eventKey="1">
                <ProductTables />
              </Tab.Pane>
              <Tab.Pane eventKey="2">
                <TabelaEKompanive />
              </Tab.Pane>
              <Tab.Pane eventKey="3">
                <Mesazhet />
              </Tab.Pane>
            </Tab.Content>
          </Col>
        </Row>
      </Tab.Container>
    </div>
  )
}

export default AdminDashboard
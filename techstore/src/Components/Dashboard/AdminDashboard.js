import React from 'react'
import Col from 'react-bootstrap/Col';
import Nav from 'react-bootstrap/Nav';
import Row from 'react-bootstrap/Row';
import Tab from 'react-bootstrap/Tab';
import "./AdminDashboard.css";
import ProductTables from '../produktet/ProductTables';
import { useState } from 'react';
import TabelaEKompanive from '../kompanit/TabelaEKompanive';

// import Sonnet from '../../components/Sonnet'

const AdminDashboard = () => {
  
    const [key, setKey] = useState("first");
  
    const ActiveStyle = {
      background : "#009879",
      color: "white",
      borderRadius: "0.6em",
      margin: "1px"
    };
  
    const inActiveStyle = {
      ...ActiveStyle,
      background : "white",
      color: "#009879"
    };
  
  return (
    <div>
      <Tab.Container className="border" id="left-tabs-example" defaultActiveKey="first" onSelect={key => setKey(key)}>
      <Row>
        <Col >
          <Nav variant="pills" className="flex-column">
            <Nav.Item >
              <Nav.Link className='colum' eventKey="first" style={key === "first" ? ActiveStyle : inActiveStyle} >Products</Nav.Link>
            </Nav.Item>
            <Nav.Item >
              <Nav.Link className='colum' eventKey="second" style={key === "second" ? ActiveStyle : inActiveStyle} >Kompanit</Nav.Link>
            </Nav.Item>
          </Nav>
        </Col>
        <Col sm={10}>
          <Tab.Content>
          <Tab.Pane eventKey="first">
              <ProductTables/>
            </Tab.Pane>

            <Tab.Pane eventKey="second">
              <TabelaEKompanive/>
            </Tab.Pane>
          </Tab.Content>
        </Col>
      </Row>
    </Tab.Container>
    </div>
  )
}

export default AdminDashboard
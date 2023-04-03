import React, { useState } from "react";
import useFetch from "../../Hooks/useFetch";
import "./ProductTables.css";

const ProductTables = () => {
  const {
    data: products,
    isLoading,
    error,
  } = useFetch("https://localhost:7285/api/Produkti/Products");

  const [id, setId] = useState();
  const [foto, setFoto] = useState();
  const [emriP, setEmriP] = useState();
  const [qmimiP, setQmimi] = useState();

  const handleEmriPChange = (value) => {
    setEmriP(value);
  };

  const handleQmimiPChange = (value) => {
    setQmimi(value);
  };
  const handleFotoChange = (value) => {
    setFoto(value);
  };

  return (
    <div className="containerDashboardP">
      {products && (
        <table>
          <thead>
            <tr>
              <th className="emriP">Emri i Produktit</th>
              <th>Foto e Produktit</th>
              <th>Qmimi i Produktit</th>
            </tr>
          </thead>
          
          <tbody>
            {products?.map((p) => (
              <tr>
                <td>{p.emriProduktit}</td>
                <td >
                  <img
                    src={`${process.env.PUBLIC_URL}/img/products/${p.fotoProduktit}`}
                    width="50"
                    alt=""
                  />
                </td>
                <td >{p.qmimiProduktit}</td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
};

export default ProductTables;

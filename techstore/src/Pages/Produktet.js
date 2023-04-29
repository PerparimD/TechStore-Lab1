import { Helmet } from "react-helmet";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import { useEffect, useState } from "react";
import axios from "axios";
import ProduktetNeHome from "../Components/produktet/ProduktetNeHome";
import "../Components/produktet/Styles/produktet.css";
import Dropdown from "react-bootstrap/Dropdown";
import { useParams } from "react-router-dom";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faFaceFrown } from "@fortawesome/free-solid-svg-icons";


function Produktet(props) {
  const [kategoria, setKateogria] = useState("");
  const [kategorit, setKategorit] = useState([]);
  const { kompania } = useParams();
  const [emriKomapnis, setEmriKompanis] = useState(kompania ? kompania : "");
  const [perditeso, setPerditeso] = useState("");
  const [filteredResults, setFilteredResults] = useState([]);
  const [searchInput, setSearchInput] = useState("");
  const [produktet, setProduktet] = useState([]);


  useEffect(() => {
    const vendosProduktet = async () => {
      try {
        const kategorit = await axios.get(
          `https://localhost:7285/api/Produkti/Products`
        );
        setProduktet(kategorit.data);
        console.log(perditeso)

      } catch (err) {
        console.log(err);
      }
    };

    vendosProduktet();
  }, [perditeso]);

  const searchItems = (searchValue) => {
    setSearchInput(searchValue);

    if (searchInput !== "") {
      const filteredData = produktet.filter((item) => {
        setKateogria("");
        setEmriKompanis("");
        return Object.values(item)
          .join("")
          .toLowerCase()
          .includes(searchInput.toLowerCase());
      });
      setFilteredResults(filteredData);
    } else {
      setFilteredResults(produktet);
    }
  };

  useEffect(() => {
    const vendosKategorit = async () => {
      try {
        const kategorit = await axios.get(
          `https://localhost:7285/api/Kategoria/shfaqKategorit`
        );
        setKategorit(kategorit.data);
      } catch (err) {
        console.log(err);
      }
    };

    vendosKategorit();
  }, [perditeso]);
  return (
    <div>
      <Helmet>
        <title>Produktet | Tech Store</title>
      </Helmet>
      <NavBar />
      <div className="navKerkimi">
        <Dropdown>
          <Dropdown.Toggle
            className="button button-kategoria"
            variant="success"
            id="dropdown-basic"
          >
            Kategorit
          </Dropdown.Toggle>

          <Dropdown.Menu className="dropdown-content dropdown-content-kategoria">
            {kategorit.map((k) => {
              return (
                <Dropdown.Item
                  key={k.kategoriaId}
                  value={k.llojiKategoris}
                  onClick={(e) => {
                    setKateogria(k.llojiKategoris);
                    setSearchInput("");
                    setEmriKompanis("");
                  }}
                >
                  {k.llojiKategoris}
                </Dropdown.Item>
              );
            })}
          </Dropdown.Menu>
        </Dropdown>
        <div className="search-input">
          <div className="searchBarForm">
            <input
              className="searchBar"
              type="text"
              placeholder="Search..."
              onChange={(e) => searchItems(e.target.value)}
            />
          </div>
        </div>
      </div>
      <div className="artikujt">
        <div className="titulliArtikuj">
          {kategoria ? <h2>Te gjitha produktet e llojit {kategoria}</h2> :
            emriKomapnis ? <h2>Te gjitha produktet nga {kompania}</h2> :
              searchInput ? <h2>Produktet nga Kerkimi per: {searchInput}</h2> :
                <h2>Te Gjitha Produktet</h2>
          }
        </div>
        {searchInput.length >= 1
          ? (filteredResults.length !== 0 ?
            filteredResults.map((item) => {

              return (
                <ProduktetNeHome
                  produktiID={item.produktiId}
                  fotoProduktit={item.fotoProduktit}
                  emriProduktit={item.emriProduktit}
                  cmimi={item.qmimiProduktit}
                />
              );
            }) : <h2>Nuk u gjet asnje produkt! <FontAwesomeIcon icon={faFaceFrown} /> </h2>)
          : produktet && kategoria !== ""
            ? (produktet.filter((item) => item.llojiKategoris === kategoria).length !== 0 ?
              produktet.filter((item) => item.llojiKategoris === kategoria).map((item) => {
                return (
                  <ProduktetNeHome
                    produktiID={item.produktiId}
                    fotoProduktit={item.fotoProduktit}
                    emriProduktit={item.emriProduktit}
                    cmimi={item.qmimiProduktit}
                  />
                );
              }) : <h2>Nuk u gjet asnje produkt! <FontAwesomeIcon icon={faFaceFrown} /> </h2>)
            : produktet && emriKomapnis !== ""
              ? (produktet.filter((item) => item.emriKompanis === kompania).length !== 0 ?
                produktet
                  .filter((item) => item.emriKompanis === kompania).map((item) => {
                    return (
                      <ProduktetNeHome
                        produktiID={item.produktiId}
                        fotoProduktit={item.fotoProduktit}
                        emriProduktit={item.emriProduktit}
                        cmimi={item.qmimiProduktit}
                      />
                    );
                  }) : <h2>Nuk u gjet asnje produkt! <FontAwesomeIcon icon={faFaceFrown} /> </h2>)
              : searchInput.length === 0 && produktet
                ? produktet.map((item) => {
                  return (
                    <ProduktetNeHome
                      produktiID={item.produktiId}
                      fotoProduktit={item.fotoProduktit}
                      emriProduktit={item.emriProduktit}
                      cmimi={item.qmimiProduktit}
                    />
                  );
                })
                : <h2>Nuk u gjet asnje produkt! <FontAwesomeIcon icon={faFaceFrown} /> </h2>}

      </div>

      <Footer />
    </div>
  );
}

export default Produktet;

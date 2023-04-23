import { Helmet } from "react-helmet";
import NavBar from "../Components/layout/NavBar";
import Footer from "../Components/layout/Footer";
import { useEffect, useState, useMemo } from "react";
import axios from "axios";
import ProduktetNeHome from "../Components/produktet/ProduktetNeHome";
import "../Components/produktet/Styles/produktet.css";
import Dropdown from "react-bootstrap/Dropdown";
import useFetch from "../Hooks/useFetch";

function Produktet() {
  const [kompania, setKompania] = useState(false);
  const [kategoria, setKateogria] = useState("");
  const [kategorit, setKategorit] = useState([]);
  const [perditeso, setPerditeso] = useState("");
  const [filteredResults, setFilteredResults] = useState([]);
  const [searchInput, setSearchInput] = useState("");
  const [produktetK, setProduktetK] = useState([]);

  const {
    data: produktet,
    isLoading,
    error,
  } = useFetch("https://localhost:7285/api/Produkti/Products");

  const searchItems = (searchValue) => {
    setSearchInput(searchValue);

    if (searchInput !== "") {
      const filteredData = produktet.filter((item) => {
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
      console.log(kategoria);
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
          {kategoria ? <h2>Te gjitha produktet nga {kategoria}</h2> : null}
        </div>
        {searchInput.length >= 1
          ? filteredResults.map((item) => {
              return (
                <ProduktetNeHome
                  produktiID={item.produktiId}
                  fotoProduktit={item.fotoProduktit}
                  emriProduktit={item.emriProduktit}
                  cmimi={item.qmimiProduktit}
                />
              );
            })
          : produktet &&
            (kategoria
              ? produktet
                  .filter((item) => item.llojiKategoris === kategoria)
                  .map((item) => {
                    return (
                      <ProduktetNeHome
                        produktiID={item.produktiId}
                        fotoProduktit={item.fotoProduktit}
                        emriProduktit={item.emriProduktit}
                        cmimi={item.qmimiProduktit}
                      />
                    );
                  })
              : produktet.map((item) => {
                  return (
                    <ProduktetNeHome
                      produktiID={item.produktiId}
                      fotoProduktit={item.fotoProduktit}
                      emriProduktit={item.emriProduktit}
                      cmimi={item.qmimiProduktit}
                    />
                  );
                }))}
      </div>

      <Footer />
    </div>
  );
}

export default Produktet;

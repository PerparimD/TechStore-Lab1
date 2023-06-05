import React, { useEffect, useRef, useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";

import classes from "./Styles/BrandsSlider.module.css";

function BrandsSlider() {
  const kornizaEBrendeveRef = useRef([]);
  const shkoDjathtasRef = useRef([]);
  const shkoMajtasRef = useRef([]);

  const [kompanit, setKompanit] = useState([]);

  const getToken = localStorage.getItem("token");

  const authentikimi = {
    headers: {
      Authorization: `Bearer ${getToken}`,
    },
  };

  useEffect(() => {
    const shfaqKompanit = async () => {
      try {
        const kopmania = await axios.get(
          "https://localhost:7285/api/Kompania/shfaqKompanit", authentikimi
        );
        setKompanit(kopmania.data);
      } catch (err) {
        console.log(err);
      }
    };

    shfaqKompanit();
  }, []);

  useEffect(() => {
    kornizaEBrendeveRef.current.forEach((item, i) => {
      let containerDimensions = item.getBoundingClientRect();
      let containerWidth = containerDimensions.width;

      shkoDjathtasRef.current[i].addEventListener("click", () => {
        item.scrollLeft += containerWidth;
      });

      shkoMajtasRef.current[i].addEventListener("click", () => {
        item.scrollLeft -= containerWidth;
      });
    });
  }, []);

  return (
    <section className={classes.brandsSlider}>
      <h2 className={classes.brandsSliderLabel}>Brands</h2>
      <button
        className={classes.shkoMajtas}
        ref={(el) => (shkoMajtasRef.current[0] = el)}
      >
        <img src={`${process.env.PUBLIC_URL}/img/slider/arrow.png`} alt="" />
      </button>
      <button
        className={classes.shkoDjathtas}
        ref={(el) => (shkoDjathtasRef.current[0] = el)}
      >
        <img src={`${process.env.PUBLIC_URL}/img/slider/arrow.png`} alt="" />
      </button>
      <div
        className={classes.kornizaEBrendeve}
        ref={(el) => (kornizaEBrendeveRef.current[0] = el)}
      >
        {kompanit.map((kompania) => (
          <div className={classes.kartelaEBrendit} key={kompania.kompaniaId} data-aos="fade-right">
            <div className={classes.logoBrendit}>
              <Link to={`/Produktet/${kompania.emriKompanis}`}>
                <img
                  src={`${process.env.PUBLIC_URL}/img/slider/sliderIcons/${kompania.logo}`}
                  alt=""
                />
              </Link>
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}

export default BrandsSlider;

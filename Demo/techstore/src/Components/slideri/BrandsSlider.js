import React, { useEffect, useRef, useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";

import classes from "./Styles/BrandsSlider.module.css";

import data from "../../Data/Data";

function BrandsSlider() {
  const kornizaEBrendeveRef = useRef([]);
  const shkoDjathtasRef = useRef([]);
  const shkoMajtasRef = useRef([]);

  const [kompanit, setKompanit] = useState([]);

  useEffect(() => {
    const shfaqKomp = async () => {
      try {
        setKompanit(data.shfaqKompanit);
      } catch (err) {
        console.log(err);
      }
    };

    shfaqKomp();
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
          <div className={classes.kartelaEBrendit} key={kompania.kompaniaId} data-aos="zoom-out">
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

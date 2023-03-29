import React, { useEffect, useRef, useState } from "react";
import axios from "axios";

import classes from './BrandsSlider.module.css'

function BrandsSlider(props) {
  const kornizaEBrendeveRef = useRef([]);
  const shkoDjathtasRef = useRef([]);
  const shkoMajtasRef = useRef([]);

  const [kompanit, setKompanit] = useState([]);

    useEffect(() => {
        const shfaqKompanit = async () => {
            try {
                const kopmania = await axios.get("https://localhost:7232/api/Kompania/shfaqKompanit");
                setKompanit(kopmania.data);
            } catch (err) {
                console.log(err);
            }
        }

        shfaqKompanit();
    }, [])

  useEffect(() => {
    kornizaEBrendeveRef.current.forEach((item, i) => {
      let containerDimensions = item.getBoundingClientRect();
      let containerWidth = containerDimensions.width;

      shkoDjathtasRef.current[i].addEventListener('click', () => {
        item.scrollLeft += containerWidth;
      });

      shkoMajtasRef.current[i].addEventListener('click', () => {
        item.scrollLeft -= containerWidth;
      });
    });
  }, []);

  return (
    <section className={classes.brandsSlider}>
      <h2 className={classes.brandsSliderLabel}>Brands</h2>
      <button className={classes.shkoMajtas} ref={(el) => (shkoMajtasRef.current[0] = el)}>
        <img src={`${process.env.PUBLIC_URL}/img/slider/arrow.png`} alt="" />
      </button>
      <button className={classes.shkoDjathtas} ref={(el) => (shkoDjathtasRef.current[0] = el)}>
        <img src={`${process.env.PUBLIC_URL}/img/slider/arrow.png`} alt="" />
      </button>
      <div className={classes.kornizaEBrendeve} ref={(el) => (kornizaEBrendeveRef.current[0] = el)}>
        {kompanit.map((kompania) => (
          <div className={classes.kartelaEBrendit} key={kompania.kompaniaID}>
            <div className={classes.logoBrendit}>
              <a href={``}>
                <img src={`${process.env.PUBLIC_URL}/img/slider/sliderIcons/${kompania.logo}`} alt="" />
              </a>
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}

export default BrandsSlider;

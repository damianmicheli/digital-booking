import React, { useState, useContext } from "react";
import FilterContext from "../../context/FilterContext";

//Styles
import styles from "./search.module.css";

//Components
import Select from "./content/Select";
import Calendar from "./content/Calendar";
import Button from "../global/Button";
import useMediaQuery from "../../hooks/useMediaQuery";

const Search = () => {
  const [idCity, setIdCity] = useState(null);

  const {
    setValuesForm,
    setSelectedCategory,
    selectedCity,
    setSelectedCity,
    selectedDate,
    setSelectedDate,
    reservationDate,
    setReservationDate,
  } = useContext(FilterContext);

  const handleSubmit = (e) => {
    e.preventDefault();
    setValuesForm(() => {
      return {
        city: selectedCity,
        id: idCity,
        date: reservationDate,
      };
    });
    setSelectedCategory(() => {
      return {
        title: null,
        id: null,
      };
    });
  };

  const isMobile = useMediaQuery(768);

  return (
    <div className={styles.container}>
      <div className={styles.buscador}>
        <div className={styles.title}>
          <h1>Busca ofertas en hoteles, casas y mucho más</h1>
        </div>
        <form
          onSubmit={(e) => {
            handleSubmit(e);
          }}
          className={styles.content}
        >
          <div className={styles.select}>
            <Select
              selected={selectedCity}
              setSelected={setSelectedCity}
              setIdCity={setIdCity}
            />
          </div>
          <div className={styles.datepicker}>
            {isMobile ? (
              <Calendar
                months={1}
                setReservationDate={setReservationDate}
                selectedDate={selectedDate}
                setSelectedDate={setSelectedDate}
              />
            ) : (
              <Calendar
                months={2}
                setReservationDate={setReservationDate}
                selectedDate={selectedDate}
                setSelectedDate={setSelectedDate}
              />
            )}
          </div>
          <div className={styles.buttonContainer}>
            <Button css={styles.button} text="Buscar" />
          </div>
        </form>
      </div>
    </div>
  );
};

export default Search;

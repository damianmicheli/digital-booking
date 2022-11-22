import React, { useContext } from "react";

import Calendar from "./Calendar";
import Button from "../../../global/Button";

import useMediaQuery from "../../../../hooks/useMediaQuery";
import styles from "./booking.module.css";

import useFetch from "../../../../hooks/useFetch";
import { useParams, useNavigate } from "react-router";

import AuthContext from "../../../../context/AuthContext";

const BookingCalendar = () => {
  const isMobile = useMediaQuery(624);

  const { id } = useParams();

  const [disabledDates] = useFetch(
    `http://localhost:8080/productos/fechasnodisponibles?id=${id}`
  );

  const fechas = disabledDates && disabledDates.fechasNoDisponibles;

  let fechasInhabilitadas = [];
  let newDate;

  fechas &&
    fechas.map((array) => {
      newDate = new Date(array[0], array[1], array[2]);
      return fechasInhabilitadas.push(newDate);
    });

  const navigate = useNavigate();
  const { auth } = useContext(AuthContext);

  const handleBooking = () => {
    auth ? navigate(`/producto/${id}/reserva`) : navigate(`/login`);
  };

  return (
    <>
      <div className={styles.booking}>
        <div className={styles.container}>
          <h2 className="heading2">Fechas disponibles</h2>
          <div className={styles.calendarPButton}>
            <div className={styles.calendar}>
              {isMobile ? (
                <Calendar months={1} bookings={fechasInhabilitadas} />
              ) : (
                <Calendar months={2} bookings={fechasInhabilitadas} />
              )}
            </div>
            <div className={styles.pButton}>
              <p>
                Agregá tus fechas exactas de viaje para obtener precios exactos
              </p>
              <Button
                css="buttonCard"
                text="Iniciar reserva"
                event={handleBooking}
              ></Button>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default BookingCalendar;

import React, { useState } from "react";
import Calendar from "./Calendar";
import styles from "./booking.module.css";

import useMediaQuery from "../../hooks/useMediaQuery";
import Button from "../global/Button";

const BookingCalendar = () => {
  const isMobile = useMediaQuery(624);
  const [date, setDate] = useState(new Date());

  const [booking1, setBooking1] = useState([ new Date(2022, 10, 25),new Date(2022, 10, 26),new Date(2022, 10, 27), new Date(2022, 11, 10),  new Date(2022, 11, 11),  new Date(2022, 11, 12),  new Date(2022, 11, 13),  new Date(2022, 11, 14),  new Date(2022, 11, 15), ])

  return (
    <>
      <div className={styles.booking}>
        <div className={styles.container}>
          <h2 className="heading3">Fechas disponibles</h2>
          <div className={styles.calendarPButton}>
            <div className={styles.calendar}>
              {isMobile ? (
                <Calendar months={1} bookings={booking1}/>
              ) : (
                <Calendar months={2} bookings={booking1}/>
              )}
            </div>
            <div className={styles.pButton}>
              <p> 
                Agregá tus fechas exactas de viaje para obtener precios exactos
              </p>
              <Button css="button4" text="Iniciar reserva"></Button>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default BookingCalendar;

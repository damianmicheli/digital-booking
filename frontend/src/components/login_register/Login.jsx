import React, { useState, useEffect } from "react";
import styles from "./loginRegister.module.css";
import Button from "../global/Button";
import Icon from "../global/Icon";
import { faEyeSlash, faEye, faCircleExclamation } from "@fortawesome/free-solid-svg-icons";
import useForm from "../../hooks/useForm";

const initialForm = {
  emailLogin: "",
  passwordLogin: "",
};

const validateForm = (form) => {
  let errors = {};
  let isRequired = "Este campo es obligatorio";

  const password = form.passwordLogin;

  //Validación de email
  if (!form.emailLogin.trim()) {
    errors.emailLogin = isRequired;
  } else {
    errors.emailLogin = "";
  }

  //Validación de contraseña
  if (!password) {
    errors.passwordLogin = isRequired;
  } else {
    errors.passwordLogin = "";
  }
  return errors;
};

const Login = () => {
  const { form, errors, handleChange, handleBlur, handleSubmitLogin } = useForm(
    initialForm,
    validateForm
  );

  const [showPass, setShowPass] = useState(false);
  const toggleBtnPass = () => {
    setShowPass((prevState) => !prevState);
  };

  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  return (
    <>
      <div className={styles.container}>
        <div className={styles.content}>
          <div className={styles.loginRequired}>
            <p><Icon icon={faCircleExclamation} css={styles.iconError} />  Para realizar una reserva necesitas estar logueado</p>
          </div>
          <p className="headings heading1">Iniciar sesión</p>
          <form id="loginForm" action="/" method="POST" onSubmit={handleSubmitLogin}>
            <div className={styles.divInputs}>
              <div className={styles.groupForm}>
                <label className="text2">Correo electrónico</label>
                <input
                  type="mail"
                  id="emailLogin"
                  name="emailLogin"
                  onBlur={handleBlur}
                  onChange={handleChange}
                  value={form.emailLogin}
                />
                {errors.emailLogin && (
                  <p className={styles.pFormError}>{errors.emailLogin}</p>
                )}
              </div>
              <div className={styles.groupForm}>
                <label className="text2">Contraseña</label>
                <div className={styles.iconInput}>
                  <input
                    type={showPass ? "text" : "password"}
                    id="passwordLogin"
                    name="passwordLogin"
                    onBlur={handleBlur}
                    onChange={handleChange}
                    value={form.passwordLogin}
                  />
                  <span onClick={toggleBtnPass}>
                    {showPass ? (
                      <Icon icon={faEye} css={styles.iconEye} />
                    ) : (
                      <Icon icon={faEyeSlash} css={styles.iconEye} />
                    )}
                  </span>
                </div>
                {errors.passwordLogin && (
                  <p className={styles.pFormError}>{errors.passwordLogin}</p>
                )}
              </div>
            
              <div className={styles.groupForm}>
                <Button css="buttonForm" text="Ingresar" />
                <span className="text2 spanForm">
                  ¿Aún tienes una cuenta? <a href="/register">Registrate</a>
                </span>
              </div>
            </div>
          </form>
        </div>
      </div>
    </>
  );
};

export default Login;

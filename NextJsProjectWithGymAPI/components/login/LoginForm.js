"use client";

import React, { useRef, useEffect } from "react";
import styles from "./LoginForm.module.css";
import Button from "../ui/Button";

export default function LoginForm(props) {
  const emailRef = useRef();
  const passwordRef = useRef();

  useEffect(() => {
    // emailRef.current.value = "boss@fitness.moon";
    // passwordRef.current.value = "asdfQWER";
    emailRef.current.value = "m@fit";
    passwordRef.current.value = "aQ";
    // emailRef.current.value = "c2@fit";
    // passwordRef.current.value = "aA";
  }, []);

  const handleSubmit = (e) => {
    e.preventDefault();

    const enteredEmail = emailRef.current.value;
    const enteredPassword = passwordRef.current.value;

    props.onFormSubmit(enteredEmail, enteredPassword);
  };

  return (
    <div className={styles.container}>
      <form className={styles.form} onSubmit={handleSubmit}>
        <label className={styles.label}>
          Email:
          <input type="email" className={styles.input} ref={emailRef} />
        </label>
        <label className={styles.label}>
          Password:
          <input type="password" className={styles.input} ref={passwordRef} />
        </label>
        <Button
          title={props.buttonTitle}
          disabled={props.submitDisabledButton}
        ></Button>
      </form>
    </div>
  );
}

import React, { useRef } from "react";
import styles from "./TrainerForm.module.css";
import Button from "../ui/Button";

const TrainerForm = (props) => {
  const firstNameRef = useRef();
  const lastNameRef = useRef();
  const emailRef = useRef();
  const passwordRef = useRef();

  const handleSubmit = (e) => {
    e.preventDefault();

    const formData = {
      userId: 0,
      firstName: firstNameRef.current.value,
      lastName: lastNameRef.current.value,
      email: emailRef.current.value,
      password: passwordRef.current.value,
      personalTrainerId: 0,
      accountType: "PersonalTrainer",
    };

    props.onSubmit(formData);

    firstNameRef.current.value = "";
    lastNameRef.current.value = "";
    emailRef.current.value = "";
    passwordRef.current.value = "";
  };

  return (
    <form onSubmit={handleSubmit} className={styles.form}>
      <label className={styles.label}>
        First Name:
        <input
          className={styles.input}
          type="text"
          name="firstName"
          placeholder="John"
          ref={firstNameRef}
        />
      </label>
      <br />
      <label className={styles.label}>
        Last Name:
        <input
          className={styles.input}
          type="text"
          name="lastName"
          placeholder="Doe"
          ref={lastNameRef}
        />
      </label>
      <br />
      <label className={styles.label}>
        Email:
        <input
          className={styles.input}
          type="email"
          name="email"
          placeholder="email@email"
          ref={emailRef}
        />
      </label>
      <br />
      <label className={styles.label}>
        Password:
        <input
          className={styles.input}
          type="password"
          name="password"
          placeholder="password"
          ref={passwordRef}
        />
      </label>
      <br />
      <br />
      <Button title="Add new trainer"></Button>
    </form>
  );
};

export default TrainerForm;

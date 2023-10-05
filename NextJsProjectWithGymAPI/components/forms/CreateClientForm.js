"use client";

import React, { useRef } from "react";
import styles from "./Form.module.css";
import Button from "../ui/Button";
import {useSession} from "next-auth/react";

const CreateClientForm = (props) => {

  const session = useSession();
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
      personalTrainerId: session.data?.userId,
      accountType: "Client",
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
          placeholder="Bruce"
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
          placeholder="Lee"
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
          placeholder="email@email.dk"
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
      <Button title="Add new client"></Button>
    </form>
  );
};

export default CreateClientForm;

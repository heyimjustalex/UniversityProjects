"use client";

import React, { useRef } from "react";
import styles from "./Form.module.css";
import Button from "../ui/Button";
import { useSession } from "next-auth/react";

const CreateWorkoutForm = (props) => {
  const session = useSession();
  const workoutNameRef = useRef();
  const workoutDescriptionRef = useRef();
  const exerciseNameRef = useRef();
  const exerciseDescriptionRef = useRef();
  const exerciseSetsRef = useRef();
  const exerciseRepetitionRef = useRef();
  const exerciseTimeRef = useRef();
  const clientIdRef = useRef();

  const handleSubmit = (e) => {
    e.preventDefault();

    const formData = {
      workoutProgramId: 0,
      name: workoutNameRef.current.value,
      description: workoutDescriptionRef.current.value,
      exercises: [
        {
          exerciseId: 0,
          name: exerciseNameRef.current.value,
          description: exerciseDescriptionRef.current.value,
          sets: exerciseSetsRef.current.value,
          repetitions: exerciseRepetitionRef.current.value,
          time: exerciseTimeRef.current.value,
          workoutProgramId: 0,
          personalTrainerId: session.data?.userId,
        },
      ],
      personalTrainerId: session.data?.userId,
      clientId: clientIdRef.current.value,
    };

    if (
      !exerciseNameRef.current.value ||
      !exerciseDescriptionRef.current.value ||
      !exerciseSetsRef.current.value ||
      !exerciseRepetitionRef.current.value ||
      !exerciseTimeRef.current.value
    ) {
      formData.exercises = [];
    }

    props.onSubmit(formData);

    workoutNameRef.current.value = "";
    workoutDescriptionRef.current.value = "";
    exerciseNameRef.current.value = "";
    exerciseDescriptionRef.current.value = "";
    exerciseSetsRef.current.value = "";
    exerciseRepetitionRef.current.value = "";
    exerciseTimeRef.current.value = "";
    clientIdRef.current.value = "";
  };

  return (
    <form onSubmit={handleSubmit} className={styles.form}>
      <label className={styles.label}>
        Workout name:
        <input
          className={styles.input}
          type="text"
          name="workoutName"
          placeholder="Insanity"
          ref={workoutNameRef}
        />
      </label>
      <br />
      <label className={styles.label}>
        Workout description:
        <input
          className={styles.input}
          type="text"
          name="workoutDescription"
          placeholder="This workout consists of..."
          ref={workoutDescriptionRef}
        />
      </label>
      <br />

      <label className={styles.label}>
        Client id:
        <input
          className={styles.input}
          type="text"
          name="clientId"
          placeholder="5"
          ref={clientIdRef}
        />
      </label>
      <br />
      <br />
      <h4>Exercise parameters (optional)</h4>
      <br />
      <label className={styles.label}>
        Exercise name:
        <input
          className={styles.input}
          type="text"
          name="exerciseName"
          placeholder="Power jump"
          ref={exerciseNameRef}
        />
      </label>
      <br />
      <label className={styles.label}>
        Exercise description:
        <input
          className={styles.input}
          type="text"
          name="exerciseDescription"
          placeholder="jump"
          ref={exerciseDescriptionRef}
        />
      </label>
      <br />
      <label className={styles.label}>
        Exercise sets:
        <input
          className={styles.input}
          type="number"
          name="exerciseSets"
          placeholder="5"
          ref={exerciseSetsRef}
        />
      </label>
      <br />
      <label className={styles.label}>
        Exercise repetition:
        <input
          className={styles.input}
          type="number"
          name="exerciseRepetition"
          placeholder="25"
          ref={exerciseRepetitionRef}
        />
      </label>
      <br />
      <label className={styles.label}>
        Exercise time:
        <input
          className={styles.input}
          type="text"
          name="exerciseTime"
          placeholder="60s"
          ref={exerciseTimeRef}
        />
      </label>

      <br />
      <br />
      <Button title="Add new workout"></Button>
    </form>
  );
};

export default CreateWorkoutForm;

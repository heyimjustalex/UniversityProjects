"use client";

import React, {useRef} from "react";
import styles from "./Form.module.css";
import Button from "../ui/Button";
import {useSession} from "next-auth/react";

const CreateExerciseForm = (props) => {

  const session = useSession();
  const exerciseNameRef = useRef();
  const exerciseDescriptionRef = useRef();
  const exerciseSetsRef = useRef();
  const exerciseRepetitionRef = useRef();
  const exerciseTimeRef = useRef();
  const workoutProgramIdRef = useRef();

  const handleSubmit = (e) => {
    e.preventDefault();

    const formData = {
      exerciseId: 0,
      name: exerciseNameRef.current.value,
      description: exerciseDescriptionRef.current.value,
      sets: exerciseSetsRef.current.value,
      repetitions: exerciseRepetitionRef.current.value,
      time: exerciseTimeRef.current.value,
      workoutProgramId: workoutProgramIdRef.current.value,
      personalTrainerId: session.data?.userId
    };

    props.onSubmit(formData);

    exerciseNameRef.current.value = "";
    exerciseDescriptionRef.current.value = "";
    exerciseSetsRef.current.value = "";
    exerciseRepetitionRef.current.value = "";
    exerciseTimeRef.current.value = "";
    workoutProgramIdRef.current.value = "";
  };

  return (
    <form onSubmit={handleSubmit} className={styles.form}>
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
      <br/>
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
      <br/>
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
      <br/>
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
      <br/>
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
      <br/>
      <label className={styles.label}>
        Workout program Id:
        <input
          className={styles.input}
          type="text"
          name="workoutProgramIdRef"
          placeholder="10"
          ref={workoutProgramIdRef}
        />
      </label>
      <br/>
      <br/>
      <Button title="Add new exercise"></Button>
    </form>
  );
};

export default CreateExerciseForm;

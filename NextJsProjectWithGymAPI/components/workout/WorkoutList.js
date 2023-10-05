import React from "react";
import Link from "next/link";
import WorkoutItem from "./WorkoutItem";
import styles from "./WorkoutList.module.css";
import Layout from "../ui/Layout";

export default function WorkoutList(props) {
  return (
    <Layout>
      <div className={styles.container}>
        {props.workouts.map((workout) => (
          <Link
            key={workout.workoutProgramId}
            href={`/workouts/${workout.workoutProgramId}`}
          >
            <div className={styles["container-item"]}>
              <WorkoutItem workout={workout} />
            </div>
          </Link>
        ))}
      </div>
    </Layout>
  );
}

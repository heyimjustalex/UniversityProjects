import React from "react";
import Link from "next/link";
import WorkoutItem from "./WorkoutItem";
import styles from "./WorkoutList.module.css";
export default function WorkoutList(props) {
  const { workouts } = props.workouts;

  return (
    <div className={styles.listContainer}>
      {workouts.map((workout) => (
        <Link
          key={workout.workoutProgramId}
          href={`/workouts/${workout.workoutProgramId}`}
        >
          <WorkoutItem workout={workout} />
        </Link>
      ))}
    </div>
  );
}

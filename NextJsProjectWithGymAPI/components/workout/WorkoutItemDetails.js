import styles from "./WorkoutItemDetails.module.css";

export default function WorkoutItemDetails(props) {
  const {
    workoutProgramId,
    name: workoutName,
    description,
    time,
    exercises,
  } = props.workout;

  return (
    <div className={styles.container} onClick={props.onClick}>
      <h2>Workout ID: {workoutProgramId}</h2>
      <p className={styles.p}>Name: {workoutName}</p>
      <p className={styles.p}>Description: {description}</p>
      <br />
      <h3>Exercises:</h3>
      <br />
      {exercises.map((exercise, index) => (
        <div className={styles.exercise} key={index}>
          <p className={styles.p}>Name: {exercise.name}</p>
          <p className={styles.p}>Description: {exercise.description}</p>
          <p className={styles.p}>Sets: {exercise.sets}</p>
          <p className={styles.p}>Repetitions: {exercise.repetitions}</p>
          <p className={styles.p}>Time: {exercise.time}</p>
        </div>
      ))}
    </div>
  );
}

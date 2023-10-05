import styles from "./WorkoutItem.module.css";

export default function WorkoutItem(props) {
  const { workoutProgramId, name, description } = props.workout;

  return (
    <div className={styles.container} onClick={props.onClick}>
      <h2>Workout ID: {workoutProgramId}</h2>
      <p className={styles.p}>Name: {name}</p>
      <p className={styles.p}>Description: {description}</p>
    </div>
  );
}

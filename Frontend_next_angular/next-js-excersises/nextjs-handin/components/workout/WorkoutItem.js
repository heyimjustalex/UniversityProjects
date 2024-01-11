export default function WorkoutItem(props) {
  const { workoutProgramId, name, description } = props.workout;

  return (
    <div className={styles.container} onClick={props.onClick}>
      <h2>Workout ID: {workoutProgramId}</h2>
      <p>Name: {name}</p>
      <p>Description: {description}</p>
    </div>
  );
}

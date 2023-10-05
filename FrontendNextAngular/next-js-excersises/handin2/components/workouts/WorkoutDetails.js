/*
 *  Component Template to show Workout Details
 */
const WorkoutDetails = ({ exercise}) => (
    <div className="Workout-Details">
      <h2>{exercise.name}</h2>
      <p>Description: {exercise.name}</p>
      <p>Sets: {exercise.sets}</p>
      <p>Repetitions: {exercise.repetitions}</p>
      <p>Time: {exercise.time}</p>
    </div>
  );
  
  export default WorkoutDetails;
  
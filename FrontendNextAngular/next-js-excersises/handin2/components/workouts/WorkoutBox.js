/*
 *  Component Template to show Workouts
 */
const WorkoutBox = ({ workout, onClick}) => (
    <div className="workout-box" onClick={onClick}>
      <h2>Workout ID: {workout.workoutProgramId}</h2>
      <p>Name: {workout.name}</p>
      <p>Description: {workout.description}</p>
    </div>
  );
  
  export default WorkoutBox;
  
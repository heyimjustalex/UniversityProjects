/*
 *  This component is a (SSR) Server Side Rendering component
 *      this means its Html is Created in the server
 *      and then sent to the Client. We know this because 
 *      it uses the function getServerSideProps() to get
 *      the information required from Backend
 * 
 */
import React from 'react';
import Link from 'next/link';
import WorkoutBox from './WorkoutBox';
import { useMyContext } from '../../context/MyContext';

const WorkoutList = ({ workouts }) => {
  const { setWorkoutId } = useMyContext();

  const handleClick = (workoutProgramId) => {
    // Sets workoutId so the Workout details page can use it
    setWorkoutId(workoutProgramId);
  };

  return (
    <div>
      {workouts.map((workout) => (
        <Link key={workout.workoutProgramId} href={`./workouts/${workout.workoutProgramId}`}>
            <WorkoutBox workout={workout} onClick={() => handleClick(workout.workoutProgramId)} />
        </Link>
      ))}
    </div>
  );
};

export default WorkoutList;


import { useState, useEffect } from 'react';
import Link from 'next/link';
import Head from 'next/head';
import Layout from '../../../components/layout';
import { useMyContext } from '../../../context/MyContext';
import WorkoutDetails from '../../../components/workouts/WorkoutDetails';

const basicUrl = 'https://afefitness2023.azurewebsites.net';
const urlClient = basicUrl + '/api/WorkoutPrograms/';

// Function fetch the workout details
async function getWorkoutDetails(workoutId, token) {
  try {
    const response = await fetch(urlClient + workoutId.toString(), {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`,
      }
    });
    return response;
  } catch (error) {
    console.error('Error Fetching workout details:', error);
    throw error;
  }
}

/*
 *  This component is a (CSR) Client Side Rendering component
 *      this means its Html is rendered in the client
 *      when something changes, we can see this on the use of
 *      useEffect() function.
 * 
 */
export default function WorkoutInfo() {
  const { workoutId, token } = useMyContext();
  const [workoutExercises, setWorkoutExercises] = useState(null);

  useEffect(() => {
    const getData = async () => {
      try {
        const response = await getWorkoutDetails(workoutId, token);
        if (response.ok) {
          const data = await response.json();
          setWorkoutExercises(data.exercises);
        } else {
          console.error('Error fetching workout details', response.statusText);
        }
      } catch (error) {
        console.error('Error in API request:', error);
      }
    };

    getData();
  }, [workoutId, token]);

  return (
    <Layout>
      <Head>
        <title>WORKOUT DESCRIPTION</title>
      </Head>
      <h1 style={{ textAlign: 'center' }}>WORKOUT DESCRIPTION</h1>
      <div>
        {workoutExercises && workoutExercises.map((exercise) => (
          <WorkoutDetails key={exercise.exerciseId} exercise={exercise} />
        ))}
      </div>
      <h2>
        <Link href="../dashboard">← Back to Main</Link>
      </h2>
    </Layout>
  );
}

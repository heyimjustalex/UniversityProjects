import Link from 'next/link';
import Head from 'next/head';
import Layout from '../../components/layout';
import WorkoutList from '../../components/workouts/WorkoutList';

const basicUrl = 'https://afefitness2023.azurewebsites.net';
const urlClient = basicUrl + '/api/WorkoutPrograms';

// Function to retrieve information as a SSR component
export async function getServerSideProps(context) {
  // Get token from Context
  const token = context.req.headers.cookie.split('=')[1]; 

  try {
    const response = await fetch(urlClient, {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Authorization': `Bearer ${token}`,
      },
    });

    const data = await response.json();
    return {
      props: {
        workouts: data,
      },
    };

  } catch (error) {
    console.error('Error during retrieveWorkouts:', error);
    return {
      props: {
        workouts: [],
      },
    };
  }
}

export default function DashboardClientt({ workouts}) { 
  return (
    <Layout>
      <Head>
        <title>CLIENT MAIN</title>
      </Head>
      <h1 style={{ textAlign: 'center' }}>CLIENT MAIN</h1>
      <WorkoutList workouts={workouts} />
      <br></br>
      <h2>
        <Link href="../login">← Back to Login</Link>
      </h2>
    </Layout>
  );
}

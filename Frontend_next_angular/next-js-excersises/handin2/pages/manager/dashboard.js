import { useState } from 'react';
import Link from 'next/link';
import Head from 'next/head';
import Layout from '../../components/layout';
import { useMyContext } from '../../context/MyContext';
import utilStyles from '../../styles/utils.module.css';

const basicUrl = 'https://afefitness2023.azurewebsites.net'; basicUrl
const urlManager = basicUrl + '/api/Users';

// Function create a new Trainer
async function addTrainer(trainer, token) {
  try {
    const response = await fetch( urlManager, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`,
      },
      body: JSON.stringify(trainer),
    });

    return response;
  } catch (error) {
    console.error('Error Adding new Trainer:', error);
    throw error;
  }
}

// Main function 
export default function DashboardManager() {

  const { token } = useMyContext();
  const [message, setMessage] = useState('');
  const [trainer, setTrainer] = useState({
    userId: 0,
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    personalTrainerId: 0,
    accountType: 'PersonalTrainer',
  });


  // FUNCTION to hanlde the Submit button
  const handleChange = (e) => {
    setTrainer({
      ...trainer,
      [e.target.name]: e.target.value,
    });
  };


  // FUNCTION to hanlde the Submit button
  const handleSubmit = async (e) => {
    e.preventDefault();

    // Verify fields are not empty
    const requiredFields = ['firstName', 'lastName', 'email', 'password'];
    const isFieldsFilled = requiredFields.every((field) => trainer[field].trim() !== '');

    // Error if fields are empty or not filled properly
    if (!isFieldsFilled) {
      setMessage('Fill all the fields properly');
    } else {
      const response = await addTrainer(trainer, token);
      if (response.ok) {
        console.log('Trainer added successfully!');
        console.log('trainer:', trainer);
        setMessage('Trainer added successfully!');
        setTrainer({
          userId: 0,
          firstName: '',
          lastName: '',
          email: '',
          password: '',
          personalTrainerId: 0,
          accountType: '',
        });
      } else {
        console.error('Error adding Trainer:', response.statusText);
      }
    }
  };

  return (
    <Layout>
      <Head>
        <title>MANAGER MAIN</title>
      </Head>
      <h1 style={{ textAlign: 'center' }}>MANAGER MAIN</h1>

      {message && 
      <p className={utilStyles.lightText}>
        {message}
      </p>}

      <form onSubmit={handleSubmit}>
        <label>
          First Name:
          <input
            type="text"
            name="firstName"
            placeholder="John"
            value={trainer.firstName}
            onChange={handleChange}
          />
        </label>
        <br />
        <label>
          Last Name:
          <input
            type="text"
            name="lastName"
            placeholder="Doe"
            value={trainer.lastName}
            onChange={handleChange}
          />
        </label>
        <br />
        <label>
          Email:
          <input
            type="email"
            name="email"
            placeholder="email@email"
            value={trainer.email}
            onChange={handleChange}
          />
        </label>
        <br />
        <label>
          Password:
          <input
            type="password"
            name="password"
            placeholder="password"
            value={trainer.password}
            onChange={handleChange}
          />
        </label>
        <br />
        <button type="submit">Add new Trainer</button>
      </form>

      <h2>
        <Link href="../login">← Back to Login</Link>
      </h2>
    </Layout>
  );
}

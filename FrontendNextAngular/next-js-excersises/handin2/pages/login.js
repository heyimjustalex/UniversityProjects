import { useState } from 'react';
import Link from 'next/link';
import Head from 'next/head';
import Layout from '../components/layout';
import { useRouter } from 'next/router';

import { useMyContext } from '../context/MyContext';

// Import library for Jwt decoding
const jwt = require('jsonwebtoken');

// Base Url and different endPoints for Users
const basicUrl = 'https://afefitness2023.azurewebsites.net';
const epLogin = '/api/Users/login';
  
// Function to request LOGIN
async function fetchLogin(email, password) {
  try {
    const response = await fetch(basicUrl + epLogin, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer',
      },
      body: JSON.stringify({
        email: email,
        password: password,
      }),
    });

    return response;
  } catch (error) {
    console.error('Error during login:', error);
    throw error;
  }
}

// Function to decode Token and acces to the Role
const getRoleFromToken = (token) => {
  try {
    const decodedToken = jwt.decode(token, { complete: true });

    if (!decodedToken) {
      console.error('Error decoding the Token');
      return null;
    }

    const { Role } = decodedToken.payload;
    return Role;
  } catch (error) {
    console.error('Error decoding the Token: ', error);
    return null;
  }
};


// Main Function
export default function Login() {

  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [token, setToken] = useState(null);
  const router = useRouter();

  // Import to set Token in context
  const { setAuthToken } = useMyContext();  

  const handleLogin = async () => {
    try {
      const response = await fetchLogin(email,password);

      if (response.status === 200) {
        const data = await response.json();
        console.log('Login successful');
        setToken(data.jwt);

        // Set token in context
        setAuthToken(data.jwt); 

        // Launch Dashboards depending on the role
        switch (getRoleFromToken(data.jwt)) {
          case 'Client':
            console.log('User Logged in is a Client');
            router.push(`./client/dashboard`);
            break;
          case 'Manager':
            console.log('User Logged in is a Manager');
            router.push(`./manager/dashboard`);
            break;
          case 'PersonalTrainer':
            console.log('User Logged in is a Trainer');
            router.push(`./trainer/dashboard`);
            break;
          default:
            console.log('Role not recognised');
        }

      } else {
        console.error('Login failed. Status code:', response.status);
      }
    } catch (error) {
      console.error('Error during handlinLogin:', error);
    }
  };


  return (
    <Layout pageType={"login"}>
      <Head>
        <title>LOGIN</title>
      </Head>
      
      <form>
        <label>
          Email:
          <input 
            type="email" 
            placeholder="email@email" 
            value={email} onChange={(e) => setEmail(e.target.value)} 
          />
        </label>
        <br />
        <label>
          Password:
          <input 
            type="password"
            placeholder="password" 
            value={password} onChange={(e) => setPassword(e.target.value)} 
          />
        </label>
        <br />
        <button type="button" onClick={handleLogin}>
          Login
        </button>
      </form>

      <h2>
        <Link href="/">← Back to home</Link>
      </h2>
    </Layout>
  );
}

import React, { createContext, useContext, useState, useEffect } from 'react';
import Cookies from 'js-cookie';

const MyContext = createContext();

export const MyProvider = ({ children }) => {

  const [token, setTokenState] = useState('');
  const [workoutId, setWorkoutId] = useState(0);

  useEffect(() => {
    // Retrieve token from Client Cookies
    const savedToken = Cookies.get('myToken');
    if (savedToken) {
      setTokenState(savedToken);
    }
  }, []);

  const setAuthToken = (newToken) => {
    // Set token on Client Cookies
    Cookies.set('myToken', newToken, { sameSite: 'None', secure: true });
    setTokenState(newToken);
  };

  return (
    <MyContext.Provider value={{ token, setAuthToken, workoutId, setWorkoutId}}>
      {children}
    </MyContext.Provider>
  );
};

export const useMyContext = () => {
  return useContext(MyContext);
};

import { createContext, useState, useEffect } from "react";
import { jwtDecode } from "jwt-decode";

let logoutTimer;

export const AuthContext = createContext({
  name: null,
  token: null,
  role: null,
  userId: null,
  exp: null,
  login: (token) => {},
  logout: () => {},
});

export const AuthContextProvider = (props) => {
  const logoutSetLocalStorage = () => {
    if (typeof window !== "undefined") {
      localStorage.removeItem("userId");
      localStorage.removeItem("name");
      localStorage.removeItem("role");
      localStorage.removeItem("token");
      localStorage.removeItem("exp");
    }
  };

  const calculateRemainingTime = (expTime) => {
    const currentTime = new Date().getTime();
    console.log("current time", Date(currentTime));
    const adjExpTime = new Date(expTime);
    console.log("exp time", expTime);
    const remainingTime = adjExpTime - currentTime;
    console.log("remaining", remainingTime);
    return remainingTime;
  };

  const retrieveStoredToken = () => {
    let storedExp;
    let storedUserId;
    let storedName;
    let storedRole;
    let storedToken;
    if (typeof window !== "undefined") {
      storedExp = localStorage.getItem("exp");
      storedUserId = localStorage.getItem("userId");
      storedName = localStorage.getItem("name");
      storedRole = localStorage.getItem("role");
      storedToken = localStorage.getItem("token");
    }

    const remainingTime = calculateRemainingTime(storedExp);

    if (remainingTime <= 6000) {
      logoutSetLocalStorage();
      return null;
    }
    return {
      token: storedToken,
      exp: storedExp,
      role: storedRole,
      userId: storedUserId,
      name: storedName,
      remaningTime: remainingTime,
    };
  };

  const retrievedToken = retrieveStoredToken();
  let initialToken;
  let initialRole;
  let initialName;
  let initialUserId;
  let initialExp;

  if (retrievedToken) {
    initialToken = retrievedToken.token;
    initialRole = retrievedToken.role;
    initialName = retrievedToken.name;
    initialUserId = retrievedToken.userId;
    initialExp = retrievedToken.exp;
  }

  const [name, setName] = useState(initialName);
  const [token, setToken] = useState(initialToken);
  const [role, setRole] = useState(initialRole);
  const [userId, setUserId] = useState(initialUserId);
  const [exp, setExp] = useState(initialExp);

  const logoutSetStates = () => {
    setName(null);
    setRole(null);
    setUserId(null);
    setToken(null);
    setExp(null);

    if (logoutTimer) {
      clearTimeout(logoutTimer);
    }
  };

  const logout = () => {
    logoutSetLocalStorage();
    logoutSetStates();
  };

  useEffect(() => {
    if (retrievedToken) {
      logoutTimer = setTimeout(logout, retrievedToken.remaningTime);
    }
  }, [retrievedToken, logout]);

  const loginSetStates = (token) => {
    const { Name, Role, UserId, exp } = jwtDecode(token);
    setName(Name);
    setRole(Role);
    setUserId(UserId);
    setToken(token);
    setExp(exp);
  };

  const loginSetLocalStorage = (token) => {
    const { Name, Role, UserId, exp } = jwtDecode(token);
    // console.log("Name", Name);
    // console.log("Role", Role);
    // console.log("UserId", UserId);
    console.log("Exp jwt", exp);

    if (typeof window !== "undefined") {
      localStorage.setItem("userId", UserId);
      localStorage.setItem("name", Name);
      localStorage.setItem("role", Role);
      localStorage.setItem("token", token);
      localStorage.setItem("exp", exp);
      const remainingTime = calculateRemainingTime(exp);
      console.log("REMAINING GOOD", remainingTime);
      logoutTimer = setTimeout(logout, remainingTime);
    }
  };

  const login = (token) => {
    loginSetLocalStorage(token);
    loginSetStates(token);
  };

  const ContextValue = {
    name: name,
    userId: userId,
    token: token,
    role: role,
    exp: exp,
    login: login,
    logout: logout,
  };

  return (
    <AuthContext.Provider value={ContextValue}>
      {props.children}
    </AuthContext.Provider>
  );
};

export default AuthContext;

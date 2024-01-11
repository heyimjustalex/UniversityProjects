import { createContext, useState, useEffect } from "react";
import { jwtDecode } from "jwt-decode";
import Cookies from "js-cookie";

export const AuthContext = createContext({
  name: null,
  token: null,
  role: null,
  userId: null,
  login: (token) => {},
  logout: () => {},
  getValueFromCookie: (key) => {},
});

export const AuthContextProvider = (props) => {
  const logoutSetCookieStorage = () => {
    Cookies.remove("userId");
    Cookies.remove("name");
    Cookies.remove("role");
    Cookies.remove("token");
  };

  const retrieveStoredToken = () => {
    const storedToken = Cookies.get("token");
    const storedRole = Cookies.get("role");
    const storedName = Cookies.get("name");
    const storedUserId = Cookies.get("userId");

    return {
      token: storedToken,
      role: storedRole,
      userId: storedUserId,
      name: storedName,
    };
  };

  const [name, setName] = useState("");
  const [token, setToken] = useState("");
  const [role, setRole] = useState("");
  const [userId, setUserId] = useState("");

  const retrievedToken = retrieveStoredToken();

  useEffect(() => {
    setToken(retrievedToken.token);
    setRole(retrievedToken.role);
    setName(retrievedToken.name);
    setUserId(retrievedToken.userId);
  }, []);

  const logoutSetStates = () => {
    setName(null);
    setRole(null);
    setUserId(null);
    setToken(null);
  };

  const logout = () => {
    logoutSetCookieStorage();
    logoutSetStates();
  };

  const loginSetStates = (token) => {
    const { Name, Role, UserId } = jwtDecode(token);
    setName(Name);
    setRole(Role);
    setUserId(UserId);
    setToken(token);
  };

  const loginSetCookieStorage = (token) => {
    const { Name, Role, UserId } = jwtDecode(token);
    Cookies.set("token", token, { sameSite: "None", secure: true });
    Cookies.set("userId", UserId, { sameSite: "None", secure: true });
    Cookies.set("name", Name, { sameSite: "None", secure: true });
    Cookies.set("role", Role, { sameSite: "None", secure: true });
  };

  const login = (token) => {
    loginSetCookieStorage(token);
    loginSetStates(token);
  };

  const getValueFromCookie = (key) => {
    return Cookies.get(key);
  };

  const ContextValue = {
    name: name,
    userId: userId,
    token: token,
    role: role,
    login: login,
    logout: logout,
    getValueFromCookie: getValueFromCookie,
  };

  return (
    <AuthContext.Provider value={ContextValue}>
      {props.children}
    </AuthContext.Provider>
  );
};

export default AuthContext;

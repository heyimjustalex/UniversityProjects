"use server";
import { setCookie } from "cookies-next";
const BASIC_URL = "https://afefitness2023.azurewebsites.net/api";

export const getMotivationalQuoteAPI = () => {
  const QUOTES_API_URL = "https://zenquotes.io/api/random/confidence";

  const getData = async () => {
    try {
      const response = await fetch(QUOTES_API_URL, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },
      });

      if (!response.ok) {
        throw new Error(`Request failed with status: ${response.status}`);
      }

      const result = await response.json();
      return result;
    } catch (error) {
      throw new Error(`GET request failed: ${error.message}`);
    }
  };

  return { getData };
};

export async function loginUser(email, password) {
  try {
    const response = await fetch(BASIC_URL + "/Users/login", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ email: email, password: password }),
    });

    return response;
  } catch (error) {
    console.error("Error Adding new Trainer:", error);
    throw error;
  }
}

export async function loginUserLocal(email, password) {
  try {
    const response = await fetch("/api/login", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ email: email, password: password }),
    });

    return response;
  } catch (error) {
    console.error("Error Adding new Trainer:", error);
    throw error;
  }
}

export async function addTrainer(data, token) {
  try {
    console.log("Mytoken value", token);
    const response = await fetch(BASIC_URL + "/Users", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`,
      },
      body: JSON.stringify(data),
    });

    return response;
  } catch (error) {
    console.error("Error Adding new Trainer:", error);
    throw error;
  }
}

import axios from "axios";
import https from "https";
process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 0;
import { setCookie } from "cookies-next";

export async function loginUser(email, password) {
  const agent = new https.Agent({
    rejectUnauthorized: false,
  });

  try {
    const response = await fetch(
      "https://afefitness2023.azurewebsites.net/api/Users/login",
      {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ email: email, password: password }),
      }
    );

    return response.json();
  } catch (error) {
    console.error("Error loginr:", error);
    throw error;
  }
}

export default async function loginAPI(req, res) {
  const { headers, body } = req;

  //   console.log("Login API", headers);
  console.log("Login API", body);
  // res.send(data)
  const response = await loginUser(body.email, body.password);
  console.log(response.jwt);
  setCookie("token", response.jwt, { sameSite: "None", secure: true });
  res.send(response);
  //   console.log("RESPONSE: ", response);

  // "https://afefitness2023.azurewebsites.net/api/Users/login"
}

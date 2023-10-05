import CredentialsProvider from "next-auth/providers/credentials";
import NextAuth from "next-auth";

import { jwtDecode } from "jwt-decode";
import { cookies, setCookie } from "next/headers";
import { log } from "console";
const options = {
  secret: process.env.AUTH_SECRET,
  logger: {
    error(code, metadata) {
      log("ERROR ", code, metadata);
    },
    warn(code) {
      log("WARN ", code);
    },
    debug(code, metadata) {
      log.debug("DEBUG ", code, metadata);
    },
  },
  providers: [
    CredentialsProvider({
      name: "credentials",
      credentials: {
        email: {
          label: "email",
          type: "email",
          placeholder: "meine.email@domain.com",
        },
        password: { label: "password", type: "password" },
      },
      async authorize(credentials) {
        // The 'url' is pointing to a Rails API endpoint which returns a JWT Token
        const url = `https://afefitness2023.azurewebsites.net/api/Users/login`;

        const res = await fetch(url, {
          method: "POST",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
            Authorization: "Bearer",
          },
          body: JSON.stringify({
            email: credentials.email,
            password: credentials.password,
          }),
        });
        const user = await res.json();
        // console.log(user);
        // If no error and we have user data, return it
        if (res.ok && user) {
          console.log("Successful login. User data:", user);
          return user;
        }
        // Return null if user data could not be retrieved
        return null;
      },
    }),
  ],

  callbacks: {
    async jwt({ token, user, account, isNewUser }) {
      if (user) {
        if (user.jwt) {
          const { Name, Role, UserId } = jwtDecode(user.jwt);
          token = { token: user.jwt, role: Role, userId: UserId };
        }
      }
      return token;
    },

    session({ session, token }) {
      //server side
      cookies().set("token", token.token, { sameSite: "None", secure: true });
      cookies().set("role", token.role, { sameSite: "None", secure: true });
      cookies().set("userId", token.userId, { sameSite: "None", secure: true });

      //client side
      session.token = token.token;
      session.role = token.role;
      session.userId = token.userId;

      return session;
    },
    pages: {
      signIn: "/login",
    },
  },
};

const handler = NextAuth(options);

export { handler as GET, handler as POST };

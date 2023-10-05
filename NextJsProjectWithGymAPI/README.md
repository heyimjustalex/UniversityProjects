# Fitness Web App with Next.js Version 13 and NextAuth

This repository contains the code for a fitness web app built with Next.js version 13, utilizing the NextAuth authentication approach and App Router. The app communicates with a backend API hosted at https://afefitness2023.azurewebsites.net/swagger/index.html, which is documented using Swagger.

## App link

```bash
https://gym-api-next-js.vercel.app/
```

## Technology Requirements

- Next.js v13: The web app is built using the latest version of Next.js to leverage its features and improvements.

- NextAuth: Authentication is implemented using NextAuth, providing a secure and customizable authentication solution.

- App Router: The app uses Next.js App Router for efficient client-side navigation.

- Public Cloud Deployment: The app is deployed to a public cloud platform, such as Vercel, ensuring accessibility and scalability.

## Functional Requirements

- User Authentication

  - Users can log in securely using the authentication flow provided by NextAuth.

- Manager Operations

  - Managers can create new users (personal trainers) through the app.

- Personal Trainer Operations

  - Personal trainers can create new users (clients) associated with their account.
  - They can create a new workout program for a specific client.
  - Personal trainers can add new exercises to a workout program, specifying the exercise name, description, number of sets, and repetitions or duration.

- Dashboard for Personal Trainer

  - Personal trainers can view a list of workout programs
  - They can view the details of a specific workout program.
  - Personal trainers can see a list of clients associated with their account.

- Client Operations
  - Clients can view their assigned workout program.
  - If a client has more than one program, the app displays a list of programs, allowing the client to select the program to be displayed.

## Getting Started

First, run the development server:

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

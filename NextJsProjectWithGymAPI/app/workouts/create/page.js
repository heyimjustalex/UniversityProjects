"use client";

import LoadingRing from "@/components/ui/LoadingRing";
import SuccessMessage from "@/components/ui/SuccessMessage";
import ErrorMessage from "@/components/ui/ErrorMessage";
import Layout from "@/components/ui/Layout";
import useHttp from "@/hooks/use-http";
import { addWorkout } from "@/lib/api";
import { useSession } from "next-auth/react";
import CreateWorkoutForm from "@/components/forms/CreateWorkoutForm";

export default function WorkoutAddPage() {
  const session = useSession();
  const token = session.data?.token ?? null;

  const {
    sendRequest: sendAddWorkoutReq,
    status: statusWorkoutReq,
    error: errorWorkoutReq,
    data: dataUserReq,
  } = useHttp(addWorkout);

  async function onSubmitWorkout(formData) {
    console.log("Token before API call:", token);
    await sendAddWorkoutReq(formData, token);
  }

  return (
    <Layout>
      <br /> <br />
      <CreateWorkoutForm onSubmit={onSubmitWorkout} />
      {statusWorkoutReq === "pending" && <LoadingRing />}
      {statusWorkoutReq === "completed" && !errorWorkoutReq && (
        <SuccessMessage message={"Workout added!"} />
      )}
      {statusWorkoutReq === "completed" && errorWorkoutReq && (
        <ErrorMessage message={errorWorkoutReq} />
      )}
    </Layout>
  );
}

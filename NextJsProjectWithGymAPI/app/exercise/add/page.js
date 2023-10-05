"use client";

import LoadingRing from "@/components/ui/LoadingRing";
import SuccessMessage from "@/components/ui/SuccessMessage";
import ErrorMessage from "@/components/ui/ErrorMessage";
import Layout from "@/components/ui/Layout";
import useHttp from "@/hooks/use-http";
import { useSession } from "next-auth/react";
import { addExercise } from "@/lib/api";
import CreateExerciseForm from "@/components/forms/CreateExerciseForm";

export default function ExerciseAddPage() {
  const session = useSession();
  const token = session.data?.token ?? null;

  const {
    sendRequest: sendAddExerciseReq,
    status: statusExerciseReq,
    error: errorExerciseReq,
    data: dataUserReq,
  } = useHttp(addExercise);

  async function onSubmitExercise(formData) {
    console.log("Token before API call:", token);
    await sendAddExerciseReq(formData, token);
  }

  return (
    <Layout>
      <br /> <br />
      <CreateExerciseForm onSubmit={onSubmitExercise} />
      {statusExerciseReq === "pending" && <LoadingRing />}
      {statusExerciseReq === "completed" && !errorExerciseReq && (
        <SuccessMessage message={"Exercise added!"} />
      )}
      {statusExerciseReq === "completed" && errorExerciseReq && (
        <ErrorMessage message={errorExerciseReq} />
      )}
    </Layout>
  );
}

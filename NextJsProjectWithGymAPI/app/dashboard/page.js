"use client";

import TrainerForm from "@/components/forms/TrainerForm";
import Layout from "@/components/ui/Layout";
import { useSession } from "next-auth/react";
import { addTrainer } from "@/lib/api";
import useHttp from "@/hooks/use-http";
import LoadingRing from "@/components/ui/LoadingRing";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SuccessMessage from "@/components/ui/SuccessMessage";
import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import DashboardOption from "@/components/dashboard/DashboardOption";

export default function DashboardPage(props) {
  const session = useSession();
  const token = session.data?.token ?? null;
  const router = useRouter();
  const {
    sendRequest: sendAddTrainerReq,
    status: statusTrainerReq,
    error: errorTrainerReq,
    data: dataTrainerReq,
  } = useHttp(addTrainer);

  async function onSubmitTrainer(formData) {
    await sendAddTrainerReq(formData, token);
  }
  const [showLoading, setShowLoading] = useState(false);
  useEffect(() => {
    let timeout;
    if (session.status === "unauthenticated") {
      setShowLoading(true);
      timeout = setTimeout(() => {
        setShowLoading(false);
      }, 2000);
    }

    return () => clearTimeout(timeout);
  }, [session.status]);

  if (session.status == "authenticated") {
    const role = session.data?.role;

    if (role == "Manager") {
      return (
        <Layout>
          <h1 style={{ textAlign: "center" }}> {role} Dashboard</h1>
          <br /> <br />
          {statusTrainerReq !== "pending" && (
            <TrainerForm onSubmit={onSubmitTrainer} />
          )}
          {statusTrainerReq == "pending" && <LoadingRing />}
          {statusTrainerReq == "completed" && !errorTrainerReq && (
            <SuccessMessage message={"Trainer added!"} />
          )}
          {statusTrainerReq == "completed" && errorTrainerReq && (
            <ErrorMessage message={errorTrainerReq} />
          )}
        </Layout>
      );
    } else if (role == "PersonalTrainer") {
      return (
        <Layout>
          <h1 style={{ textAlign: "center" }}> {role} Dashboard</h1>
          <br /> <br />
          <div
            style={{
              textAlign: "center",
              display: "flex",
              justifyContent: "space-around",
            }}
          >
            <DashboardOption
              href="/workouts/create"
              title="Create Workout"
            ></DashboardOption>
            <DashboardOption
              href="/clients/add"
              title="Add Client"
            ></DashboardOption>
            <DashboardOption
              href="/exercise/add"
              title="Add Exercise"
            ></DashboardOption>
          </div>
        </Layout>
      );
    } else if (role == "Client") {
      // has to be wrapped, otherwise there is some warning
      useEffect(() => {
        router.replace("/workouts");
      }, []);
    }
  } else if (session.status === "unauthenticated") {
    return (
      <Layout>
        {showLoading && <LoadingRing />}
        {!showLoading && <ErrorMessage message={"Log in first!"} />}
      </Layout>
    );
  } else {
    return (
      <Layout>
        <LoadingRing />
      </Layout>
    );
  }
}

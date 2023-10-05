"use client";

import LoadingRing from "@/components/ui/LoadingRing";
import SuccessMessage from "@/components/ui/SuccessMessage";
import ErrorMessage from "@/components/ui/ErrorMessage";
import Layout from "@/components/ui/Layout";
import useHttp from "@/hooks/use-http";
import { addUser } from "@/lib/api";
import { useSession } from "next-auth/react";
import CreateClientForm from "@/components/forms/CreateClientForm";

export default function ClientAddPage() {
  const session = useSession();
  const token = session.data?.token ?? null;

  const {
    sendRequest: sendAddUserReq,
    status: statusUserReq,
    error: errorUserReq,
    data: dataUserReq,
  } = useHttp(addUser);

  async function onSubmitUser(formData) {
    console.log("Token before API call:", token);
    await sendAddUserReq(formData, token);
  }

  return (
    <Layout>
      <br /> <br />
      <CreateClientForm onSubmit={onSubmitUser} />
      {statusUserReq === "pending" && <LoadingRing />}
      {statusUserReq === "completed" && !errorUserReq && (
        <SuccessMessage message={"Client added!"} />
      )}
      {statusUserReq === "completed" && errorUserReq && (
        <ErrorMessage message={errorUserReq} />
      )}
    </Layout>
  );
}

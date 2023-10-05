"use client";
import React, { useState } from "react";
import { signIn, signOut, useSession } from "next-auth/react";
import Layout from "@/components/ui/Layout";
import LoginForm from "@/components/login/LoginForm";
import ErrorMessage from "@/components/ui/ErrorMessage";
import LoadingRing from "@/components/ui/LoadingRing";
import { useRouter } from "next/navigation";
import Button from "@/components/ui/Button";
import SuccessMessage from "@/components/ui/SuccessMessage";

export default function LoginPage() {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);
  const router = useRouter();
  const session = useSession();

  async function handleLogin(enteredEmail, enteredPassword) {
    setError(null);
    setIsLoading(true);
    const res = await signIn("credentials", {
      email: enteredEmail,
      password: enteredPassword,
      callbackUrl: "/",
      redirect: false,
    });
    if (res?.status == 200) {
      router.refresh();
      router.replace("/dashboard");
    } else {
      setError("Login failed. Please check your email and password.");
    }
    setIsLoading(false);
  }

  if (session.status == "unauthenticated") {
    return (
      <Layout>
        {!isLoading && (
          <LoginForm
            submitDisabledButton={false}
            onFormSubmit={handleLogin}
            buttonTitle="Login"
          ></LoginForm>
        )}

        {isLoading && <LoadingRing />}
        {error && <ErrorMessage message={error} />}
      </Layout>
    );
  } else if (session.status === "authenticated") {
    return <Layout></Layout>;
  } else {
    return (
      <Layout>
        <LoadingRing />
      </Layout>
    );
  }
}

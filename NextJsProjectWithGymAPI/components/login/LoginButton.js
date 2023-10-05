"use client";
import { signOut } from "next-auth/react";
import Button from "../ui/Button";
import { useRouter } from "next/navigation";

export default function LoginButton(props) {
  const router = useRouter();
  async function handleLogout() {
    await signOut({
      callbackUrl: "/",
      redirect: false,
    });

    //delete all client side

    document.cookie.split(";").forEach(function (c) {
      document.cookie = c
        .replace(/^ +/, "")
        .replace(/=.*/, "=;expires=" + new Date().toUTCString() + ";path=/");
    });

    router.refresh();
    router.replace("/");
  }

  return (
    <Button
      onClick={props.isLogout ? handleLogout : () => {}}
      title={props.title}
    />
  );
}

import LoginForm from "@/components/login/LoginForm";
import Layout from "@/components/ui/Layout";
import { loginUserLocal } from "@/lib/api";
import { post } from "axios";
import { setCookie } from "cookies-next";

export default function LoginPage() {
  const handleLogin = async (email, password) => {
    const response = await loginUserLocal(email, password);

    const data = await response.json();

    console.log(data.jwt);

    setCookie("token", data.jwt, { sameSite: "None", secure: true });
  };

  return (
    <Layout>
      {
        <LoginForm
          submitDisabledButton={false}
          onFormSubmit={handleLogin}
          buttonTitle="Login"
        ></LoginForm>
      }

      {/* {<LoadingRing />}
      {<ErrorMessage message={"test"} />} */}
    </Layout>
  );
}

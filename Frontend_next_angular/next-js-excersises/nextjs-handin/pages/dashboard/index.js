import TrainerForm from "@/components/forms/TrainerForm";
import ErrorMessage from "@/components/ui/ErrorMessage";
import Layout from "@/components/ui/Layout";
import LoadingRing from "@/components/ui/LoadingRing";
import useHttp from "@/hooks/use-http";
import AuthContext from "@/store/AuthContext";
import { getCookie } from "cookies-next";
import { addTrainer } from "@/lib/api";
import useFetch from "use-http";

export default function DashboardPage(props) {
  const BASIC_URL = "https://afefitness2023.azurewebsites.net/api";
  const token = getCookie("token");
  const options = {
    headers: {
      "Content-Type": "application/json",
      Accept: "application/json",
      Authorization: `Bearer ${token}`,
    },
  };
  const { post, response, loading, error } = useFetch(BASIC_URL, options);

  const onSubmitTrainer2 = async (trainerData) => {
    try {
      const token = getCookie("token"); // Assuming getCookie is a function you have
      console.log("USEFETCH", token);

      const result = await post("/Users", trainerData, {
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${token}`,
        },
      });
      return result;
    } catch {
      console.log("exception");
    }
  };

  //   const { sendRequest, data, status, error } = useHttp(addTrainer);

  const onSubmitTrainer = async (trainerData) => {
    const token2 = getCookie("token");
    console.log("sending token", token2);
    await addTrainer(trainerData, token2);
  };

  return (
    <Layout>
      <h1 style={{ textAlign: "center" }}>Manager Dashboard</h1>
      {<TrainerForm onSubmit={onSubmitTrainer2} />}
      {/* {loading && <LoadingRing />}
      {error && <ErrorMessage message={error} />}
      {!error && <p>Success</p>} */}
    </Layout>
  );
}

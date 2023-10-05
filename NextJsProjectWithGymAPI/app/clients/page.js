import ClientItem from "@/components/client/ClientItem";
import ErrorMessage from "@/components/ui/ErrorMessage";
import Layout from "@/components/ui/Layout";
import { getClients } from "@/lib/api";
import { cookies } from "next/headers";

export default async function clientsPage() {
  if (typeof window !== "undefined") {
    console.log("Client side ClientPage");
  } else {
    console.log("Server side ClientPage");
  }

  const token = cookies().get("token")?.value;
  const role = cookies().get("role")?.value;
  if (token) {
    if (role === "PersonalTrainer") {
      try {
        const response = await getClients({}, token);
        const result = await response.json();

        if (result) {
          return (
            <Layout>
              {result.map((client) => {
                return <ClientItem client={client} />;
              })}
            </Layout>
          );
        }
      } catch (error) {
        console.error("Error fetching workouts:", error.message);
      }
    } else {
      return (
        <Layout>
          <ErrorMessage message="You are not allowed to see clients"></ErrorMessage>
        </Layout>
      );
    }
  }
}

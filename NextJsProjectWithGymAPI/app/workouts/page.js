import Layout from "@/components/ui/Layout";
import WorkoutList from "@/components/workout/WorkoutList";
import { getWorkouts } from "@/lib/api";
import { cookies } from "next/headers";

export default async function WorkoutsPage() {
  const token = cookies().get("token")?.value;

  if (token) {
    try {
      const response = await getWorkouts({}, token);
      const result = await response.json();

      if (result) {
        return (
          <Layout>
            <WorkoutList workouts={result}></WorkoutList>
          </Layout>
        );
      }
    } catch (error) {
      console.error("Error fetching workouts:", error.message);
    }
  }
}

import { useRouter } from "next/router";

function ClientProjectsPage() {
  const router = useRouter();

  function loadProjectHandler() {
    router.push({
      pathname: "/clients/[id]/[projectid]",
      query: { id: "max", projectid: "projecta" },
    });
  }

  return (
    <div>
      <h1>Projects of a given client</h1>
      <button onClick={loadProjectHandler}>Load projects</button>
    </div>
  );
}

export default ClientProjectsPage;

// /lib/client with apollo client init

import { ApolloClient, HttpLink, InMemoryCache } from "@apollo/client";
import { registerApolloClient } from "@apollo/experimental-nextjs-app-support/rsc";

export const { getClient } = registerApolloClient(() => {
  return new ApolloClient({
    cache: new InMemoryCache(),
    link: new HttpLink({
      uri: "https://main--spacex-l4uc6p.apollographos.net/graphql",
    }),
  });
});

// home component

import { getClient } from "@/lib/client";
import { gql } from "@apollo/client";
const query = gql`
  query Launches {
    launches {
      id
      details
      mission_name
      rocket {
        rocket_name
        rocket_type
      }
    }
  }
`;

export default async function Home() {
  if (typeof window !== "undefined") {
    console.log("Client side HomePage");
  } else {
    console.log("Server side HomePage");
  }

  const { data } = await getClient().query({ query });

  return (
    <main>
      {data.launches.map((element) => (
        <tr>
          <td>{element.id}</td>
          <td>{element.mission_name}</td>
        </tr>
      ))}
    </main>
  );
}

npm install @apollo/client graphql - install
In app.js/app.ts
import { ApolloClient, InMemoryCache, ApolloProvider, gql } from '@apollo/client';
const client = new ApolloClient({
 uri: 'https://flyby-router-demo.herokuapp.com/',
cache: new InMemoryCache(),
});


ReactDOM.createRoot(document.getElementById("root") as HTMLElement).render(
  <React.StrictMode>
	<ApolloProvider client={client}>
  	<App />
	</ApolloProvider>
  </React.StrictMode>,
);
Then just use hook ‘useQuery’ and ‘gql’


import { useQuery, gql } from "@apollo/client";
const GET_LOCATIONS = gql`
  query GetLocations {
	locations {
  	id
  	name
  	description
  	photo
	}
  }
`;

function App() {
  const { loading, error, data } = useQuery(GET_LOCATIONS);

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error : {error.message}</p>;

  return data.locations.map(({ id, name, description, photo }) => (
	<div key={id}>
  	<h3>{name}</h3>
	…
)

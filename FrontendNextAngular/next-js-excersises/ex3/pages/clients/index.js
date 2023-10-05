import Link from "next/link";

export default function ClientsPage() {
  const clients = [
    { id: "max", name: "Maximilan" },
    { id: "manu", name: "Manuel" },
  ];

  return (
    <div>
      <ul>
        {clients.map((client) => (
          <li key={client.id}>
            <Link
              href={{
                pathname: "/clients/[id]",
                query: { id: client.id },
              }}
            >
              {client.name}
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}

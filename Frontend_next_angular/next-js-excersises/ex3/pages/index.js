import Link from "next/link";

export default function HomePage() {
  return (
    <div>
      <h1>The home page</h1>
      <ul>
        <li>
          <Link href="/portfolio">portfolio</Link>
        </li>
        <li>
          <Link href="/clients">clients</Link>
        </li>
      </ul>
    </div>
  );
}

import Link from 'next/link';
import Head from 'next/head';
import Layout from '../../components/layout';
import { useMyContext } from '../../context/MyContext';

export default function DashboardClient() {

  const { token } = useMyContext();
  console.log("Trainer token-> ", token);

  return (
    <Layout>
      <Head>
        <title>WORKOUT DESCRIPTION</title>
      </Head>
      <h1 style={{ textAlign: 'center' }}>WORKOUT DESCRIPTION</h1>
      <h2>
        <Link href="/">← Back to home</Link>
      </h2>
    </Layout>
  );
}

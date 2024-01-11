import Link from 'next/link';
import Head from 'next/head';
import Layout from '../../components/layout';
import { useRouter } from 'next/router';

export default function DashboardClient() {

  return (
    <Layout>
      <Head>
        <title>TRAINER MAIN</title>
      </Head>
      <h1 style={{ textAlign: 'center' }}>TRAINER MAIN</h1>
      <h2>
      <Link href="../login">← Back to Login</Link>
      </h2>
    </Layout>
  );
}

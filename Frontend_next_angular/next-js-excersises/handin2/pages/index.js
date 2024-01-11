import Head from 'next/head';
import Layout, { siteTitle } from '../components/layout';
import utilStyles from '../styles/utils.module.css';
import Link from 'next/link';

export default function Home() {
  return (
    <Layout pageType={"home"}>
      <Head>
        <title>{siteTitle}</title>
      </Head>
      <section className={utilStyles.headingMd}>
        <p> This is a Gym Web App</p>
        <p>
          <Link href="login">Go to Login</Link>
        </p>
      </section>
    </Layout>
  );
}


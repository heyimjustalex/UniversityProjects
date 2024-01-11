import Head from "next/head";
import styles from "./Layout.module.css";

export default function Layout(props) {
  return (
    <div className={styles.container}>
      <Head>
        <meta name="og:title" content="Gym App" />
      </Head>
      <main>{props.children}</main>
    </div>
  );
}

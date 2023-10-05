import Head from 'next/head';
import Image from 'next/image';
import styles from './layout.module.css';
import utilStyles from '../styles/utils.module.css';

const name = 'GYM APP';
export const siteTitle = 'GYM APP WEBSITE';

export default function Layout({ children, pageType }) {
  return (
    <div className={styles.container}>
      <Head>
        <meta name="og:title" content={siteTitle} />
      </Head>
      <header className={styles.header}>
        {pageType === "home" ? (
          <>
            <Image
              priority
              src="/images/profile.jpg"
              className={utilStyles.borderCircle}
              height={144}
              width={144}
              alt=""
            />
            <h1 className={utilStyles.heading2Xl}>{name}</h1>
          </>
        )  : pageType === "login" ? (
          <>
          <Image
            priority
            src="/images/profile.jpg"
            className={utilStyles.borderCircle}
            height={70}
            width={70}
            alt=""
          />
          <h1> LOGIN </h1>
        </>
        ) : (
          <></>
        )}
      </header>
      <main>{children}</main>
    </div>
  );
}

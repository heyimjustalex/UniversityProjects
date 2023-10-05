import React, { useContext } from "react";
import Link from "next/link";
import styles from "./MainHeader.module.css";
import AuthContext from "@/store/AuthContext";

export default function MainHeader() {
  const authCTX = useContext(AuthContext);

  const isLoggedIn = !!authCTX.token;
  const hrefLink = isLoggedIn ? "" : "/login";
  const onClickLogin = isLoggedIn ? authCTX.logout : "";

  return (
    <nav className={styles.navbar}>
      <ul className={styles.navList}>
        <li className={styles.navItem}>
          <Link className={styles.navLink} href="/">
            Home
          </Link>
        </li>
        <li className={styles.navItem}>
          <Link className={styles.navLink} href="/dashboard">
            Dashboard
          </Link>
        </li>
        <li className={styles.navItem}>
          <Link className={styles.navLink} href="/workouts">
            Workouts
          </Link>
        </li>
        <li className={styles.navItem}>
          <Link
            className={styles.navLink}
            href={hrefLink}
            onClick={onClickLogin}
          >
            {isLoggedIn ? "Logout" : "Login"}
          </Link>
        </li>
      </ul>
    </nav>
  );
}

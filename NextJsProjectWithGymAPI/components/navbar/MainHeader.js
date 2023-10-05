import Link from "next/link";
import styles from "./MainHeader.module.css";
import { cookies } from "next/headers";
import LoginButton from "../login/LoginButton";

export default function MainHeader() {
  const token = cookies().get("token");
  const role = cookies().get("role");

  if (typeof window !== "undefined") {
    console.log("Client side Navbar");
  } else {
    console.log("Server side navbar");
  }

  return (
    <nav className={styles.navbar}>
      <ul className={styles.navList}>
        <li className={styles.navItem}>
          <Link className={styles.navLink} href="/">
            Home
          </Link>
        </li>

        {token?.value && role?.value !== "Client" && (
          <li className={styles.navItem}>
            <Link className={styles.navLink} href="/dashboard">
              Dashboard
            </Link>
          </li>
        )}
        {role?.value !== "Manager" && token?.value && (
          <li className={styles.navItem}>
            <Link className={styles.navLink} href="/workouts">
              Workouts
            </Link>
          </li>
        )}
        {role?.value === "PersonalTrainer" && token?.value && (
          <li className={styles.navItem}>
            <Link className={styles.navLink} href={"/clients"}>
              Clients
            </Link>
          </li>
        )}
        <li className={styles.navItem}>
          <Link className={styles.navLink} href={token?.value ? "" : "/login"}>
            <LoginButton
              title={token?.value ? "Logout" : "Login"}
              isLogout={token?.value ? true : false}
            />
          </Link>
        </li>
      </ul>
    </nav>
  );
}

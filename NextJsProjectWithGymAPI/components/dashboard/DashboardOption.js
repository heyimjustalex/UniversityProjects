import styles from "./DashboardOption.module.css";
import Link from "next/link";
export default function DashboardOption(props) {
  return (
    <Link href={props.href || ""}>
      <div className={styles.container}>
        <h3 className={styles.h3}>{props.title}</h3>
      </div>
    </Link>
  );
}

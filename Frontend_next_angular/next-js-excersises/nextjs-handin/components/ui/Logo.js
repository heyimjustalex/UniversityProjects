import Image from "next/image";
import styles from "./Utils.module.css";
export default function Logo(props) {
  return (
    <Image
      priority
      src={props.src}
      className={styles.borderCircle}
      height={70}
      width={70}
      alt="Logo"
    />
  );
}

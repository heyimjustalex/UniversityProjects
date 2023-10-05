import styles from "./SuccessMessage.module.css";

export default function SuccessMessage(props) {
  return (
    <div className={styles.container}>
      <p className={styles.paragraph}>{props.message}</p>
    </div>
  );
}

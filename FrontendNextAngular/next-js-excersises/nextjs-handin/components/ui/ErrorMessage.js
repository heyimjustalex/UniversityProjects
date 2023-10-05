import styles from "./ErrorMessage.module.css";

export default function ErrorMessage(props) {
  return (
    <div className={styles.errorContainer}>
      <p className={styles.errorParagraph}>{props.message}</p>
    </div>
  );
}

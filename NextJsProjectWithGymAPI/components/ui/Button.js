import styles from "./Button.module.css";

export default function Button(props) {
  const colorClass = props.color == "red" ? styles.red : styles.blue;

  return (
    <button
      onClick={props.onClick ? props.onClick : null}
      disabled={props.disabled}
      type="submit"
      className={styles.button + " " + colorClass}
    >
      {props.title}
    </button>
  );
}

import styles from "./ClientItem.module.css";

export default function ClientItem(props) {
  const { userId, firstName, lastName, email } = props.client;

  return (
    <div className={styles.container} onClick={props.onClick}>
      <h2>Client ID: {userId}</h2>
      <p className={styles.p}>First name: {firstName}</p>
      <p className={styles.p}>Last name: {lastName}</p>
      <p className={styles.p}>Email: {email}</p>
    </div>
  );
}

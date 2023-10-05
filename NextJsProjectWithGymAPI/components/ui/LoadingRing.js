import styles from "./LoadingRing.module.css";

const LoadingRing = () => {
  return (
    <div className={styles.container}>
      <div className={styles["lds-dual-ring"]}></div>
    </div>
  );
};

export default LoadingRing;

import Layout from "@/components/ui/Layout";
import Link from "next/link";
import styles from "../components/ui/Utils.module.css";
import { getMotivationalQuoteAPI } from "@/lib/api";

export default function HomePage(props) {
  return (
    <Layout>
      <section className={styles.headingMd}>
        <h1>Gym Web App</h1>

        <br />
        <br />
        <h2>Motivational quote for today:</h2>
        <br />
        <h3>
          <i>{'"' + props.quote + '"'}</i>
        </h3>
        <br />
        <h5>
          <i>- {props.author}</i>
        </h5>
      </section>
      <section>
        <p></p>
      </section>
    </Layout>
  );
}

export async function getServerSideProps() {
  const { getData } = getMotivationalQuoteAPI();
  let fetchingError = null;
  let result = null;

  try {
    result = await getData();
    console.log("RESULT", result);
  } catch (error) {
    console.error("Quote fetching failed:", error.message);
    fetchingError = error.message;
  }



  return {
    props: {
      quote:
        quote ||
        "If a man knows not to which port he sails, no wind is favorable",
      author: author || "Seneca",
      error: fetchingError,
    },
  };
}

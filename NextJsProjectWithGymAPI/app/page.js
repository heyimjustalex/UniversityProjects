import Layout from "@/components/ui/Layout";
import styles from "./page.module.css";

const getMotivationalQuote = async () => {
  const QUOTES_API_URL = "https://zenquotes.io/api/random/confidence";
  try {
    const response = await fetch(QUOTES_API_URL, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
    });
    return response;
  } catch (error) {}
};

export default async function HomePage() {
  if (typeof window !== "undefined") {
    console.log("Client side HomePage");
  } else {
    console.log("Server side HomePage");
  }

  const response = await getMotivationalQuote();

  let outputQuote = "Tall oaks grow from little acorns.";
  let outputAuthor = "Andrew Carnegie";
  if (response?.ok) {
    const result = await response.json();
    const { q: quote, a: author } = result?.[0] || {};
    outputQuote = quote;
    outputAuthor = author;
  }

  return (
    <Layout>
      <section className={styles.headingMd}>
        <h1>Hire me!</h1>
        {outputAuthor !== "" && outputQuote !== "" && (
          <>
            <br />
            <br />
            <h2>ASR interview new version</h2>
            <br />
            <br />
            <br />
            <br />
            <h3>
              <i>{'"' + outputQuote + '"'}</i>
            </h3>
            <br />
            <h5>
              <i>- {outputAuthor}</i>
            </h5>
          </>
        )}
      </section>
      <section>
        <p></p>
      </section>
    </Layout>
  );
}

// META TAGS

import Head from "next/head";

const YourPage = () => {
  return (
    <div>
      <Head>
        {/* Meta tags */}
        <title>Your Page Title</title>
        <meta name="description" content="Your page description" />
        <meta name="keywords" content="keyword1, keyword2" />
        <meta name="author" content="Your Name" />
        {/* Other meta tags as needed */}
      </Head>

      {/* Your page content goes here */}
      <div>
        <h1>Your Page Content</h1>
        {/* ... */}
      </div>
    </div>
  );
};

export default YourPage;

// GENERATING SITEMAP (fetching endpoints info from external backend)

// pages/sitemap.xml.js

const generateSitemapXml = (pages) => {
  const baseUrl = "https://yourwebsite.com"; // Replace with your actual website URL
  const pagesXml = pages
    .map((page) => `<url><loc>${baseUrl}${page}</loc></url>`)
    .join("");

  return `<?xml version="1.0" encoding="UTF-8"?>
      <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
        ${pagesXml}
      </urlset>`;
};

const Sitemap = () => {
  return null; // The component is not rendered; it's just for server-side logic
};

export const getServerSideProps = async ({ res }) => {
  try {
    // Fetch sitemap data from an external API
    const response = await fetch("https://example.com/api/sitemap");
    const data = await response.json();

    // Generate the sitemap XML using the data from the API
    const sitemapXml = generateSitemapXml(data.pages);

    res.setHeader("Content-Type", "text/xml");

    // Save XML
    res.write(sitemapXml);
    res.end();

    return {
      props: {},
    };
  } catch (error) {
    console.error("Error fetching or generating sitemap:", error);

    res.statusCode = 500;

    return {
      props: {},
    };
  }
};

export default Sitemap;

// HREF AND PASSHREF(forces the Next. js Link component to send the href prop to its child.) AND CANONICAL

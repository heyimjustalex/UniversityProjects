import { AuthContextProvider } from "@/store/AuthContext";
import "../globals.css";
import MainHeader from "@/components/navbar/MainHeader";

function MyApp({ Component, pageProps }) {
  return (
    <AuthContextProvider>
      <MainHeader />
      <Component {...pageProps} />
    </AuthContextProvider>
  );
}

export default MyApp;

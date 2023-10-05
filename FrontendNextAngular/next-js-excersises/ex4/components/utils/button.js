import Link from "next/link";
import classes from "./button.module.css";
export default function Button(props) {
  if (props.link) {
    return (
      <Link className={classes.btn} href={props.link}>
        {props.children}
      </Link>
    );
  } else {
    return (
      <button onClick={props.onClick} className={props.className}>
        {props.children}
      </button>
    );
  }
}

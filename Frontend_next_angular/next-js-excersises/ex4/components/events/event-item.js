import classes from "./event-item.module.css";
import Button from "../utils/button";
import DateIcon from "../icons/date-icon";
import AddressIcon from "../icons/address-icon";
import ArrowRightIcon from "../icons/arrow-right-icon";

export default function EventItem(props) {
  const { title, image, date, location, id } = props;
  const humanReadableDate = new Date(date).toLocaleDateString("en-US", {
    day: "numeric",
    month: "long",
    year: "numeric",
  });

  const formattedAddress = location.replace(",", "\n");
  const exploreLink = `/events/${id}`;
  return (
    <li className={classes.item}>
      <img src={"/" + image} alt="" />
      <div>
        <div>
          <h2>{title}</h2>
          <div>
            <DateIcon className={classes.icon} />
            <time>{humanReadableDate}</time>
          </div>
          <div>
            <AddressIcon className={classes.icon} />
            <address>{formattedAddress}</address>
          </div>
        </div>
        <div className={classes.actions}>
          <Button link={exploreLink}>
            <span>Link</span>
            <span>
              <ArrowRightIcon className={classes.icon} />
            </span>
          </Button>
        </div>
      </div>
    </li>
  );
}

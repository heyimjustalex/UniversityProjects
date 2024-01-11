import EventItem from "./event-item";
import classes from "./event-list.module.css";
function EventList(props) {
  const { items } = props;

  return (
    <ul className={classes.list}>
      {items.map((element) => (
        <EventItem
          key={element.id}
          id={element.id}
          title={element.title}
          location={element.location}
          date={element.date}
          image={element.image}
        />
      ))}
    </ul>
  );
}

export default EventList;

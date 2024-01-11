import { useRouter } from "next/router";
import { getEventById } from "../../dummy-data";
import { Fragment } from "react";

import EventSummary from "../../components/events/event-detail/event-summary";
import EventContent from "../../components/events/event-detail/event-content";
import EventLogistics from "../../components/events/event-detail/event-logistics";

export default function Event() {
  const router = useRouter();

  const id = router.query.id;
  const data = getEventById(id);

  console.log(data);
  if (!data) {
    return <p>Event not found</p>;
  }
  return (
    <Fragment>
      <EventSummary title={data.title} />
      <EventLogistics
        date={data.date}
        address={data.location}
        image={data.image}
        imageAlt={data.title}
      />
      <EventContent>
        <p>{data.description}</p>
      </EventContent>
    </Fragment>
  );
}

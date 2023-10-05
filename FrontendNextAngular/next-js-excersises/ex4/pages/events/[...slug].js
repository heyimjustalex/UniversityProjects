import { useRouter } from "next/router";
import { getFilteredEvents } from "../../dummy-data";
import EventList from "../../components/events/event-list";

export default function FiteredEventsPage() {
  const router = useRouter();

  const filteredData = router.query.slug;

  if (!filteredData) {
    return <p className="center">Loading...</p>;
  } else {
    console.log(filteredData);
    const year = filteredData[0];
    const month = filteredData[1];

    const numYear = +year;
    const numMonth = +month;

    if (
      isNaN(numMonth) ||
      isNaN(numMonth) ||
      numYear > 2099 ||
      numMonth > 12 ||
      numMonth < 1 ||
      numYear < 2020
    ) {
      return <p className="center">Invalid filter</p>;
    }

    const finalEvents = getFilteredEvents({ year: numYear, month: numMonth });
    console.log(finalEvents);
    if (!finalEvents || finalEvents.length == 0) {
      console.log("IN");
      return <h1 className="center">No events found</h1>;
    }

    return (
      <div>
        <EventList items={finalEvents}></EventList>
      </div>
    );
  }
}

import { useRouter } from "next/router";
import EventList from "../../components/events/event-list";
import EventsSearch from "../../components/events/events-search";
import {
  getAllEvents,
  getFeaturedEvents,
  getFilteredEvents,
} from "../../dummy-data";
import { useRef } from "react";

export default function Events() {
  const events = getAllEvents();
  const router = useRouter();

  function onSearchHandler(year, month) {
    router.push(`/events/${year}/${month}`);
  }

  return (
    <div>
      <EventsSearch onSearch={onSearchHandler}></EventsSearch>
      <EventList items={events}></EventList>
    </div>
  );
}

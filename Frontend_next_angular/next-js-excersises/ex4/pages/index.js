import EventList from "../components/events/event-list";
import { getFeaturedEvents } from "../dummy-data";

export default function Home() {
  const featureEvents = getFeaturedEvents();
  console.log(featureEvents);
  return (
    <div>
      <h1>test</h1>
      <EventList items={featureEvents}></EventList>
    </div>
  );
}

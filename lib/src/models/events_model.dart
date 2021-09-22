Map<DateTime, List<Event>> eventsModelToMap(EventsModel data) => data.toJson();

class EventsModel {
  final DateTime eventDate;
  final List<Event> event;

  EventsModel({this.eventDate, this.event});

  factory EventsModel.initial() {
    return EventsModel(
      eventDate: DateTime.now(),
      event: [],
    );
  }

  Map<DateTime, List<Event>> toJson() => {eventDate: event};
}

class Event {
  final String eventTitle;
  final DateTime eventStartTime;
  final DateTime eventEndTime;

  Event({this.eventTitle, this.eventStartTime, this.eventEndTime});

  factory Event.initial() {
    return Event(
      eventTitle: '',
      eventStartTime: DateTime.now(),
      eventEndTime: DateTime.now(),
    );
  }
}

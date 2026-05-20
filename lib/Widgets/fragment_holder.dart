import 'package:flutter/material.dart';
import 'lisiting.dart';
import 'add_event.dart';
import 'event.dart';
import 'edit_event.dart';
import 'eventDetail.dart';

class FragmentHolder extends StatefulWidget {
  const FragmentHolder({super.key});

  @override
  State<FragmentHolder> createState() => _FragmentHolderState();
}

class _FragmentHolderState extends State<FragmentHolder> {
  List<Event> events = [
    Event(
      name: "Tech Symposium",
      date: "2024-07-15",
      img: "assets/music.jpg",
      time: "10:00 AM",
      college: "BVM",
      venue: "Main Hall",
      description: "Annual technology symposium",
      department: "Computer Science",
      registrationLink: "https://example.com/tech-symposium",
      category: "Technology",
      contact: "contact@techsymposium.com",
      isOnline: false,
      meetingLink: "https://example.com/tech-symposium-meeting",
    ),
    Event(
      name: "Cultural Fest",
      date: "2024-08-20",
      img: "assets/music.jpg",
      time: "5:00 PM",
      college: "GCET",
      venue: "Auditorium",
      description: "Annual cultural festival",
      department: "Arts",
      registrationLink: "https://example.com/cultural-fest",
      category: "Cultural",
      contact: "contact@culturalfest.com",
      isOnline: false,
      meetingLink: "https://example.com/cultural-fest-meeting",
    ),
    Event(
      name: "Sports Meet",
      date: "2024-09-10",
      img: "assets/music.jpg",
      time: "8:00 AM",
      college: "ADIT",
      venue: "Sports Ground",
      description: "Annual sports meet",
      department: "Physical Education",
      registrationLink: "https://example.com/sports-meet",
      category: "Sports",
      contact: "contact@sportsmeet.com",
      isOnline: false,
      meetingLink: "https://example.com/sports-meet-meeting",
    ),
    Event(
      name: "Art Exhibition",
      date: "2024-10-05",
      img: "assets/music.jpg",
      time: "11:00 AM",
      college: "BBIT",
      venue: "Art Gallery",
      description: "Annual art exhibition",
      department: "Fine Arts",
      registrationLink: "https://example.com/art-exhibition",
      category: "Cultural",
      contact: "contact@artexhibition.com",
      isOnline: false,
      meetingLink: "https://example.com/art-exhibition-meeting",
    ),
    Event(
      name: "Music Concert",
      date: "2024-11-25",
      img: "assets/music.jpg",
      time: "7:00 PM",
      college: "DDU",
      venue: "Concert Hall",
      description: "Annual music concert",
      department: "Music",
      registrationLink: "https://example.com/music-concert",
      category: "Cultural",
      contact: "contact@musicconcert.com",
      isOnline: false,
      meetingLink: "https://example.com/music-concert-meeting",
    ),
  ];
  void addEvent(Event event) {
    setState(() {
      events.add(event);
    });
  }

  void editEvent(int index, Event updatedEvent) {
    setState(() {
      events[index] = updatedEvent;
    });
  }

  void deleteEvent(int index) {
    setState(() {
      events.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Navigator(
              initialRoute: '/',
              onGenerateRoute: (RouteSettings settings) {
                WidgetBuilder builder;
                switch (settings.name) {
                  case '/':
                  case '/home':
                    builder = (BuildContext context) =>
                        HomeScreen(events: events, deleteEvent: deleteEvent);
                    break;
                  case '/add':
                    builder = (BuildContext context) =>
                        AddEvent(addEvent: addEvent);
                    break;
                  case '/edit':
                    final args = settings.arguments as Map<String, dynamic>;
                    final event = args['event'] as Event;
                    final index = args['index'] as int;
                    builder = (BuildContext context) => EditEvent(
                      event: event,
                      index: index,
                      editEvent: editEvent,
                    );
                    break;
                  case '/event':
                    builder = (BuildContext context) =>
                        Eventdetail(event: settings.arguments as Event);
                    break;
                  default:
                    builder = (BuildContext context) =>
                        HomeScreen(events: events, deleteEvent: deleteEvent);
                }
                return MaterialPageRoute(builder: builder, settings: settings);
              },
            ),
          ),
        ],
      ),
    );
  }
}

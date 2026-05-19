import 'package:flutter/material.dart';
import 'lisiting.dart';
import 'event.dart';

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
      location: "BVM",
    ),
    Event(
      name: "Cultural Fest",
      date: "2024-08-20",
      img: "assets/music.jpg",
      time: "5:00 PM",
      location: "GCET",
    ),
    Event(
      name: "Sports Meet",
      date: "2024-09-10",
      img: "assets/music.jpg",
      time: "8:00 AM",
      location: "ADIT",
    ),
    Event(
      name: "Art Exhibition",
      date: "2024-10-05",
      img: "assets/music.jpg",
      time: "11:00 AM",
      location: "BBIT",
    ),
    Event(
      name: "Music Concert",
      date: "2024-11-25",
      img: "assets/music.jpg",
      time: "7:00 PM",
      location: "DDU",
    ),
  ];

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
                    builder = (BuildContext context) =>HomeScreen(events: events); 
                    break;
                  default:
                    builder = (BuildContext context) =>
                        HomeScreen(events: events);
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

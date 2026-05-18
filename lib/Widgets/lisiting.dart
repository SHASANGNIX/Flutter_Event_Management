import 'package:flutter/material.dart';

class Event {
  String name;
  String date;
  dynamic img;
  String time;
  String location;
  Event({
    required this.name,
    required this.date,
    required this.img,
    required this.time,
    required this.location,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    List<Widget> eventCards = events
        .map(
          (e) => Container(
            width: w * 0.9,
            height: h * 0.3,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    e.img,
                    height: h * 0.18,
                    width: w * 0.9 ,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                        e.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      ],
                      ),
                      SizedBox(height: 5),
                      Row(children: [
                        Icon(Icons.calendar_today, size: 16, color: Colors.white70),
                        SizedBox(width: 5),
                        Text(
                        e.date,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      Text(" |" , style: TextStyle(color: Colors.white70,fontSize: 16,)),
                      SizedBox(width: 5),
                      Icon(Icons.access_time, size: 16, color: Colors.white70),
                      SizedBox(width: 5),
                      Text( 
                        e.time,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      ],
                      ),
                      SizedBox(height: 5),
                      Row(children: [
                        Icon(Icons.location_on, size: 16, color: const Color.fromARGB(179, 255, 0, 0)),
                        SizedBox(width: 5),
                      Text(
                        e.location,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                    ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF6A11FF), Color(0xFF3D0B87), Color(0xFF0F0F0F)],
            ),
          ),
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: h * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 60,
                      child: Image.asset(
                        "assets/logo2.png",
                        height: 0.05 * h,
                        width: 0.1 * w,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "+",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.01),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 0.05 * h,
                      width: 0.75 * w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search for events",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      height: 0.05 * h,
                      width: 0.15 * w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.filter_list, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: w * 0.35,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "Upcoming Events",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) { 
                      return eventCards[index];
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

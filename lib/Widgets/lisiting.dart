import 'package:flutter/material.dart';
import 'event.dart';

class HomeScreen extends StatefulWidget {
  final List<Event> events;

  const HomeScreen({super.key, required this.events});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    List<Widget> eventCards = widget.events
        .map(
          (e) => InkWell(
            onTap: () => Navigator.pushNamed(context, '/event', arguments: e),
            child: Container(
              width: w * 0.9,
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

                    child: AspectRatio(
                      aspectRatio: 16 / 9,

                      child: Image.asset(e.img, fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              e.name,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit, color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: const Color.fromARGB(179, 255, 0, 0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 16,
                              color: Colors.white70,
                            ),
                            SizedBox(width: 5),
                            Text(
                              e.date,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              " |",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.access_time,
                              size: 16,
                              color: Colors.white70,
                            ),
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
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: const Color.fromARGB(179, 255, 0, 0),
                            ),
                            SizedBox(width: 5),
                            Text(
                              e.college,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              " |",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.business,
                              size: 16,
                              color: Colors.white70,
                            ),
                            SizedBox(width: 5),
                            Text(
                              e.department,
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
                        child: TextButton(
                          onPressed: () => Navigator.pushNamed(context, '/add'),
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
                    itemCount: widget.events.length,
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'event.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key, required this.addEvent});

  final Function(Event) addEvent;
  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController registrationController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController meetingController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  String date = "";
  String time = "";
  bool isOnline = false;

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        date = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void resetForm() {
    nameController.clear();
    venueController.clear();
    descriptionController.clear();
    departmentController.clear();
    collegeController.clear();
    registrationController.clear();
    contactController.clear();
    meetingController.clear();
    timeController.clear();
    categoryController.clear();
    setState(() {
      date = "";
      isOnline = false;
    });
  }

  Widget CustomField(
    String label,
    TextEditingController controller,
    dynamic icon,
  ) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: TextFormField(
        controller: controller,
        style: GoogleFonts.montserrat(color: Colors.black),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: GoogleFonts.montserrat(color: Colors.black, fontSize: 20),
          prefixIcon: icon != null ? Icon(icon, color: Colors.black) : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF5F2CFF), width: 3),
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    venueController.dispose();
    descriptionController.dispose();
    departmentController.dispose();
    collegeController.dispose();
    registrationController.dispose();
    contactController.dispose();
    meetingController.dispose();
    timeController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [Color(0xFF6A11FF), Color(0xFF3D0B87), Color(0xFF0F0F0F)],
          // ),
        ),

        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF5F2CFF), Color(0xFF3D0B87)],
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black54,
                    offset: Offset(2, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Add New Event",
                        style: GoogleFonts.montserrat(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Event Details",
                            style: GoogleFonts.montserrat(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Event Name:",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Colors.black,
                          ),
                        ),
                        CustomField("Event Name", nameController, Icons.event),
                        SizedBox(height: 10),
                        Text(
                          "Date:",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Colors.black,
                          ),
                        ),
                        InkWell(
                          onTap: pickDate,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: Text(
                              date == "" ? " Select Date" : date,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Time:",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Colors.black,
                          ),
                        ),
                        CustomField("Time", timeController, Icons.access_time),
                        SizedBox(height: 10),
                        Text(
                          "Venue:",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Colors.black,
                          ),
                        ),
                        CustomField(
                          "Venue",
                          venueController,
                          Icons.location_on,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Description:",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.all(0),
                          child: TextFormField(
                            controller: descriptionController,
                            style: GoogleFonts.montserrat(color: Colors.black),
                            maxLines: 5,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                  left: 0,
                                  top: 0,
                                  right: 8,
                                  bottom: 90,
                                ),
                                child: Icon(
                                  Icons.description,
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "Description",
                              hintStyle: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 20,
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xFF5F2CFF),
                                  width: 3,
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Department:",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Colors.black,
                          ),
                        ),
                        CustomField(
                          "Department",
                          departmentController,
                          Icons.business,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "College:",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Colors.black,
                          ),
                        ),
                        CustomField("College", collegeController, Icons.school),
                        SizedBox(height: 10),
                        Text(
                          "Category:",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Colors.black,
                          ),
                        ),
                        CustomField(
                          "Category",
                          categoryController,
                          Icons.label,
                        ),
                        SwitchListTile(
                          value: isOnline,
                          title: Text(
                            "Online Event",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              color: Colors.black,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              isOnline = value;
                            });
                          },
                        ),
                        if (isOnline)
                          CustomField(
                            "Meeting Link",
                            meetingController,
                            Icons.videocam,
                          ),

                        SizedBox(height: 10),
                        Text(
                          "Registration link:",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Colors.black,
                          ),
                        ),
                        CustomField(
                          "Registration Link",
                          registrationController,
                          Icons.link,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Contact Details:",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Colors.black,
                          ),
                        ),
                        CustomField(
                          "Contact Details",
                          contactController,
                          Icons.person,
                        ),

                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                Event newevent = Event(
                                  name: nameController.text,
                                  date: date,
                                  time: timeController.text,
                                  venue: venueController.text,
                                  description: descriptionController.text,
                                  department: departmentController.text,
                                  college: collegeController.text,
                                  category: categoryController.text,
                                  isOnline: isOnline,
                                  meetingLink: meetingController.text,
                                  registrationLink: registrationController.text,
                                  contact: contactController.text,
                                  img: 'assets/music.jpg',
                                );
                                widget.addEvent(newevent);
                                Navigator.pop(context);
                              },
                              
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(150, 40),
                                backgroundColor: Color(0xFF5F2CFF),
                              ),
                              child: Text(
                                "Add Event",
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            OutlinedButton(
                              onPressed: resetForm,
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(150, 40),
                                backgroundColor: Colors.white,
                                side: BorderSide(color: Colors.grey, width: 2),
                              ),
                              child: Text(
                                "Reset",
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'event.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({
    super.key,
    required this.editEvent,
    required this.event,
    required this.index,
  });

  final Function(int, Event) editEvent;
  final Event event;
  final int index;
  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
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

  @override
  void initState() {
    super.initState();
    nameController.text = widget.event.name;
    venueController.text = widget.event.venue;
    departmentController.text = widget.event.department;
    descriptionController.text = widget.event.description;
    collegeController.text = widget.event.college;
    registrationController.text = widget.event.registrationLink;
    date = widget.event.date;
    isOnline = widget.event.isOnline;
    contactController.text = widget.event.contact;
    meetingController.text = widget.event.meetingLink;
    timeController.text = widget.event.time;
    categoryController.text = widget.event.category;
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
            borderSide: BorderSide(color: Colors.grey, width: 2),
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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF6A11FF), Color(0xFF3D0B87), Color(0xFF0F0F0F)],
            ),
          ),

          child: Padding(
            padding: EdgeInsets.all(2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: h * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Edit Event",
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                  ],
                ),
                SizedBox(height: h * 0.02),
                Container(
                  margin: EdgeInsets.all(10),
                  height: h * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/music.jpg'),
                      fit: BoxFit.cover,
                    ),
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
                            Text(
                              "Event Name:",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                                color: Colors.white,
                              ),
                            ),
                            CustomField(
                              "Event Name",
                              nameController,
                              Icons.event,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Date:",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                                color: Colors.white,
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
                                color: Colors.white,
                              ),
                            ),
                            CustomField(
                              "Time",
                              timeController,
                              Icons.access_time,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Venue:",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                                color: Colors.white,
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
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsGeometry.all(0),
                              child: TextFormField(
                                controller: descriptionController,
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                ),
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
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
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
                                color: Colors.white,
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
                                color: Colors.white,
                              ),
                            ),
                            CustomField(
                              "College",
                              collegeController,
                              Icons.school,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Category:",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                                color: Colors.white,
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
                                  color: Colors.white,
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
                                color: Colors.white,
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
                                color: Colors.white,
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
                                    Event editevent = Event(
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
                                      registrationLink:
                                          registrationController.text,
                                      contact: contactController.text,
                                      img: 'assets/music.jpg',
                                    );
                                    widget.editEvent(widget.index, editevent);
                                    Navigator.pop(context);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: Size(150, 40),
                                    backgroundColor: Colors.white,
                                  ),
                                  child: Text(
                                    "Save Changes",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                    ),
                                  ),
                                ),

                                OutlinedButton(
                                  onPressed: resetForm,
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: Size(150, 40),
                                    backgroundColor: Colors.white,
                                  ),
                                  child: Text(
                                    "Reset",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
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
        ),
      );
  }
}

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

  Widget CustomField(TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: TextFormField(
        controller: controller,
        style: GoogleFonts.montserrat(color: Colors.black),
        decoration: InputDecoration(
          labelStyle: GoogleFonts.montserrat(color: Colors.black, fontSize: 20),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          fillColor: Colors.grey[300],
          filled: true,
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
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,

      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
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
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Text(
                    "Add New Event",
                    style: GoogleFonts.montserrat(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
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
                          "---Event Details---",
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
                      CustomField(nameController),
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
                            color: Colors.grey[300],
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),

                          child: Text(date == "" ? "Select Date" : date),
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
                      CustomField(timeController),
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
                      CustomField(venueController),
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
                            labelStyle: GoogleFonts.montserrat(
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
                            fillColor: Colors.grey[300],
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
                          color: Colors.black,
                        ),
                      ),
                      CustomField(departmentController),
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
                      CustomField(collegeController),
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
                      CustomField(categoryController),
                      SwitchListTile(
                        value: isOnline,

                        title: Text("Online Event"),

                        onChanged: (value) {
                          setState(() {
                            isOnline = value;
                          });
                        },
                      ),

                      if (isOnline)
                          CustomField(meetingController),

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
                       CustomField(registrationController),
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
                       CustomField(contactController), 
                      
                      SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: (){
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
                            img:'assets/music.jpg',
                          );
                          widget.addEvent(newevent);
                          Navigator.pop(context);
                        }, 
                      child: Text("Add Event", style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

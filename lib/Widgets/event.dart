class Event {
  String name;
  String date;
  String time;
  String venue;
  String description;
  String department;
  String college;
  String registrationLink;
  String category;
  String contact;
  String meetingLink;
  bool isOnline;
  dynamic img;

  Event({
    required this.name,
    required this.date,
    required this.time,
    required this.venue,
    required this.description,
    required this.department,
    required this.college,
    required this.registrationLink,
    required this.category,
    required this.contact,
    required this.isOnline,
    required this.meetingLink,
    required this.img,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'time': time,
      'venue': venue,
      'description': description,
      'department': department,
      'college': college,
      'registrationLink': registrationLink,
      'category': category,
      'contact': contact,
      'isOnline': isOnline,
      'meetingLink': meetingLink,
      'img': img,
    };
  }
}

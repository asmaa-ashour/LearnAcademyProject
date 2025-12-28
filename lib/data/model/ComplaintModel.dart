// models/complaint_model.dart
class Complaint {
  int id;
  int userID;
  String type;
  String description;
  String department;
  String location;
  String status;
  List<String?>? photos;
  DateTime createdAt;

  Complaint({
    required this.id,
    required this.userID,
    required this.type,
    required this.description,
    required this.department,
    required this.location,
    required this.status,
    required this.photos,
    required this.createdAt,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      id: json['id'],
      userID: json['userID'],
      type: json['type'],
      description: json['description'],
      department: json['department'],
      location: json['location'],
      status: json['status'],
photos: (json['photos'] != null && json['photos'] is List)
    ? List<String>.from(json['photos'])
    : [],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}

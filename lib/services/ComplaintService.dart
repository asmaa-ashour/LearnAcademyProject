import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:second/core/class/cacheClass%20.dart';
import 'package:second/link_app.dart';

import '../core/constant/constant_data.dart';
import '../data/model/ComplaintModel.dart';

class ApiService {
  // استخدم IP جهازك بدل localhost
  static const String baseUrl = AppLink.serverLink;
  static Future<Complaint?> addComplaint({
    required String type,
    required String description,
    required String department,
    required String location,
    required List<String> photoPaths,
  }) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheClass.getData(key: "Token")}'
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/addComplaint'),
    );

    request.headers.addAll(headers);

    request.fields.addAll({
      'type': type,
      'description': description,
      'department': department,
      'location': location
    });

    for (String path in photoPaths) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'photos[]',
          path,
        ),
      );
    }

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    print("Response status: ${response.statusCode}");
    print("Response body: $data");

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonData = jsonDecode(data);
      // الوصول إلى مفتاح "complaint" داخل الـ JSON
      return Complaint.fromJson(jsonData['complaint']);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<List<Complaint>> getComplaints(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/getComplaintsCitizen'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheClass.getData(key: "Token")}',
      },
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      // الوصول إلى قائمة الشكاوى داخل المفتاح "complaints"
      List complaintsList = jsonData['complaints'] ?? [];
      return complaintsList.map((c) => Complaint.fromJson(c)).toList();
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      return [];
    }
  }
  
  static Future<Complaint?> updateComplaint({
  required int id,
  required String type,
  required String description,
  required String department,
  required String location,
  required List<String> photoPaths,
}) async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${CacheClass.getData(key: "Token")}',
  };

  var request = http.MultipartRequest(
    'POST', // أو PUT حسب الباك
    Uri.parse('$baseUrl/updateComplaint/$id'),
  );

  request.headers.addAll(headers);

  request.fields.addAll({
    'type': type,
    'description': description,
    'department': department,
    'location': location,
  });

  for (String path in photoPaths) {
    request.files.add(
      await http.MultipartFile.fromPath('photos[]', path),
    );
  }

  var response = await request.send();
  var data = await response.stream.bytesToString();

  print(response.statusCode);
  print(data);

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(data);
    return Complaint.fromJson(jsonData['complaint']);
  } else {
    return null;
  }
}

}

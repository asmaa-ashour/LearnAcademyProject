class ComplaintStatusModel {
  String? refNumber;
  String? status; // جديد – قيد المعالجة – منجز – مرفوض
  String? lastUpdate;

  ComplaintStatusModel({this.refNumber, this.status, this.lastUpdate});
}

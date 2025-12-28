import 'package:get/get.dart';

import '../data/model/ComplaintStatusModel.dart';



class ComplaintStatusController extends GetxController {
  var status = ComplaintStatusModel().obs;

  Future<void> fetchStatus(String refNumber) async {
    // لاحقاً: API call backend
    await Future.delayed(Duration(seconds: 1));

    status.value = ComplaintStatusModel(
      refNumber: refNumber,
      status: "قيد المعالجة",
      lastUpdate: "2025-01-01",
    );
  }
}

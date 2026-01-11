import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/class/cacheClass%20.dart';
import 'package:second/view/screen/home_page/ComplaintDetailsView%20.dart';

import '../../../controller/ComplaintController.dart';

class ComplaintsListView extends StatelessWidget {
  final ComplaintController controller = Get.put(ComplaintController());

  @override
  Widget build(BuildContext context) {
    controller.fetchComplaints(CacheClass.getData(key: "Token") ?? "");

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF003C43), Color(0xFF135D66)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.list_alt, color: Colors.white, size: 34),
                SizedBox(width: 12),
                Text(
                  "شكاوي المواطن",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // ===== List =====
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.complaints.isEmpty) {
                return const Center(
                  child: Text(
                    "لا توجد شكاوى لعرضها",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.complaints.length,
                itemBuilder: (context, index) {
                  final c = controller.complaints[index];

                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ComplaintDetailsView(complaint: c));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // العنوان + الحالة
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF003C43)
                                        .withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.report_problem,
                                    color: Color(0xFF003C43),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    c.type,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                _statusBadge(c.status),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // الوصف
                            Text(
                              c.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),

                            const SizedBox(height: 12),

                            // الموقع
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    size: 18, color: Colors.grey),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    c.location,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            // زر التفاصيل
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "عرض التفاصيل →",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey.shade700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  // ===== Badge الحالة =====
  Widget _statusBadge(String status) {
    late Color bg;
    late String label;
    switch (status) {
      case "new": // الحالة الجديدة التي أضفتها في الباك إند
        bg = Colors.orange;
        label = "قيد الانتظار";
        break;
      case "inProgress":
        bg = Colors.blue;
        label = "قيد المعالجة";
        break;
      case "completed":
        bg = Colors.green;
        label = "تم الحل";
        break;
      case "rejected": // الرفض يفضل أن يكون بلون مختلف مثل الأحمر
        bg = Colors.red;
        label = "مرفوضة";
        break;
      default:
        bg = Colors.grey;
        label = status;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: bg,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}

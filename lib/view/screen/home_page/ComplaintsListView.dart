import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/view/screen/home_page/ComplaintDetailsView%20.dart';

import '../../../controller/ComplaintController.dart';
import '../../../core/constant/constant_data.dart';

class ComplaintsListView extends StatelessWidget {
  final ComplaintController controller = Get.put(ComplaintController());

  @override
  Widget build(BuildContext context) {
    controller.fetchComplaints(Token);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title:
            const Text('شكاوي المواطن', style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFF002623),
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(() {
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
          padding: const EdgeInsets.all(12),
          itemCount: controller.complaints.length,
          itemBuilder: (context, index) {
            var c = controller.complaints[index];

            return InkWell(
              onTap: () {
                Get.to(() => ComplaintDetailsView(complaint: c));
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // عنوان الشكوى
                      Row(
                        children: [
                          const Icon(Icons.report, color: Colors.red, size: 28),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              c.type,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          _statusBadge(c.status),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // الوصف
                      Text(
                        c.description,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black87),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.blue),
                          const SizedBox(width: 5),
                          Text(
                            c.location,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black54),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // صور الشكوى إن وُجدت
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  // -------------------------------
  // ويدجت عرض حالة الشكوى كشارة (Badge)
  // -------------------------------
  Widget _statusBadge(String status) {
    Color bg;
    if (status == "pending")
      bg = Colors.orange;
    else if (status == "in_progress")
      bg = Colors.blue;
    else if (status == "resolved")
      bg = Colors.green;
    else
      bg = Colors.grey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  // -------------------------------
  // ويدجت عرض الصور
  // -------------------------------
  Widget _buildPhotos(List photos) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: photos.length,
        itemBuilder: (context, i) {
          return Container(
            width: 90,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(photos[i]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

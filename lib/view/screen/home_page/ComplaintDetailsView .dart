import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/view/screen/home_page/updatComplaint.dart';
import '../../../data/model/ComplaintModel.dart';

class ComplaintDetailsView extends StatelessWidget {
  final Complaint complaint;

  const ComplaintDetailsView({Key? key, required this.complaint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // ✅ RTL
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F6FA),
        appBar: AppBar(
          title: const Text("تفاصيل الشكوى"),
          backgroundColor: const Color(0xFF002623),
          centerTitle: true,
          actions: [
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.edit),
                label: const Text(
                  "تعديل الشكوى",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF135D66),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Get.to(() => UpdateComplaintView(complaint: complaint));
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔴 نوع الشكوى + الحالة
              Row(
                children: [
                  const Icon(Icons.report, color: Colors.red, size: 28),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      complaint.type,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _statusBadge(complaint.status),
                ],
              ),

              const SizedBox(height: 20),

              // 📍 الموقع
              _infoTile(
                icon: Icons.location_on,
                title: "الموقع",
                value: complaint.location,
              ),

              const SizedBox(height: 12),

              // 🏢 الجهة
              _infoTile(
                icon: Icons.account_balance,
                title: "الجهة المختصة",
                value: complaint.department,
              ),

              const SizedBox(height: 20),

              // 📝 الوصف
              const Text(
                "وصف الشكوى",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  complaint.description,
                  style: const TextStyle(fontSize: 16, height: 1.6),
                ),
              ),

              const SizedBox(height: 20),

              // 🖼️ الصور
              if (complaint.photos != null && complaint.photos!.isNotEmpty) ...[
                const Text(
                  "الصور المرفقة",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildPhotos(complaint.photos!.whereType<String>().toList()),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // -----------------------
  Widget _infoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Text(
            "$title:",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // -----------------------
  Widget _statusBadge(String status) {
    Color bg;
    if (status == "pending") {
      bg = Colors.orange;
    } else if (status == "in_progress") {
      bg = Colors.blue;
    } else if (status == "resolved") {
      bg = Colors.green;
    } else {
      bg = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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

  // -----------------------
  Widget _buildPhotos(List<String> photos) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: photos.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              Get.dialog(
                Dialog(
                  child: Image.network(
                    photos[i],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
            child: Container(
              width: 120,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(photos[i]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

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
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAF9), // لون خلفية هادئ
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
                    "تفاصيل الشكوى",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // كرت الحالة والنوع
                  _buildHeaderCard(),

                  const SizedBox(height: 25),

                  const Text(
                    "المعلومات الأساسية",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF002623)),
                  ),
                  const SizedBox(height: 12),

                  // كرت الموقع والجهة
                  _buildLocationDeptCard(),

                  const SizedBox(height: 25),

                  const Text(
                    "وصف الشكوى التفصيلي",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF002623)),
                  ),
                  const SizedBox(height: 12),

                  // كرت الوصف
                  _buildDescriptionCard(),

                  const SizedBox(height: 25),

                  // قسم الصور
                  if (complaint.photos != null &&
                      complaint.photos!.isNotEmpty) ...[
                    const Text(
                      "المرفقات المصورة",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF002623)),
                    ),
                    const SizedBox(height: 12),
                    _buildPhotos(
                        complaint.photos!.whereType<String>().toList()),
                  ],

                  const SizedBox(
                      height: 80), // مسافة إضافية عشان ما يغطي الزر على المحتوى
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: complaint.status == "new"
            ? FloatingActionButton.extended(
                onPressed: () {
                  Get.to(() => UpdateComplaintView(complaint: complaint));
                },
                label: const Text("تعديل الشكوى",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                icon: const Icon(Icons.edit_note_rounded),
                backgroundColor: const Color(0xFF135D66),
              )
            : null, // يختفي الزر إذا كانت الشكوى قيد المعالجة أو حُلت
      ),
    );
  }

  // --- كرت العنوان والحالة ---
  Widget _buildHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5)),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1), shape: BoxShape.circle),
            child: const Icon(Icons.gavel_rounded, color: Colors.red, size: 30),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  complaint.type,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002623)),
                ),
                const SizedBox(height: 4),
                const Text("نوع الشكوى المقدمة",
                    style: TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),
          _statusBadge(complaint.status),
        ],
      ),
    );
  }

  // --- كرت الموقع والجهة ---
  Widget _buildLocationDeptCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        children: [
          _infoRow(Icons.location_on_rounded, "الموقع", complaint.location,
              Colors.blue),
          const Divider(height: 1, indent: 60),
          _infoRow(Icons.account_balance_rounded, "الجهة المختصة",
              complaint.department, Colors.orange),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String title, String value, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 26),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
              Text(value,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  // --- كرت الوصف ---
  Widget _buildDescriptionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF135D66).withOpacity(0.1)),
      ),
      child: Text(
        complaint.description,
        style:
            const TextStyle(fontSize: 16, height: 1.8, color: Colors.black87),
      ),
    );
  }

  // --- شارات الحالة ---
  Widget _statusBadge(String status) {
    Color color;
    String text;
    switch (status) {
      case "new": // الحالة الجديدة التي أضفتها في الباك إند
        color = Colors.orange;
        text = "قيد الانتظار";
        break;
      case "inProgress":
        color = Colors.blue;
        text = "قيد المعالجة";
        break;
      case "completed":
        color = Colors.green;
        text = "تم الحل";
        break;
      case "rejected": // الرفض يفضل أن يكون بلون مختلف مثل الأحمر
        color = Colors.red;
        text = "مرفوضة";
        break;
      default:
        color = Colors.grey;
        text = status;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(text,
          style: TextStyle(
              color: color, fontSize: 13, fontWeight: FontWeight.bold)),
    );
  }

  // --- عرض الصور ---
  Widget _buildPhotos(List<String> photos) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: photos.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () => Get.dialog(Dialog(
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(photos[i], fit: BoxFit.contain)))),
            child: Container(
              width: 140,
              margin: const EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8)
                ],
                image: DecorationImage(
                    image: NetworkImage(photos[i]), fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}

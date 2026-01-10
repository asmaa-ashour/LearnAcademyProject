import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/view/widget/_FancyCard.dart';
import 'Add Complaint View.dart';
import 'ComplaintsListView.dart';

class HomePagee extends StatelessWidget {
  const HomePagee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: Column(
        children: [
          // ===== Header =====
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF003C43),
                  Color(0xFF135D66),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(
                  Icons.account_balance,
                  color: Colors.white,
                  size: 48,
                ),
                SizedBox(height: 16),
                Text(
                  "تطبيق الشكاوى الحكومية",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "قدّم شكواك وتابعها بكل سهولة وشفافية",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ===== Cards =====
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  FancyCard(
                    title: "تقديم شكوى",
                    subtitle: "إرسال شكوى جديدة للجهة المختصة",
                    icon: Icons.add_circle_rounded,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF00B4D8),
                        Color(0xFF0077B6),
                      ],
                    ),
                    onTap: () {
                      Get.to(() => AddComplaintView());
                    },
                  ),
                  const SizedBox(height: 20),
                  FancyCard(
                    title: "عرض الشكاوى",
                    subtitle: "متابعة الشكاوى السابقة وحالتها",
                    icon: Icons.fact_check_rounded,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF6A994E),
                        Color(0xFF386641),
                      ],
                    ),
                    onTap: () {
                      Get.to(() => ComplaintsListView());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

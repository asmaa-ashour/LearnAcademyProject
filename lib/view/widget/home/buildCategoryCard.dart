import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const BuildCategoryCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.deepPurple, size: 35),
          const SizedBox(height: 10),
          Text(title,
              style:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'edit_personal_profile.dart';
class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({Key? key}) : super(key: key);

  final String avatarUrl = "https://i.pravatar.cc/150?img=3";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade200],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // المحتوى
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                SizedBox(height: 20),

                buildInfoCard("Full Name", "Asmaa Ahmed"),
                buildInfoCard("Username", "asmaa123"),
                buildInfoCard("Age", "25"),
                buildInfoCard("Gender", "Female"),
                buildInfoCard("Password", "********"),

                SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ProfileEditScreen()),
                    );
                  },
                  icon: Icon(Icons.edit),
                  label: Text("Edit Profile"),
                  style: ElevatedButton.styleFrom(
                    padding:
                    EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoCard(String title, String value) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text(value, style: TextStyle(fontSize: 15)),
      ),
    );
  }
}

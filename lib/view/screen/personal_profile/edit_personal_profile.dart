import 'package:flutter/material.dart';
class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final TextEditingController fullNameController =
  TextEditingController(text: "Asmaa Ahmed");
  final TextEditingController usernameController =
  TextEditingController(text: "asmaa123");
  final TextEditingController ageController =
  TextEditingController(text: "25");
  final TextEditingController genderController =
  TextEditingController(text: "Female");
  final TextEditingController passwordController =
  TextEditingController(text: "********");

  final String avatarUrl = "https://i.pravatar.cc/150?img=3";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Colors.blue.shade400,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            SizedBox(height: 20),

            buildTextField("Full Name", fullNameController),
            buildTextField("Username", usernameController),
            buildTextField("Age", ageController,
                keyboardType: TextInputType.number),
            buildTextField("Gender", genderController),
            buildTextField("Password", passwordController, obscureText: true),

            SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                // هنا تضيف كود الحفظ
                Navigator.pop(context);
              },
              icon: Icon(Icons.save),
              label: Text("Save"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text,
        bool obscureText = false}) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

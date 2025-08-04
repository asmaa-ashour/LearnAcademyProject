import 'package:flutter/material.dart';

class buildTextField extends StatelessWidget {
  final String hint;
  final String? Function(String?)? valid;
  final TextEditingController? myController;
   buildTextField({
    super.key,
    required this.hint,
     required this.myController,
     required this.valid,
  });

  //final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //obscureText:isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white54, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white54, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16),
      controller: myController,
      validator:valid,
    );
  }
}

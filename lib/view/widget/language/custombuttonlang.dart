import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      //   () {
      //     lang = 'en';
      // //    Get.to(LoginOrSignUp());
      //   },
      child: Text(
        textbutton,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}

import 'package:flutter/material.dart';
class CustomArrow extends StatelessWidget {
  final bool isSignUpPage;
  final VoidCallback onTap;

  const CustomArrow({
    super.key,
    required this.isSignUpPage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // زر تسجيل الدخول
        GestureDetector(
          onTap: isSignUpPage ? onTap : null, // ← قابل للنقر إذا كنا في صفحة التسجيل
          child: Column(
            children: [
              Text(
                "Log In",
                style: TextStyle(
                  color: isSignUpPage ? Colors.white.withOpacity(0.7) : Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (!isSignUpPage)
                const SizedBox(height: 3),
              if (!isSignUpPage)
                const SizedBox(
                  width: 60,
                  height: 3,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        // زر التسجيل
        GestureDetector(
          onTap: !isSignUpPage ? onTap : null, // ← قابل للنقر إذا كنا في صفحة الدخول
          child: Column(
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  color: !isSignUpPage ? Colors.white.withOpacity(0.7) : Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isSignUpPage)
                const SizedBox(height: 3),
              if (isSignUpPage)
                const SizedBox(
                  width: 60,
                  height: 3,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

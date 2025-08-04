import 'package:flutter/cupertino.dart';
import '../../../core/constant/imageassets.dart';

class CustomeImageAuth extends StatelessWidget {
  final String images;
  const CustomeImageAuth({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(images),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

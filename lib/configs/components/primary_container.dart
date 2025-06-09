import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  const PrimaryContainer({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0x00000000),Color(0x00000000), Color(0xFFD6E4FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}

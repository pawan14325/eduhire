import 'package:eduhire/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/app_colors.dart';
import '../../generated/assets.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Obx(() => AnimatedOpacity(
          opacity: controller.opacity.value,
          duration: const Duration(seconds: 2),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(
              CurvedAnimation(
                parent: controller.animationController,
                curve: Curves.easeInOut,
              ),
            ),
            child: Image.asset(
              Assets.imagesIcon,
              scale: 2,
            ),
          ),
        )),
      ),
    );
  }
}

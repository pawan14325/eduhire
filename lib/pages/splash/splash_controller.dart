import 'package:eduhire/configs/routes/routes_name.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  var opacity = 0.0.obs;
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.offAllNamed(RoutesName.onboarding);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        opacity.value = 1.0;
        animationController.forward();
      });
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
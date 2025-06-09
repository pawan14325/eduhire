import 'package:eduhire/pages/membership/membership_controller.dart';
import 'package:eduhire/pages/membership/membership_ui.dart';
import 'package:eduhire/pages/profile/profile_controller.dart';
import 'package:eduhire/pages/profile/profile_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  MembershipController membershipController = Get.put(MembershipController());
  ProfileController profileController = Get.put(ProfileController());
  var selectedIndex = 0.obs;
  // Widget options for navigation
  final List<Widget> widgetOptions = <Widget>[
    MembershipUi(),
    Container(
      height: Get.height,
      width: Get.width,
      color: Colors.grey,
    ),
    ProfileUi()
  ];

  // Update the selected index
  void onItemTap(int index) {
    selectedIndex.value = index;
  }
}
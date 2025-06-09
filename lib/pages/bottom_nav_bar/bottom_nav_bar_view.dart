import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/app_colors.dart';
import 'bottom_nav_bar_controller.dart';

class BottomNavView extends StatelessWidget {
  final int initialIndex;

  BottomNavView({super.key, this.initialIndex = 0}) {
    final BottomNavController controller = Get.put(BottomNavController());
    controller.selectedIndex.value = initialIndex; // Set initial index
  }

  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Obx(() => IndexedStack(
        index: controller.selectedIndex.value,
        children: controller.widgetOptions,
      )),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          ClipRRect(
            // borderRadius: const BorderRadius.only(
            //   topLeft: Radius.circular(20),
            //   topRight: Radius.circular(20),
            // ),
            child: BottomAppBar(
              notchMargin: 8.0,
              color: AppColors.blackColor,
              child: SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(0, Icons.home, 'Home'),
                    _buildNavItem(1, Icons.search, 'Search'),
                    _buildNavItem(2, Icons.person, 'Profile'),
                  ],
                ),
              ),
            ),
          ),
          // Floating Action Button Positioned
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData iconData, String label) {
    return GestureDetector(
      onTap: () => controller.onItemTap(index),
      child: Obx(() {
        bool isSelected = controller.selectedIndex.value == index;
        return Container(
          color: Colors.black,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(iconData,
                color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

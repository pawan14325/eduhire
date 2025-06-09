import 'package:eduhire/configs/components/primary_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/app_colors.dart';
import '../../configs/components/app_bar.dart';
import '../../configs/components/primary_button.dart';
import '../../configs/utils/app_strings.dart';
import 'membership_controller.dart';

class MembershipUi extends GetView<MembershipController> {
  const MembershipUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppBar(
        title: Text(
          AppStrings.membershipTitle,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.whiteColor),
        ),
        context: context,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: AppColors.whiteColor),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: buildDrawer(context),
      body: PrimaryContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Choose Your Plan',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              // Monthly Plan
              subscriptionCard(
                context: context,
                title: 'Monthly Plan',
                price: '₹149',
                period: 'per month',
                features: [
                  'Access to all premium content',
                  'Unlimited learning resources',
                  'Priority support',
                  'Ad-free experience',
                ],
                isPopular: false,
                onTap: () {},
              ),
              // Yearly Plan
              subscriptionCard(
                context: context,
                title: 'Yearly Plan',
                price: '₹999',
                period: 'per year',
                features: [
                  'All Monthly Plan features',
                  'Save 44% compared to monthly',
                  'Early access to new content',
                  'Exclusive member events',
                ],
                isPopular: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget subscriptionCard({
    required BuildContext context,
    required String title,
    required String price,
    required String period,
    required List<String> features,
    required bool isPopular,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isPopular ? AppColors.whiteColor : Colors.grey[700]!,
          width: isPopular ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isPopular)
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
              ),
              child: Text(
                'BEST VALUE',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColors.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      price,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        period,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: isPopular
                            ? AppColors.whiteColor
                            : AppColors.whiteColor
                            .withOpacity(0.7),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          feature,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                )),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    onTap: onTap,
                    backGroundColor: isPopular
                        ? AppColors.whiteColor
                        : Colors.grey[800],
                    rippleColor: Colors.grey[700]!,
                    child: Text(
                      'Get Started',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: isPopular
                            ? AppColors.blackColor
                            : AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: Get.height*0.05,),
          Obx(() => Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (controller.userInfo.value['photoURL'] != null)
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      controller.userInfo.value['photoURL']!,
                    ),
                  ).paddingOnly(bottom: 10),
                Text(
                  controller.userInfo.value['displayName'] ?? 'User',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  controller.userInfo.value['email'] ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ).paddingAll(20).paddingSymmetric(horizontal: 20, vertical: 10),
          )),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text(
              'Home',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
            ),trailing: Icon(Icons.arrow_forward_ios,size: 18,),
            onTap: () {
              // Handle home
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title: Text(
              'Profile',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
            ),trailing: Icon(Icons.arrow_forward_ios,size: 18,),
            onTap: () {
              // Handle profile
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
            ),trailing: Icon(Icons.arrow_forward_ios,size: 18,),
            onTap: () {
              // Handle settings
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
import 'package:eduhire/configs/components/app_bar.dart';
import 'package:eduhire/configs/components/primary_button.dart';
import 'package:eduhire/configs/components/primary_container.dart';
import 'package:eduhire/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/app_colors.dart';
import '../../configs/utils/app_strings.dart';

class ProfileUi extends GetView<ProfileController> {
  const ProfileUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppBar(
        title: Text(
          AppStrings.profileTitle,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.whiteColor),
        ),
        context: context,
      ),
      body: PrimaryContainer(
        child: Column(
          children: [
            Column(
              children: [
                Obx(() => Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        if (controller.membershipController.userInfo.value['photoURL'] != null)
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              controller.membershipController.userInfo.value['photoURL']!,
                            ),
                          ).paddingOnly(bottom: 10),
                        Text(
                          controller.membershipController.userInfo.value['displayName'] ?? 'User',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          controller.membershipController.userInfo.value['email'] ?? '',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ).paddingAll(20),
                  ).paddingSymmetric(horizontal: 20, vertical: 10),
                )),
                Container(
                  height: 1,
                  width: Get.width,
                  color: Colors.white,
                ).paddingOnly(top: 15),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Container(
                    height: Get.height * 0.05,
                    width: Get.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black54),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.04,
                              ),
                              Icon(Icons.account_circle_rounded,color:Colors.grey,),
                              SizedBox(
                                width: Get.width * 0.06,
                              ),
                              Text(
                                'Account',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Transform.translate(
                              offset: const Offset(-10, 0),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 20,
                              ))
                        ],
                      ),
                    )),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                    height: Get.height * 0.05,
                    width: Get.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black54),
                    child: InkWell(
                      onTap: () {
                      },
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.04,
                              ),
                              Icon(Icons.search,color: Colors.grey),
                              SizedBox(
                                width: Get.width * 0.06,
                              ),
                              Text(
                                'Search',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Transform.translate(
                              offset: const Offset(-10, 0),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 20,
                              ))
                        ],
                      ),
                    )),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                    height: Get.height * 0.05,
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black54),
                    child: InkWell(
                      onTap: () {
                      },
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.04,
                              ),
                              Icon(Icons.settings,color: Colors.grey),
                              SizedBox(
                                width: Get.width * 0.06,
                              ),
                              Text(
                                'Settings',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Transform.translate(
                              offset: const Offset(-10, 0),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 20,
                              ))
                        ],
                      ),
                    )),
                SizedBox(
                  height: Get.height * 0.2,
                ),
              ],
            ),
            Center(
              child: PrimaryButton(
                backGroundColor: AppColors.primaryColor,
                  width: Get.width*0.4,
                  onTap: () {
                    controller.membershipController.signOut();
                  }, child: Text("Logout",style: Theme.of(context).textTheme.labelMedium,),
              ),
            )
          ],
        ).paddingOnly(left: Get.width * 0.04, right: Get.width * 0.04),
      ),
    );
  }
}


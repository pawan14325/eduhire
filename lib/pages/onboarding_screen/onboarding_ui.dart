import 'package:eduhire/configs/components/primary_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../configs/app_colors.dart';
import '../../configs/components/primary_button.dart';
import '../../configs/routes/routes_name.dart';
import '../../configs/utils/app_strings.dart';
import '../../generated/assets.dart';
import 'onboarding_controller.dart';

class OnboardingUi extends GetView<OnboardingController> {
  const OnboardingUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PrimaryContainer(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height*.2,
              ),
              Image.asset(Assets.imagesIcon,scale: 4,),
              SizedBox(
                height: Get.height*.3,
              ),
              Text(
                AppStrings.onboardingTitle,
                style: Theme.of(context).textTheme.titleLarge
              ).paddingOnly(bottom: Get.height * 0.01),
              Text(
                AppStrings.onboardingSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ).paddingOnly(bottom: Get.height * 0.04),
              Obx(() => PrimaryButton(
                onTap: controller.isLoading.value
                    ? () {}
                    : () => controller.handleGoogleSignIn(),
                child: controller.isLoading.value
                    ? SpinKitThreeBounce(
                        duration: Duration(milliseconds: 1000),
                        color: AppColors.primaryColor,
                        size: 20.0,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Assets.imagesIcGoogle, scale: 3.5)
                              .paddingOnly(right: 10),
                          Text(
                            AppStrings.onboardingGoogleButtonLabel,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: AppColors.blackColor),
                          ),
                        ],
                      ),
              )).paddingOnly(bottom: Get.height * 0.015),
              GestureDetector(
                onTap: () {},
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.onboardingLoginAccount,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: AppStrings.onboardingLogin,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ).paddingOnly(bottom: Get.height * 0.08),
            ],
          ).paddingSymmetric(horizontal: Get.width * 0.05),
      ),

    );
  }
}

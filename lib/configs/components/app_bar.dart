import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_colors.dart';

AppBar primaryAppBar({
  Color? backGroundColor,
  List<Widget>? action,
  bool? centerTitle,
  Widget? leading,
  double? leadingWidth,
  required Widget title,
  required BuildContext context,
  PreferredSizeWidget? bottom,
}) {
  final scaffoldState = Scaffold.maybeOf(context);

  // Conditionally show drawer icon if `leading` is not provided AND drawer exists
  Widget? effectiveLeading = leading ?? (
      scaffoldState?.hasDrawer == true
          ? IconButton(
        icon: const Icon(Icons.menu, color: AppColors.whiteColor),
        onPressed: () => scaffoldState?.openDrawer(),
      )
          : GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          color: Colors.transparent,
          height: 30,
          width: 40,
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.whiteColor,
            size: 22,
          ),
        ),
      )
  );

  return AppBar(
    bottom: bottom,
    toolbarHeight: 50,
    leadingWidth: leadingWidth ?? Get.width * 0.15,
    centerTitle: centerTitle ?? false,
    automaticallyImplyLeading: false,
    leading: effectiveLeading,
    title: title,
    titleTextStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(
      color: AppColors.whiteColor,
      fontSize: 20,
    ),
    surfaceTintColor: Colors.transparent,
    backgroundColor: backGroundColor ?? AppColors.blackColor,
    elevation: 0,
    actionsPadding: EdgeInsets.only(right: Get.width * 0.03),
    actions: action,
  );
}
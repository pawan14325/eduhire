import 'package:eduhire/pages/bottom_nav_bar/bottom_nav_bar_binding.dart';
import 'package:eduhire/pages/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:eduhire/pages/profile/profile_binding.dart';
import 'package:eduhire/pages/profile/profile_ui.dart';
import 'package:eduhire/pages/splash/splash_binding.dart';
import 'package:eduhire/pages/splash/splash_screen.dart';
import 'package:get/get.dart';
import '../../pages/membership/membership_binding.dart';
import '../../pages/membership/membership_ui.dart';
import '../../pages/onboarding_screen/onboarding_binding.dart';
import '../../pages/onboarding_screen/onboarding_ui.dart';
import 'routes_name.dart';

class Routes {
  static const String initialRoute = RoutesName.splash;

   static const Duration defaultDuration = Duration(milliseconds: 300);

  static final route = [
    GetPage(
      name: RoutesName.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      transitionDuration: defaultDuration,
    ),
    GetPage(
      name: RoutesName.onboarding,
      page: () => const OnboardingUi(),
      binding: OnboardingBinding(),
      transition: Transition.fadeIn,
      transitionDuration: defaultDuration,
    ),
    GetPage(
      name: RoutesName.bottomNav,
      page: () =>  BottomNavView(),
      binding: BottomNavBarBinding(),
      transition: Transition.fadeIn,
      transitionDuration: defaultDuration,
    ),
    GetPage(
      name: RoutesName.membership,
      page: () =>  MembershipUi(),
      binding: MembershipBinding(),
      transition: Transition.fadeIn,
      transitionDuration: defaultDuration,
    ),
    GetPage(
      name: RoutesName.profile,
      page: () =>  ProfileUi(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
      transitionDuration: defaultDuration,
    ),
  ];
}
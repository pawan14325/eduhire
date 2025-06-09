import 'package:get/get.dart';
import '../../services/firebase_services/firebase_auth_service.dart';

class MembershipController extends GetxController {
  final FirebaseAuthService _authService = FirebaseAuthService();
  
  final Rx<Map<String, dynamic>> userInfo = Rx<Map<String, dynamic>>({});
  
  @override
  void onInit() {
    super.onInit();
    loadUserInfo();
  }

  void loadUserInfo() {
    final info = _authService.getUserInfo();
    if (info != null) {
      userInfo.value = info;
    } else {
      // If no user is logged in, redirect to onboarding
      Get.offAllNamed('/onboarding');
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    Get.offAllNamed('/onboarding');
  }
}
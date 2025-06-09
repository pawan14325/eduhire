import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/firebase_services/firebase_auth_service.dart';
import '../../configs/routes/routes_name.dart';

class OnboardingController extends GetxController {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final RxBool isLoading = false.obs;

  Future<void> handleGoogleSignIn() async {
    try {
      isLoading.value = true;
      final UserCredential? userCredential = await _authService.signInWithGoogle();
      
      if (userCredential != null) {
        // Successfully signed in, navigate to membership page
        Get.offNamed(RoutesName.bottomNav);
      }
    } catch (e) {
      print('Error in handleGoogleSignIn: $e');
      Get.snackbar(
        'Error',
        'Failed to sign in with Google. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
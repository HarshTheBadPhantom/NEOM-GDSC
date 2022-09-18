import 'package:firebase_auth/firebase_auth.dart';
import 'package:gdsc_firebase_auth/Auth/authpage.dart';
import 'package:gdsc_firebase_auth/Home/homepage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential

    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => {
              Get.off(() => const HomePage()),
            });
  }

  Future<void> signOut() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
    googleUser?.clearAuthCache();
    Get.to(() => const AuthPage());
  }

  Future<void> delAccount() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.currentUser!.delete();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().disconnect();
      googleUser?.clearAuthCache();
    Get.to(() => const AuthPage());
    }
  }
}

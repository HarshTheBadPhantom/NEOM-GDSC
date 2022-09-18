import 'package:gdsc_firebase_auth/Auth/authcontroller.dart';
import 'package:gdsc_firebase_auth/Home/homepagecontroller.dart';
import 'package:get/get.dart';


class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<HomePageController>(HomePageController());
  }
}

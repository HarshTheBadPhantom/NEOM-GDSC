

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_firebase_auth/Auth/authcontroller.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController{
  var userName = ''.obs;
  var emailAddress = ''.obs;
  var profileUrl = ''.obs;
  var uID = ''.obs;

    final authController = Get.put(AuthController());

   void getUserDetails() {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      for (final providerProfile in user.providerData) {
        final uid = providerProfile.uid;

        final name = providerProfile.displayName;
        final email = providerProfile.email;
        final profilePhoto = providerProfile.photoURL;

        uID.value = uid.toString();
        userName.value = name.toString();
        emailAddress.value = email.toString();
        profileUrl.value = profilePhoto.toString();

        debugPrint(
            "THE USER VALUE IS:  ${userName.value} ${emailAddress.value} ${profileUrl.value}");
      }
    } else {
      debugPrint('User is not logged in ${user?.providerData}');
    }
  }
}
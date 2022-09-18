import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdsc_firebase_auth/Auth/authcontroller.dart';
import 'package:gdsc_firebase_auth/Themes/theme_service.dart';
import 'package:gdsc_firebase_auth/Themes/themes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Hero(
                tag: 'neom',
                child: Material(
                  type: MaterialType.transparency,
                  child: SvgPicture.asset(
                    'assets/images/neom.svg',
                    width: 60,
                  ),
                ),
              ),
            ),
            Hero(tag: 'neomtxt', child: Material(
              type: MaterialType.transparency,
              child: Text('Neom',
                style: Get.theme.kTitleTextStyle
                    .copyWith(color: Get.theme.btnTextCol)),
            ),),
            SvgPicture.asset('assets/images/security.svg'),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Get Started',
                  style: Get.theme.kBigTextStyle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: Text(
                  'Best privacy-focused profile app',
                  style: Get.theme.kNormalTextStyle,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: TextButton.icon(
                  onPressed: () => {controller.signInWithGoogle()},
                  style: TextButton.styleFrom(
                      fixedSize:
                          Size.fromWidth(MediaQuery.of(context).size.width),
                      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
                      primary: Get.theme.dayNight,
                      padding: const EdgeInsets.all(14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        'assets/images/g-logo.png',
                        height: 30,
                      ),
                    ),
                  ),
                  label: Text(
                    'Sign in with Google',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}

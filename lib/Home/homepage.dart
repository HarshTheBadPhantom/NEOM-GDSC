import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdsc_firebase_auth/Home/homepagecontroller.dart';
import 'package:gdsc_firebase_auth/Themes/themes.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getUserDetails();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: 'neom',
              child: Material(
                type: MaterialType.transparency,
                child: SvgPicture.asset(
                  'assets/images/neom.svg',
                  width: 30,
                ),
              ),
            ),
          ),
          Hero(
            tag: 'neomtxt',
            child: Material(
              type: MaterialType.transparency,
              child: Text('Neom',
                  style: Get.theme.kTitleTextStyle
                      .copyWith(color: Get.theme.btnTextCol)),
            ),
          ),
        ]),
        actions: [
          IconButton(
            onPressed: () => {controller.authController.signOut()},
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Text(
                'Your',
                style: Get.theme.kNormalTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Text(
                'Neom Profile',
                style: Get.theme.kBigTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Get.theme.btnTextCol.withOpacity(0.2),
                  radius: 48,
                  child: CircleAvatar(
                      foregroundImage:
                          NetworkImage(controller.profileUrl.value),
                      radius: 45,
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Center(
                child: Flexible(
                  child: Text(
                    controller.userName.value,
                    style: Get.theme.kTitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
              child: Center(
                child: Flexible(
                  child:  Text(
                      controller.emailAddress.value,
                      style: Get.theme.kSubTitleTextStyle,
                    ),
                ),
              ),
            ),
            Center(
              child: SvgPicture.asset(
                'assets/images/chill.svg',
                height: 200,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Center(
                child: Text(
                  "Your privacy is protected by Neom's powerful firewall",
                  style: Get.theme.kSubTitleTextStyle.copyWith(fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: TextButton.icon(
                onPressed: () => {controller.authController.delAccount()},
                style: TextButton.styleFrom(
                    fixedSize:
                        Size.fromWidth(MediaQuery.of(context).size.width),
                    backgroundColor: Color.fromARGB(255, 255, 236, 236),
                    primary: Color.fromARGB(255, 193, 13, 0),
                    padding: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                icon: const Icon(
                  Icons.delete_outline,
                  color: Color.fromARGB(255, 193, 16, 3),
                ),
                label: Text(
                  'Delete your account',
                  style: Get.theme.kSubTitleTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

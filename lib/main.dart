import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdsc_firebase_auth/Auth/authpage.dart';
import 'package:gdsc_firebase_auth/Home/homepage.dart';
import 'package:gdsc_firebase_auth/Themes/theme_service.dart';
import 'package:gdsc_firebase_auth/Themes/themes.dart';
import 'package:gdsc_firebase_auth/firebase_options.dart';
import 'package:gdsc_firebase_auth/getx_bindings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // MobileAds.instance.initialize();
    await GetStorage.init();
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor:
    //         Get.isDarkMode ? const Color(0xff000000) : const Color(0xffffffff),
    //     statusBarIconBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(const MyApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.circularReveal,
      transitionDuration: const Duration(milliseconds: 800),
      initialBinding: ControllerBindings(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      debugShowCheckedModeBanner: false,
      home: checkUser(),
    );
  }

  Widget checkUser() {
    return FirebaseAuth.instance.currentUser == null
        ? const AuthPage()
        : const HomePage();
  }
}

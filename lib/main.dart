import 'package:device_preview/device_preview.dart';
import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/configs/routes.dart';
import 'package:ecommerce_app/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: themeData(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

ThemeData themeData() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Color(0xff8b8b8b),
            fontSize: 18,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black)),
    //fontFamily: 'Muli',
    inputDecorationTheme: inputDecorationTheme(),
    iconTheme: const IconThemeData(),

    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: kTextColor, fontSize: 18),
        bodySmall: TextStyle(color: kTextColor, fontSize: 18),
        bodyMedium: TextStyle(color: kTextColor, fontSize: 18)),

    scaffoldBackgroundColor: Colors.white,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
      labelStyle: const TextStyle(fontSize: 22),
      hintStyle: const TextStyle(fontWeight: FontWeight.normal),
      errorStyle: const TextStyle(fontSize: 14),
      focusColor: kPrimaryColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      focusedBorder: outlineInputBorder(),
      border: outlineInputBorder(),
      enabledBorder: outlineInputBorder());
}

OutlineInputBorder outlineInputBorder() {
  return const OutlineInputBorder(
      gapPadding: 10,
      borderSide: BorderSide(color: kTextColor),
      borderRadius: BorderRadius.all(Radius.circular(28)));
}

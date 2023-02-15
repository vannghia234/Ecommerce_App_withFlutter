import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Muli',
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: kTextColor),
            bodyText2: TextStyle(color: kTextColor)),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

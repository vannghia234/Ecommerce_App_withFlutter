import 'package:ecommerce_app/screen/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce_app/screen/login_success/loginSuccess.dart';
import 'package:ecommerce_app/screen/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
};

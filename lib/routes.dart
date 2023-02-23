import 'package:ecommerce_app/screen/complete_profile/complete_profile.dart';
import 'package:ecommerce_app/screen/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce_app/screen/home/home_screen.dart';
import 'package:ecommerce_app/screen/login_success/loginSuccess.dart';
import 'package:ecommerce_app/screen/otp/otp_screen.dart';
import 'package:ecommerce_app/screen/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/screen/sign_up/signUpScreen.dart';
import 'package:ecommerce_app/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen()
};

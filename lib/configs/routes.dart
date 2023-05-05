import 'package:ecommerce_app/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/screens/complete_profile/complete_profile.dart';
import 'package:ecommerce_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/login_success/loginSuccess.dart';
import 'package:ecommerce_app/screens/otp/otp_screen.dart';
import 'package:ecommerce_app/screens/product-detail/product-detail.dart';
import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/screens/sign_up/signUpScreen.dart';
import 'package:ecommerce_app/screens/splash/splash_screen.dart';
import 'package:ecommerce_app/screens/user_profile/user_profile_screen.dart';
import 'package:flutter/material.dart';

import '../screens/pay_cart/pay_cart_screen.dart';
import '../screens/pay_history/pay_history_screen.dart';
import '../screens/user_management/user_management_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  UserProfileScreen.routeName: (context) => const UserProfileScreen(),
  UserManagementScreen.routeName: (context) => const UserManagementScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  PayCartScreen.routeName: (context) => const PayCartScreen(),
  PayHistoryScreen.routeName: (context) => const PayHistoryScreen(),
};

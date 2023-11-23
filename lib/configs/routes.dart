import 'package:ecommerce_app/screens/after-order/after-order-screen.dart';
import 'package:ecommerce_app/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/screens/complete_profile/complete_profile.dart';
import 'package:ecommerce_app/screens/favourite/favourite_screen.dart';
import 'package:ecommerce_app/screens/filter_search/filter_search_screen.dart';
import 'package:ecommerce_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/login_success/loginSuccess.dart';
import 'package:ecommerce_app/screens/method-payment/payment-method.dart';
import 'package:ecommerce_app/screens/otp/otp_screen.dart';
import 'package:ecommerce_app/screens/product-detail/product-detail.dart';
import 'package:ecommerce_app/root.dart';
import 'package:ecommerce_app/screens/search-screen/search-screen.dart';
import 'package:ecommerce_app/screens/shipping-address/form-address.dart';
import 'package:ecommerce_app/screens/shipping-address/shipping-address.dart';
import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/screens/sign_up/signUpScreen.dart';
import 'package:ecommerce_app/screens/splash/splash_screen.dart';
import 'package:ecommerce_app/screens/user_profile/user_profile_screen.dart';
import 'package:ecommerce_app/widget/result-search.dart';
import 'package:ecommerce_app/widget/search-view-btn.dart';
import 'package:flutter/material.dart';

import '../screens/change-password-screen/change-password-screen.dart';
import '../screens/pay_cart/pay_cart_screen.dart';
import '../screens/pay_history/pay_history_screen.dart';
import '../screens/user_management/user_management_screen.dart';

final Map<String, WidgetBuilder> routes = {
  RootApp.routeName: (context) => const RootApp(),
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
  PayHistoryScreen.routeName: (context) => PayHistoryScreen(),
  ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
  SearchScreen.routeName: (context) => const SearchScreen(),
  SearchViewButton.routeName: (context) => const SearchViewButton(),
  ResultSearchScreen.routeName: (context) => const ResultSearchScreen(),
  // OrderDetailsScreen.routeName: (context) => const OrderDetailsScreen(
  //       orderDetails: [],
  //     ),
  UpdatePasswordScreen.routeName: (context) => const UpdatePasswordScreen(),
  FilterSearchScreen.routeName: (context) => const FilterSearchScreen(),
  FavouriteScreen.routeName: (context) => const FavouriteScreen(),
  ThanksForBuying.routeName: (context) => ThanksForBuying(),
  ShippingAddress.routeName: (context) => const ShippingAddress(),
  FormAddress.routeName: (context) => const FormAddress(),
  PaymentMethodScreen.routeName: (context) => const PaymentMethodScreen()
};

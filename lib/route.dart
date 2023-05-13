import 'package:flutter/material.dart';
import 'package:travo_app/representation/screen/forgot_password.dart';
import 'package:travo_app/representation/screen/home_screen.dart';
import 'package:travo_app/representation/screen/intro_screen.dart';
import 'package:travo_app/representation/screen/sign_up_screen.dart';
import 'package:travo_app/representation/screen/slpash_screen.dart';
import 'package:travo_app/representation/screen/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  forgotPasswordScreen.routeName: (context) => const forgotPasswordScreen(),
  HomeScreen.routeName: (context) => const HomeScreen()
};

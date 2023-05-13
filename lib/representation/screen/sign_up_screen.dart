import 'package:flutter/material.dart';

import '../../core/constants/color_palatte.dart';
import '../../core/constants/dimension_constants.dart';
import '../../core/constants/textstyle_ext.dart';
import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';
import '../../logic/auth.dart';
import '../../logic/input_validators.dart';
import '../widgets/app_bar_container.dart';
import 'login_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  static var routeName = '/signup_screen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cnfPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Sign up',
      implementLeading: false,
      child: Form(
        child: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                prefixIcon: const Icon(Icons.person_outline_rounded),
                labelText: 'Username',
                filled: true,
                fillColor: Colors.white,
                labelStyle: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined),
                filled: true,
                fillColor: Colors.white,
                labelStyle: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                labelText: 'Password',
                prefixIcon: const Icon(Icons.phone_iphone_outlined),
                filled: true,
                fillColor: Colors.white,
                labelStyle: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            TextFormField(
              controller: cnfPassController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                labelText: 'Confirm Password',
                prefixIcon: const Icon(
                  Icons.lock,
                ),
                filled: true,
                fillColor: Colors.white,
                labelStyle: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            ElevatedButton(
              onPressed: () {
                if (InputValidator.validateField(
                        "Name", nameController.text.trim()) &&
                    InputValidator.validateField(
                        "Email", emailController.text.trim())) {
                  if (InputValidator.validatePassword(
                      passwordController.text, cnfPassController.text)) {
                    AuthController.instance.registerUser(
                        emailController.text.trim(),
                        passwordController.text.trim());
                  }
                }

                
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPalette.secondColor),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                alignment: Alignment.center,
                child: Text("Sign up",
                    style: TextStyles.defaultStyle.whiteTextColor.bold),
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 1.0,
                    color: Colors.black26, // Màu sắc của đường thẳng
                  ),
                ),
                const Text(
                  "or sign up with",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 1.0,
                    color: Colors.black26, // Màu sắc của đường thẳng
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: ImageHelper.loadFromAsset(AssetHelper.icoGG),
                  label: const Text('Google'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.fromLTRB(140, 20, 148, 20),
                      foregroundColor: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
          ],
        )

            // ignore: prefer_const_literals_to_create_immutables
            ),
      ),
    );
  }
}

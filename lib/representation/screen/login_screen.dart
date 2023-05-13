import 'package:flutter/material.dart';
import 'package:travo_app/representation/screen/sign_up_screen.dart';
import 'package:travo_app/representation/screen/forgot_password.dart';

import '../../core/constants/color_palatte.dart';
import '../../core/constants/dimension_constants.dart';
import '../../core/constants/textstyle_ext.dart';
import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';
import '../../logic/auth.dart';
import '../widgets/app_bar_container.dart';

class LoginScreen extends StatefulWidget {
  static var routeName = '/login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Log in',
      implementLeading: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            TextField(
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
                filled: true,
                fillColor: Colors.white,
                labelText: 'Email',
                labelStyle: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),

              // ... Cấu hình TextField cho tên người dùng
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            TextField(
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
                filled: true,
                fillColor: Colors.white,
                labelText: 'Password',
                labelStyle: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),

              // ... Cấu hình TextField cho mật khẩu
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Đưa đường dẫn về phía cuối phải
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(forgotPasswordScreen.routeName);
                  },
                  child: const Text(
                    'Forgot password?',
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
            ElevatedButton(
              onPressed: () {
                AuthController.instance.login(emailController.text.trim(),
                    passwordController.text.trim());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPalette.secondColor),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                alignment: Alignment.center,
                child: Text("Login",
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
                  "or login with",
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
                const Text("Don't have an account?"),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SignUpScreen.routeName);
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/color_palatte.dart';
import '../../core/constants/dimension_constants.dart';
import '../widgets/app_bar_container.dart';

// ignore: camel_case_types
class forgotPasswordScreen extends StatefulWidget {
  static var routeName = '/forgot_password_screen';

  const forgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<forgotPasswordScreen> createState() => _forgotPasswordScreenState();
}

// ignore: camel_case_types
class _forgotPasswordScreenState extends State<forgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Forgot password',
      child: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            TextField(
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
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            SizedBox(
              height: 44,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.secondColor),
                onPressed: () {
                  // Navigator.of(context).pushNamed(OTPScreen.routeName);
                },
                child: const Text("Next"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

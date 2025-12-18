import 'package:blood_donation/view/Profile_screen/personel_information.dart';
import 'package:blood_donation/view/auth%20_screens.dart/login_screen.dart';
import 'package:blood_donation/widgets/custom_text_field.dart';
import 'package:blood_donation/widgets/redContainer.dart';
import 'package:blood_donation/widgets/reusable_button.dart';
import 'package:blood_donation/widgets/reusable_email.dart';
import 'package:blood_donation/widgets/reusable_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email_controller = TextEditingController();
    TextEditingController password_controller = TextEditingController();
    TextEditingController phone_controller = TextEditingController();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [redContainer(height: height, width: width)],
            ),

            Positioned(
              left: width * 0.05,
              right: width * 0.05,
              top: height * 0.2,
              child: Container(
                height: height * 0.30,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      focusedBorderColor: Colors.red,
                      controller: email_controller,
                      hintText: 'Email',
                      prefixIcon: Icons.mail,
                    ),
                    SizedBox(height: height * 0.03),
                    CustomTextField(
                      focusedBorderColor: Colors.red,
                      controller: password_controller,
                      prefixIcon: Icons.lock,
                      hintText: 'Password',
                    ),
                    // SizedBox(height: height * 0.02),
                    // ReusableTextField(
                    //   hintText: 'Phone Number',
                    //   icon: Icons.phone,
                    //   controller: phone_controller,
                    // ),
                  ],
                ),
              ),
            ),

            // SIGN UP BUTTON
            Positioned(
              left: width * 0.05,
              right: width * 0.05,
              top: height * 0.45,
              child: InkWell(
                 onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonelInformation(),
                    ),
                  );
                },
                child: ReusableButton(label: 'Sign up'),
              ),
            ),

            Positioned(
              top: height * 0.60, //
              left: 0,
              right: 0,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

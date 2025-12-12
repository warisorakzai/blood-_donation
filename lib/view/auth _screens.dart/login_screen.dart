import 'package:blood_donation/view/auth%20_screens.dart/signup_screen.dart';
import 'package:blood_donation/widgets/redContainer.dart';
import 'package:blood_donation/widgets/reusable_button.dart';
import 'package:blood_donation/widgets/reusable_email.dart';
import 'package:blood_donation/widgets/reusable_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email_controller = TextEditingController();
    TextEditingController password_controller = TextEditingController();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
              height: height * 0.40,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ReusableTextField(
                    hintText: 'Email',
                    icon: Icons.email,
                    controller: email_controller,
                  ),
                  SizedBox(height: height * 0.03),
                  ReuseablePasswordfield(
                    hintText: 'Password',
                    prefixIcon: Icons.lock,
                    controller: password_controller,
                  ),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ),

          // SIGN UP BUTTON
          Positioned(
            left: width * 0.05,
            right: width * 0.05,
            top: height * 0.55,
            child: ReusableButton(label: 'Login'),
          ),

          Positioned(
            top: height * 0.72, //
            left: 0,
            right: 0,
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Dont have an account',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
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
                              builder: (context) => SignupScreen(),
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
    );
  }
}


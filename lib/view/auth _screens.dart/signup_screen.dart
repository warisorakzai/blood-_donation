import 'package:blood_donation/view/Profile_screen/personel_information.dart';
import 'package:blood_donation/view/auth%20_screens.dart/login_screen.dart';
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
                  ReusableTextField(
                    hintText: 'Phone Number',
                    icon: Icons.phone,
                    controller: phone_controller,
                  ),
                ],
              ),
            ),
          ),

          // SIGN UP BUTTON
          Positioned(
            left: width * 0.05,
            right: width * 0.05,
            top: height * 0.55,
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
            top: height * 0.72, //
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
    );
  }
}

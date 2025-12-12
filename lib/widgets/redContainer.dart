import 'package:flutter/material.dart';

class redContainer extends StatelessWidget {
  const redContainer({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.37,
      width: width,
      decoration: const BoxDecoration(color: Colors.red),
      child: Column(
        children: [
          SizedBox(height: height * 0.06),
          Image.asset('assets/images/water 1.png', height: height * 0.10),
          const Text(
            'Shifa Blood',
            style: TextStyle(fontSize: 23, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomStackCard extends StatelessWidget {
  final double topOffset;
  final double height;
  final Color backgroundColor;
  final Widget child;
  final double buttonTopOffset;
  final Widget? button;
  final Widget? footer;

  const CustomStackCard({
    super.key,
    required this.topOffset,
    required this.height,
    required this.backgroundColor,
    required this.child,
    this.buttonTopOffset = 0,
    this.button,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        // BACKGROUND CARD
        Positioned(
          left: width * 0.05,
          right: width * 0.05,
          top: topOffset,
          child: Container(
            height: height,
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: child,
          ),
        ),

        // BUTTON
        if (button != null)
          Positioned(
            left: width * 0.05,
            right: width * 0.05,
            top: buttonTopOffset,
            child: button!,
          ),

        // FOOTER
        if (footer != null)
          Positioned(
            left: 0,
            right: 0,
            top: buttonTopOffset + 80, // You can adjust this dynamically
            child: Center(child: footer!),
          ),
      ],
    );
  }
}

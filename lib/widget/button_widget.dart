import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.buttonText,
    required this.buttonBgColor,
    required this.buttonTextColor,
    required this.onTapped,
  });

  final String buttonText;
  final buttonBgColor;
  final buttonTextColor;
  final onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            color: buttonBgColor,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: buttonTextColor, fontSize: 15.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final double width;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onTap;

  const RoundButton({
    Key? key,
    required this.width,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: width,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 4),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(text,
        style: TextStyle(color: textColor, fontSize: 18)),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../constants.dart';


class SplashPageText extends StatelessWidget {
  final String text1;
  final String text2;
  final double fontSize;
  final String fontFamily;
  final double letterSpacing;
  final Color color;

  SplashPageText({
    @required this.fontSize,
    @required this.fontFamily,
    @required this.text2,
    @required this.text1,
    this.letterSpacing,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              fontFamily: fontFamily,
              color: kThirdColor,
              letterSpacing: letterSpacing ?? 0,
            ),
          ),
          TextSpan(
            text: text2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              fontFamily: fontFamily,
              color: color ?? kPrimaryColor,
              letterSpacing: letterSpacing ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}

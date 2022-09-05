import 'package:flutter/material.dart';
import 'package:union/util/constants/colors.dart';
class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.width = 250,
    this.margin,
    this.backgroundColor = Colors.white,
    this.textSize = 18,
    this.textColor = secundaryBlue,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;

  final double textSize;
  final Color textColor;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: textSize,
            color: textColor,
            height: 1.3,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

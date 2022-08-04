import 'package:flutter/material.dart';
import 'package:union/constants/colors.dart';
import 'package:union/ui/widgets/default/default_text.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      required this.borderRadius,
      required this.backgroundColor,
      required this.text,
      required this.textSize,
      this.textColor = white,
      this.onPressed})
      : super(key: key);

  final double borderRadius;
  final Color backgroundColor;
  final String text;
  final double textSize;
  final Color textColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor,
        ),
      ),
      child: DefaultText(
        text: text,
        size: textSize,
        color: textColor,
      ),
      onPressed: onPressed,
    );
  }
}

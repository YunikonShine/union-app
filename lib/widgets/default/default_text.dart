import 'package:flutter/material.dart';
import 'package:union/util/constants/colors.dart';

class DefaultText extends StatelessWidget {
  const DefaultText(
      {Key? key, required this.text, required this.size, this.color = Colors.white})
      : super(key: key);

  final String text;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: color,
        height: 1.3,
      ),
    );
  }
}

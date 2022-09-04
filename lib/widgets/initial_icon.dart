import 'package:flutter/material.dart';

class InitialIcon extends StatelessWidget {
  const InitialIcon({Key? key, this.mini = false, this.margin, required this.iconImage})
      : super(key: key);

  final bool mini;
  final EdgeInsetsGeometry? margin;
  final AssetImage iconImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
      width: mini ? 130.0 : 260.0,
      height: mini ? 130.0 : 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: iconImage,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

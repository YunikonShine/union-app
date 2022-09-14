import 'package:flutter/material.dart';

class PsychologistCardImage extends StatelessWidget {
  const PsychologistCardImage({Key? key, required this.image})
      : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/images/$image"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PsychologistCardName extends StatelessWidget {
  const PsychologistCardName({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      overflow: TextOverflow.fade,
      softWrap: false,
    );
  }
}

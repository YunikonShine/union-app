import 'package:flutter/material.dart';

class PsychologistCardLoginIcon extends StatelessWidget {
  const PsychologistCardLoginIcon({Key? key, required this.online})
      : super(key: key);

  final bool online;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: 12.0,
        height: 12.0,
        decoration: BoxDecoration(
          color: online ? Colors.green : Colors.red,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              150.0,
            ),
          ),
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}

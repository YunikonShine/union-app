import 'package:flutter/material.dart';
import 'package:union/util/constants/colors.dart';

class PsychologistCardMessageNumber extends StatelessWidget {
  const PsychologistCardMessageNumber({Key? key, required this.messageNumber})
      : super(key: key);

  final int messageNumber;

  @override
  Widget build(BuildContext context) {
    if (messageNumber > 0) {
      return Container(
        width: 30.0,
        height: 20.0,
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: Text(
          messageNumber > 99 ? "+99" : messageNumber.toString(),
          style: const TextStyle(
            color: secundaryBlue,
          ),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return Container();
    }
  }
}

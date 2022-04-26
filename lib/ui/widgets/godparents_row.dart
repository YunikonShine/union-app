import 'package:flutter/material.dart';

class GodParentsRow extends StatelessWidget {
  const GodParentsRow(
      {Key? key, required this.one, required this.two, required this.three})
      : super(key: key);

  final Widget one;
  final Widget two;
  final Widget three;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[one, two, three],
      ),
    );
  }
}

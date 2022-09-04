import 'package:flutter/material.dart';
import 'package:union/util/constants/colors.dart';
import 'package:union/widgets/default/default_text.dart';

class DefaultDrawerButton extends StatelessWidget {
  const DefaultDrawerButton(
      {Key? key,
      required this.text,
      this.route,
      required this.icon,
      this.onTap})
      : super(key: key);

  final String? route;
  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: GestureDetector(
        onTap: onTap ??
            () {
              if (route != null) {
                Navigator.pop(context);
                Navigator.pushNamed(context, route!);
              }
            },
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: secundaryBlue,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: Text(
                text,
                style: const TextStyle(
                  color: white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

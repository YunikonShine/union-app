import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  const DefaultContainer({Key? key, required this.childrenList})
      : super(key: key);

  final List<Widget> childrenList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
      child: Column(
        children: childrenList,
      ),
    );
  }
}

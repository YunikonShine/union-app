import 'package:flutter/material.dart';
import 'package:union/util/constants/colors.dart';

class PointedSeparator extends StatelessWidget {
  const PointedSeparator({Key? key, this.color = secundaryBlue})
      : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashCount = (boxWidth / 20).floor();
          return Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: 10,
                height: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
          );
        },
      ),
    );
  }
}

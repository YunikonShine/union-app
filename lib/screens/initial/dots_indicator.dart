import 'dart:math';

import 'package:flutter/material.dart';
import 'package:union/util/constants/colors.dart';

class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    Key? key,
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
  }) : super(key: key, listenable: controller);

  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;

  static const double _kMaxZoom = 4.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;

    if (selectedness > 0.0) {
      return SizedBox(
        width: 25.0,
        child: Center(
          child: Material(
            color: white,
            type: MaterialType.circle,
            child: SizedBox(
              width: 10.0 * zoom,
              height: 10.0 * zoom,
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: 25.0,
        child: Center(
          child: Material(
            color: white,
            type: MaterialType.circle,
            child: SizedBox(
              width: 10.0 * zoom,
              height: 10.0 * zoom,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

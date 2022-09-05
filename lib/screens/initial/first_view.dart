import 'package:flutter/material.dart';
import 'package:union/screens/initial/dots_indicator.dart';
import 'package:union/screens/initial/first_view_01.dart';
import 'package:union/screens/initial/first_view_02.dart';
import 'package:union/screens/initial/first_view_03.dart';
import 'package:union/util/constants/colors.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  void initState() {
    super.initState();
  }

  final _controller = PageController();

  static const _kDuration = Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      body: Stack(
        children: <Widget>[
          PageView(
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            children: const <Widget>[
              FirstView1(),
              FirstView2(),
              FirstView3(),
            ],
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: DotsIndicator(
                  controller: _controller,
                  itemCount: 3,
                  onPageSelected: (int page) {
                    _controller.animateToPage(
                      page,
                      duration: _kDuration,
                      curve: _kCurve,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

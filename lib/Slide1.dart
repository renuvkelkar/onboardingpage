import 'package:flutter/material.dart';
import 'dart:math' as math;

class Slide1 extends StatefulWidget {
  const Slide1({Key key}) : super(key: key);

  @override
  _Slide1State createState() => _Slide1State();
}

class _Slide1State extends State<Slide1> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 20))
          ..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              },
              // child: FlutterLogo(size: 200),
              child: Image(
                image: AssetImage("lib/asset/images/Image1.jpg"),
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20.0),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 100.0, right: 50),
                child: Container(
                  child: Text(
                      "Here is a fun way of learning about the role that microbiome play in your body",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}

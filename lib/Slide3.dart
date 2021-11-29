import 'package:flutter/material.dart';

class Slide3 extends StatefulWidget {
  const Slide3({Key key}) : super(key: key);

  @override
  _Slide3State createState() => _Slide3State();
}

class _Slide3State extends State<Slide3> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);
    _animation =
        Tween(begin: Offset.zero, end: Offset(0, 0.08)).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideTransition(
            position: _animation,
            child: Image(image: AssetImage("lib/asset/images/Image3.jpg"))),
        SizedBox(
          height: 20,
        ),
        Text("Quiz and test your knowledge",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

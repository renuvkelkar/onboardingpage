import 'package:flutter/material.dart';

class Slide2 extends StatefulWidget {
  const Slide2({Key key}) : super(key: key);

  @override
  _Slide2State createState() => _Slide2State();
}

class _Slide2State extends State<Slide2> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 100, right: 100),
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return TweenAnimationBuilder<double>(
                  // 1. add a Duration
                  duration: Duration(seconds: 60),
                  // 2. add a Tween
                  tween: Tween(begin: 500.0, end: 100.0),

                  // 3. add a child (optional)
                  child:
                      Image(image: AssetImage("lib/asset/images/Image2.jpg")),
                  // 4. add the buiilder
                  builder: (context, value, child) {
                    // 5. apply some transform to the given child
                    return Transform.translate(
                      offset: Offset(_controller.value * 500 - 100, 0),
                      child: child,
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Play and learn",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}

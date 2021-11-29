import 'package:flutter/material.dart';
import 'package:onboardingpage/Slider.dart';
import 'package:onboardingpage/Screen1.dart';

import 'Slide1.dart';
import 'Slide2.dart';
import 'Slide3.dart';

// import 'Slider.dart';

// import 'package:flutter/material.dart';
// import 'package:kc0035a_flutter_customer_app/Screen1.dart';
// import 'package:kc0035a_flutter_customer_app/data/SliderModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var slides = List<SliderModel>.empty();
  int currentIndex = 0;
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Aahaar Kranti",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Image(
            image: AssetImage("lib/asset/images/logo.jpg"),
            height: 400,
            width: 400,
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Container(
                height: 30,
                color: Colors.orange,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                color: Colors.white,
                height: 700,
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (value) {
                            setState(() {
                              currentIndex = value;
                            });
                          },
                          itemCount: slides.length,
                          itemBuilder: (context, index) {
                            // contents of slider
                            return Column(
                              children: [
                                if (index == 0)
                                  Slide1()
                                else if (index == 1)
                                  Slide2()
                                else if (index == 2)
                                  Slide3()
                                else
                                  Slide1()
                              ],
                            );
                            // return Slider(
                            //   image: slides[index].getImage(),
                            //   heading: slides[index].getHeading(),
                            // );
                          }),
                    ),
                    Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          slides.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 40,
                        width: 60,
                        margin: EdgeInsets.only(bottom: 20),
                        // width: double.infinity,
                        color: Colors.green,
                        child: TextButton(
                          child: Text(
                            currentIndex == slides.length - 1
                                ? "Continue"
                                : "Next",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (currentIndex == slides.length - 1) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Screen1()),
                              );
                            }
                            _controller.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.bounceIn);
                          },
                          // textColor: Colors.white,
                          // shape: RoundedRectangleBorder(
                          // 	borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

// container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green,
      ),
    );
  }
}

// ignore: must_be_immutable
// slider declared
// ignore: must_be_immutable
class Slider extends StatelessWidget {
  String image;
  String heading;

  Slider({this.image, this.heading});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // contains container
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // image given in slider
              Image(image: AssetImage(image)),
              SizedBox(height: 25),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 60, right: 30),
                  child: Text(
                    heading,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

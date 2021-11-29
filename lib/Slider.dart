import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Slider extends StatefulWidget {
  String image, title, description;

//Constructor created
  Slider({this.image, this.title, this.description});

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // column containing image
      // title and description
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(widget.image)),
          SizedBox(height: 20),
          Text(
            widget.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          Text(widget.description),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}

class SliderModel {
  String image;
  String heading;

// images given
  SliderModel({this.image, this.heading});

// setter for image
  void setImage(String getImage, String getHeading) {
    image = getImage;
    heading = getHeading;
  }

// getter for image
  String getImage() {
    return image;
  }

  // getter for image
  String getHeading() {
    return heading;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = new SliderModel();

// 1
  sliderModel.setImage("lib/asset/images/Image1.jpg",
      "Here is a fun way of learning about the role that microbiome play in your body");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

// 2
  sliderModel.setImage("lib/asset/images/Image2.jpg", "Play and learn");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

// 3
  sliderModel.setImage(
      "lib/asset/images/Image3.jpg", "Quiz and test your knowledge");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  return slides;
}

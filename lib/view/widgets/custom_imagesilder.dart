import 'package:carousel_slider/carousel_slider.dart';
import 'package:cis_team/style/colors.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;

  List images = [
    'assets/images/gate.jpg',
    'assets/images/chess.jpg',
    'assets/images/7 generation.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top:8),
          child: CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(images[index]), fit: BoxFit.fill))),
              options: CarouselOptions(
                initialPage: 0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true,
                autoPlayCurve: Curves.easeInOut,
                onPageChanged: (index, reason) {
                  currentIndex = index;
                  setState(() {});
                },
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              images.length,
              (index) => Container(
                  margin: const EdgeInsets.only(right: 8, top: 10),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == currentIndex
                          ? AppColors.kGreen
                          : Colors.white))),
        )
      ]),
    );
  }
}

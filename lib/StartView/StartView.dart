import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'CustomPageViewScrollPhisics.dart';
import '../FirstCircle/First_circle.dart';
class StartView extends StatefulWidget {
  const StartView({super.key, required this.title});

  final String title;

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  final List<String> _images = [
    'assets/image/jobs/lawyer.png',
    'assets/image/jobs/pilot.png',
    'assets/image/jobs/teacher.png'
  ];

  final List<String> jobs = [
    "Юрист",
    "Пилот Авиалиний",
    "Учитель",
  ];

  PageController controller = PageController(viewportFraction: 0.9, initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container (
            margin: const EdgeInsets.only(left: 30, top: 10),
            child: const Text(
              'Профессия',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: 500,
            child: PageView.builder(
              padEnds: true,
              controller: controller,
              physics: const CustomPageViewScrollPhysics(),
              itemCount: _images.length,
              itemBuilder: (_, index) => Container (
                margin: const EdgeInsets.all(9),
                decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                  image: DecorationImage (
                    image: AssetImage(_images[index]),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: Center(
              child: Center(
                child: SmoothPageIndicator (
                  controller: controller,
                  count: _images.length,
                  effect: const WormEffect(),
                  onDotClicked: (index) => controller.animateToPage (
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.decelerate
                  ),
                ),
              ),
            )
          ),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black12),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstCircle()));
              },
              child: const Text(
                'Выбрать',
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.black87
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}




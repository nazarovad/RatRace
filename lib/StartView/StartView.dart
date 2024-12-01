import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ratrace/StartView/Indicator.dart';
import 'CustomPageViewScrollPhisics.dart';

class StartView extends StatefulWidget {
  const StartView({super.key, required this.title});

  final String title;

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  final List<String> _images = [
    'assets/image/image1.png',
    'assets/image/image2.png',
    'assets/image/img.png'
  ];

  int _currentIndex = 0;

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [PageView(
          controller: controller,
          physics: const CustomPageViewScrollPhysics(),
          children: _images
              .map((image) => Image.asset(image))
              .toList(),
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // color: Colors.red,
                child: Indicator(controller, 3),
            )],
          ),
        )
        ],
      )
    );
  }
}

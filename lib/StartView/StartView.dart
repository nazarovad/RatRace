import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          physics: const BouncingScrollPhysics(),
          children: _images
              .map((image) => Image.asset(image))
              .toList(),
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 85,
            child: Opacity(
              opacity: 1,
              child: Container(
                color: Colors.blue,
                child: Row(children: <Widget>[
                  Expanded(
                    child: FlutterLogo(),
                  ),
                  Expanded(
                    child: FlutterLogo(),
                  ),
                  Expanded(
                    child: FlutterLogo(),
                  ),
                ],),
              ),
            )
          ),],
      )
    );
  }
}

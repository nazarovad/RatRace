import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'CustomPageViewScrollPhisics.dart';
import '../FirstCircle/First_circle.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

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

  final TextStyle p1 = const TextStyle(
    fontSize: 25,
  );

  PageController controller = PageController(viewportFraction: 0.9, initialPage: 0);

  int index = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
            height: 450,
            child: PageView.builder(
              padEnds: true,
              controller: controller,
              physics: const CustomPageViewScrollPhysics(),
              itemCount: _images.length,
              onPageChanged: (indexPage) {
                index = indexPage;
                print(index);
              },
              itemBuilder: (_, index) =>
              Container(
                margin: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                  // image: DecorationImage(
                  //   image: AssetImage(_images[index]),
                  //   fit: BoxFit.cover
                  // )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 20,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                              image: DecorationImage(
                                image: AssetImage(_images[index]),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Зарплата", style: p1,),
                              const Text("0123")
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Общие расходы", style: p1),
                          const Text("1232")
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Расход детей", style: p1),
                          const Text("1232")
                        ]
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Сбережения", style: p1),
                          const Text("1232")
                        ],
                      ),
                    ],
                  ),
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
            child: SwipeButton.expand(
              thumb: const Icon(
                Icons.double_arrow_rounded,
                color: Colors.white,
              ),
              child: Text(
                "Выборать",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              activeThumbColor: Colors.red,
              activeTrackColor: Colors.grey.shade300,
              onSwipe: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FirstCircle(indexProfession: index)
                  )
                );
              },
            )
          ),
        ],
      )
    );
  }
}




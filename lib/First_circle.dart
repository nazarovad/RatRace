import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FirstCircle extends StatefulWidget {


  const FirstCircle({super.key});

  @override
  State<FirstCircle> createState() => _FirstCircleState();
}

class _FirstCircleState extends State<FirstCircle> {
  double heightRightLine = 25;

  double widthRightLine = 142;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Внутренний круг')),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(20), // <= No more error here :)
              color: Colors.black,
            ),
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            height: 200,
            padding: const EdgeInsets.all(15),
            child: Row(

              children: [
                Container (
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget> [
                      Align(
                        alignment: Alignment.center,
                        child:  CircularPercentIndicator (
                          radius: 70,
                          lineWidth: 7,
                          percent: 0.8,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: const Color.fromRGBO(241, 39, 99,1),
                          backgroundColor: const Color.fromRGBO(241, 39, 99,0.3),
                        )
                      ),
                      Align(
                        alignment: Alignment.center,
                        child:  CircularPercentIndicator(
                          radius: 60,
                          lineWidth: 7,
                          percent: 0.6,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: const Color.fromRGBO(172, 251, 2,1),
                          backgroundColor: const Color.fromRGBO(172, 251, 2,0.3),
                        ),
                      ),
                      Align (
                        alignment: Alignment.center,
                        child:  CircularPercentIndicator (
                          radius: 50,
                          lineWidth: 7,
                          percent: 0.4,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: const Color.fromRGBO(3, 247, 211,1),
                          backgroundColor: const Color.fromRGBO(3, 247, 211,0.3),
                          ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child:  CircularPercentIndicator(
                          radius: 40,
                          lineWidth: 7,
                          percent: 0.2,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: const Color.fromRGBO(255, 100, 0,1),
                          backgroundColor: const Color.fromRGBO(255, 100, 0,0.3),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(15), // <= No more error here :)
                          color: const Color.fromRGBO(241, 39, 99,1),
                        ),
                        margin: const EdgeInsets.only( bottom: 15),
                        height: heightRightLine,
                        width: widthRightLine,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(15), // <= No more error here :)
                          color: const Color.fromRGBO(172, 251, 2,1),
                        ),
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15),
                        height: heightRightLine,
                        width: widthRightLine,
                        padding: const EdgeInsets.all(15),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(15), // <= No more error here :)
                          color: const Color.fromRGBO(3, 247, 211,1),
                        ),
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15),
                        height: heightRightLine,
                        width: widthRightLine,
                        padding: const EdgeInsets.all(15),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(15), // <= No more error here :)
                          color: const Color.fromRGBO(255, 100, 0,1),
                        ),
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        height: heightRightLine,
                        width: widthRightLine,
                        padding: const EdgeInsets.all(15),
                      )
                    ],
                  ),
                )
              ],
            )
          )
        ],
      ));
  }
}

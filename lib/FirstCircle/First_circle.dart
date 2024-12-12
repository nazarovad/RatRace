import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ratrace/servises/ManagementDataBase.dart';


class FirstCircle extends StatefulWidget {
  const FirstCircle({super.key});

  @override
  State<FirstCircle> createState() => _FirstCircleState();
}

class _FirstCircleState extends State<FirstCircle> {
  ManagementDataBase managementDataBase = ManagementDataBase('professions.db');


  double height_right_line = 25;
  double width_right_line = double.maxFinite;

  int timing = 100;

  double positionRight = 1;
  bool checkPosition = true;
  double animateCont = 140;
  double widthAnimateCont = 170;
  double maxWidth = 1.0;


  @override
  Widget build(BuildContext context) {

    //managementDataBase.copyDatabase();
    managementDataBase.printDatabase('SELECT name FROM Prof');

    return Scaffold(
      appBar: AppBar(title: Text('Внутренний круг')),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            height: 200,
            width: MediaQuery.of(context).size.width / 0.5,
            padding: EdgeInsets.all(15),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 154,
                  height: 154,
                  // color: Colors.green,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: CircularPercentIndicator(
                          radius: 70,
                          lineWidth: 7,
                          percent: 0.8,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Color.fromRGBO(241, 39, 99, 1),
                          backgroundColor: Color.fromRGBO(241, 39, 99, 0.3),
                        ),
                      ),
                      Align(
                        child: CircularPercentIndicator(
                          radius: 60,
                          lineWidth: 7,
                          percent: 0.6,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Color.fromRGBO(172, 251, 2, 1),
                          backgroundColor: Color.fromRGBO(172, 251, 2, 0.3),
                        ),
                      ),
                      Align(
                        child: CircularPercentIndicator(
                          radius: 50,
                          lineWidth: 7,
                          percent: 0.4,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Color.fromRGBO(3, 247, 211, 1),
                          backgroundColor: Color.fromRGBO(3, 247, 211, 0.3),
                        ),
                      ),
                      Align(
                        child: CircularPercentIndicator(
                          radius: 40,
                          lineWidth: 7,
                          percent: 0.2,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Color.fromRGBO(255, 100, 0, 1),
                          backgroundColor: Color.fromRGBO(255, 100, 0, 0.3),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedAlign(alignment: AlignmentDirectional(1, 0), duration: Duration(milliseconds: timing),
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      print("Is pressed!!!");
                      if (details.delta.dx < 0) {
                        widthAnimateCont = 324; // Свайп вправо
                      } else {
                        widthAnimateCont = 170; // Свайп влево
                      }
                    });
                  },
                  child: AnimatedAlign(
                    duration: Duration(milliseconds: timing),
                    alignment: AlignmentDirectional(positionRight, 0),
                    widthFactor: maxWidth,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: timing),
                      color: Colors.black,
                      width: widthAnimateCont,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AnimatedContainer(
                            duration: Duration(milliseconds: timing),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromRGBO(241, 39, 99, 1),
                            ),
                            margin: EdgeInsets.only(left: 5.0, right: 5.0,bottom: 15),
                            height: height_right_line,
                            width: width_right_line,
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: timing),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromRGBO(172, 251, 2, 1),
                            ),
                            margin: EdgeInsets.only(
                                left: 5.0, right: 5.0, bottom: 15),
                            height: height_right_line,
                            width: width_right_line,
                            padding: EdgeInsets.all(15),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: timing),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromRGBO(3, 247, 211, 1),
                            ),
                            margin: EdgeInsets.only(
                                left: 5.0, right: 5.0, bottom: 15),
                            height: height_right_line,
                            width: width_right_line,
                            padding: EdgeInsets.all(15),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: timing),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromRGBO(255, 100, 0, 1),
                            ),
                            margin: EdgeInsets.only(
                                left: 5.0, right: 5.0),
                            height: height_right_line,
                            width: width_right_line,
                            padding: EdgeInsets.all(15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),)

              ],
            ),
          ),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ratrace/FirstCircle/DataPlayer.dart';


class FirstCircle extends StatefulWidget {
  const FirstCircle({super.key});

  @override
  State<FirstCircle> createState() => _FirstCircleState();
}

class _FirstCircleState extends State<FirstCircle> {
  DataPlayer dataPlayer = new DataPlayer('Учитель');

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
    // managementDataBase.printDatabase('SELECT name FROM Prof');

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
                  onTap: () {
                    setState(() {
                      print("Is pressed!!!");

                      if (checkPosition == true) {
                        widthAnimateCont = 324;

                        checkPosition = false;
                      } else {
                        widthAnimateCont = 170;
                        checkPosition = true;
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
          Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            padding: EdgeInsets.only(top:20),
            width: MediaQuery.of(context).size.width / 0.5,
            height: MediaQuery.of(context).size.height / 1.6,
            child: Column(
              children: <Widget>[
                Align(

                  alignment: AlignmentDirectional(-0.8, 0),
                  child: Text("Отчет о доходах", style: TextStyle(fontSize: 25),),
                ),
                Column(

                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            print("Нажатие на Денежный поток!!!");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: 3
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.only(top: 20, right: 40),
                            width: 150,
                            height: 100,
                            child: Column(
                              children: <Widget>[
                                Align(alignment: AlignmentDirectional(-0.7, 0),
                                child: Text("1512", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
                                ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.7, 0),
                                  child: Text("Доходы", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                                )
                              ],
                            ),

                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            print("Нажатие на Общие расходы!!!");
                          },
                          child:Container(
                            margin: EdgeInsets.only(top: 20,),
                            width: 150,
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: 3
                              ),
                              borderRadius: BorderRadius.circular(20),


                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),

                Align(
                  alignment: AlignmentDirectional(-0.8, 0),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text("Балансовый отчёт", style: TextStyle(fontSize: 25),),
                  )

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        print("Нажатие на Денежный поток!!!");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 3
                          ),
                            borderRadius: BorderRadius.circular(20),


                        ),
                        margin: EdgeInsets.only(top: 20, right: 40),
                        width: 150,
                        height: 100,

                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        print("Нажатие на Общие расходы!!!");
                      },
                      child:Container(
                        margin: EdgeInsets.only(top: 20,),
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: 3
                          ),
                          borderRadius: BorderRadius.circular(20),


                        ),
                      ),
                    )
                  ],

                )
              ],
            ),
          )


        ],
      ),
    );
  }
}

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

  double height_right_line = 30;
  double width_right_line = double.maxFinite;

  int timing = 100;

  double positionRight = 1;
  bool checkPosition = true;
  double animateCont = 140;
  double widthAnimateCont = 170;
  double maxWidth = 1.0;
  double pos = 1;

  double buttonWidth = 150;
  double buttonHeight = 100;
  Rect _containerRect = Rect.zero;
  double _buttonWidth = 100.0;
  double _buttonHeight = 50.0;
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getInitialContainerRect();
      _getScreenSize();
    });
  }

  void _getInitialContainerRect() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final Offset offset = renderBox.localToGlobal(Offset.zero);
      _containerRect = Rect.fromLTWH(
          offset.dx, offset.dy, _buttonWidth, _buttonHeight);
    }
  }

  void _getScreenSize() {
    final Size size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;
  }
  bool _isExpanded = true;
  void _tapButtonDox(){
    setState(() {
      print("Нажатие на Денежный поток!!!");
      _isExpanded=!_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    //managementDataBase.copyDatabase();
    // managementDataBase.printDatabase('SELECT name FROM Prof');

    return Scaffold(
      appBar: AppBar(title: Text('Внутренний круг')),
      body: Stack(

        children: [
          // Контейнер для диаграм и цветных полосочек
          Positioned(

            top: 0,
            left: 0,
            right: 0,
            child: Container(
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
                  // Лево
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
                            animationDuration: 2000,
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
                            animationDuration: 2000,
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
                            animationDuration: 2000,
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
                            animationDuration: 2000,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Color.fromRGBO(255, 100, 0, 1),
                            backgroundColor: Color.fromRGBO(255, 100, 0, 0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Право
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
                              Stack(
                                children: [

                                  AnimatedAlign(duration: Duration(milliseconds: timing),

                                    alignment: AlignmentDirectional(pos, 0),

                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 15),
                                      padding: EdgeInsets.only(left: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color.fromRGBO(241, 39, 99, 1),
                                      ),
                                      height: height_right_line,
                                      width: width_right_line,
                                      child: Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Text("Пассивный доход", style: TextStyle(color: Colors.black, fontSize: 15),),
                                      ),
                                    ),

                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Container(
                                        padding: EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Color.fromRGBO(241, 39, 99, 1),
                                        ),
                                        height: height_right_line,
                                        width: 170,
                                        child: Align(
                                          alignment: AlignmentDirectional(1, 0),
                                          child: Text("15 000 000", style: TextStyle(color: Colors.black, fontSize: 15)),
                                        )
                                    ),
                                  )

                                ],
                              ),
                              Stack(
                                children: [

                                  AnimatedAlign(duration: Duration(milliseconds: timing),
                                    alignment: AlignmentDirectional(pos, 0),

                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 15),
                                      padding: EdgeInsets.only(left: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color.fromRGBO(172, 251, 2, 1),
                                      ),
                                      height: height_right_line,
                                      width: width_right_line,
                                      child: Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Text("Общий доход", style: TextStyle(color: Colors.black, fontSize: 15)),
                                      ),
                                    ),

                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Container(
                                        padding: EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Color.fromRGBO(172, 251, 2, 1),
                                        ),
                                        height: height_right_line,
                                        width: 170,
                                        child: Align(
                                          alignment: AlignmentDirectional(1, 0),
                                          child: Text("15 000 000", style: TextStyle(color: Colors.black, fontSize: 15)),
                                        )
                                    ),
                                  )

                                ],
                              ),
                              Stack(
                                children: [

                                  AnimatedAlign(duration: Duration(milliseconds: timing),
                                    alignment: AlignmentDirectional(pos, 0),

                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 15),
                                      padding: EdgeInsets.only(left: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color.fromRGBO(3, 247, 211, 1),
                                      ),
                                      height: height_right_line,
                                      width: width_right_line,
                                      child: Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Text("Общие расходы", style: TextStyle(color: Colors.black, fontSize: 15)),
                                      ),
                                    ),

                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Container(
                                        padding: EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Color.fromRGBO(3, 247, 211, 1),
                                        ),
                                        height: height_right_line,
                                        width: 170,
                                        child: Align(
                                          alignment: AlignmentDirectional(1, 0),
                                          child: Text("15 000 000", style: TextStyle(color: Colors.black, fontSize: 15)),
                                        )
                                    ),
                                  )

                                ],
                              ),
                              Stack(
                                children: [

                                  AnimatedAlign(duration: Duration(milliseconds: timing),
                                    alignment: AlignmentDirectional(pos, 0),

                                    child: Container(
                                      padding: EdgeInsets.only(left: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color.fromRGBO(255, 100, 0, 1),
                                      ),
                                      height: height_right_line,
                                      width: width_right_line,
                                      child: Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Text("Денежный поток", style: TextStyle(color: Colors.black, fontSize: 15)),
                                      ),
                                    ),

                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Container(
                                        padding: EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Color.fromRGBO(255, 100, 0, 1),
                                        ),
                                        height: height_right_line,
                                        width: 170,
                                        child: Align(
                                          alignment: AlignmentDirectional(1, 0),
                                          child: Text("15 000 000", style: TextStyle(color: Colors.black, fontSize: 15)),
                                        )
                                    ),
                                  )

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),)

                ],
              ),
            ),
          ),

          // Процентный индикатор снизу
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              width: MediaQuery.of(context).size.width / 0.5,
              height: MediaQuery.of(context).size.height / 5,
              child: Align(
                alignment: Alignment.center,
                child: new LinearPercentIndicator(

                  lineHeight: 60,
                  animation: true,
                  animationDuration: 2000,
                  percent: 0.8,
                  center: Text("80.0%", style: TextStyle(fontSize: 30, color: Colors.white),),
                  barRadius: Radius.circular(10),
                  progressColor: Color.fromRGBO(0, 0, 0, 1),
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
                ),
              ),
            ),
          ),
          // Место для кнопок

          Positioned( // Текст
              top: 225,
              left: 25,
              child: Text("Отчет о доходах", style: TextStyle(fontSize: 25)),
          ),
          AnimatedPositioned(
              left: _isExpanded ? 25 : 20,
              top: _isExpanded ? 265 : 0,
              right: _isExpanded ? 218 : 20,
              child: AnimatedContainer(
                duration: Duration(milliseconds: timing),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      width: 3
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
                ),

                width: _isExpanded ? 150 : MediaQuery.of(context).size.width/0.5,
                height: _isExpanded ? 100 : 750,
              ),
              duration: Duration(milliseconds: timing)
          ),
          Positioned(
              // Кнопка про доходы
              top: 245,
              left: 25,
              child:GestureDetector(
                  onTap: _tapButtonDox,
                  child: Stack(
                    children: [
                      Container(
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
                          child: Container(
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
                          )
                      ),



                    ],
                  )

              ),
          ),

        ],
      ),
    );
  }
}


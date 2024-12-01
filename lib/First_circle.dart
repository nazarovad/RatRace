import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FirstCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Внутренний круг')),
        body: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20), // <= No more error here :)
                  color: Colors.black,
                ),
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                height: 200,
                padding: EdgeInsets.all(15),
                child: Row(

                  children: [
                    Container(

                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[

                          new Align(
                              alignment: Alignment.center,
                              child: new CircularPercentIndicator(
                                radius: 70,
                                lineWidth: 7,
                                percent: 0.8,
                                animation: true,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Color.fromRGBO(241, 39, 99,1),
                                backgroundColor: Color.fromRGBO(241, 39, 99,0.3),
                              )),
                          new Align(
                            alignment: Alignment.center,
                            child: new CircularPercentIndicator(
                              radius: 60,
                              lineWidth: 7,
                              percent: 0.6,
                              animation: true,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Color.fromRGBO(172, 251, 2,1),
                              backgroundColor: Color.fromRGBO(172, 251, 2,0.3),
                            ),
                          ),
                          new Align(
                            alignment: Alignment.center,
                            child: new CircularPercentIndicator(
                              radius: 50,
                              lineWidth: 7,
                              percent: 0.4,
                              animation: true,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Color.fromRGBO(3, 247, 211,1),
                              backgroundColor: Color.fromRGBO(3, 247, 211,0.3),
                            ),
                          ),
                          new Align(
                            alignment: Alignment.center,
                            child: new CircularPercentIndicator(
                              radius: 40,
                              lineWidth: 7,
                              percent: 0.2,
                              animation: true,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Color.fromRGBO(255, 100, 0,1),
                              backgroundColor: Color.fromRGBO(255, 100, 0,0.3),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Column(),
                    )


                  ],
                )
    )

          ],
        ));
  }
}

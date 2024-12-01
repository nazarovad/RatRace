import 'package:flutter/material.dart';

class Indicator extends StatefulWidget {
  int itemCount;
  PageController controller;
  Indicator(this.controller, this.itemCount,{super.key});

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(_handleChanges);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.removeListener(_handleChanges);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(bottom: 43),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(139, 139, 139, 0.2),
        borderRadius: BorderRadius.circular(30),

      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.itemCount,
        itemBuilder: (context, index) {
          return _createIndicateElements(index);
        }),
    );
  }

  _handleChanges() {
    setState(() {
    });
  }

  Widget _createIndicateElements(index) {
    double size = 40;
    MaterialColor color = Colors.blue;

    if (widget.controller.page == index) {
      size = 60;
      color = Colors.green;
    }

    double sizeCircleShadow = ((70 - size) / 2) -2; // Чет экспериментиру

    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top:  sizeCircleShadow, bottom: sizeCircleShadow),
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular((size +2)/ 2)
      ),
      child: Icon (
        Icons.alarm,
        color: color,
        size: size,
      ),
    );
  }
}

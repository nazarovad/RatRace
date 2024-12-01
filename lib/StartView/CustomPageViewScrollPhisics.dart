import 'package:flutter/material.dart';

class CustomPageViewScrollPhysics extends ScrollPhysics {
  const CustomPageViewScrollPhysics({ScrollPhysics? parent})
      : super(parent: parent);
  @override
  CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomPageViewScrollPhysics(parent: buildParent(ancestor)!);
  }
  @override
  SpringDescription get spring => const SpringDescription(
    mass: 50, // масса 50
    stiffness: 150, // коэфф жесткости пружины 100
    damping: 2, // демфирование 0.8
  );
}
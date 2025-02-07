


import 'package:flutter/material.dart';

class MyThemeData{

  ThemeData lightcshem(){
    return ThemeData(
      colorScheme: ColorScheme.light(

      ),
          scaffoldBackgroundColor: Colors.white,

    );
  }
  ThemeData darkschem(){
    return ThemeData(
      colorScheme: ColorScheme.dark(
        surfaceContainerHighest: Color.fromARGB(36, 38, 59, 1),
        surfaceContainerHigh: Color.fromARGB(51, 50, 68, 1)

      ),
      scaffoldBackgroundColor: Color.fromRGBO(28, 33, 53, 1)
    );
  }



}
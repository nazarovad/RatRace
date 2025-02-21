import 'package:flutter/material.dart';
import 'package:ratrace/StartView/StartView.dart';
import 'package:flutter/services.dart';
import 'servises/tema.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.22
  @override
  Widget build(BuildContext context) {
    MyThemeData myThemeData = new MyThemeData();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myThemeData.darkschem(),
      home: const StartView(title: 'Выбор профессии'),
    );
  }
}

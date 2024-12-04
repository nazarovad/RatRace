import 'package:sqflite/sqflite.dart';

Future<void> init() async {
  var db = await openDatabase('my_db.db');
  await db.close();
}


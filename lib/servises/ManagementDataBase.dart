// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ManagementDataBase {
  String dataBaseName;

  ManagementDataBase(this.dataBaseName);

  Future<String> getDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    return join(documentsDirectory.path, dataBaseName);
  }
  Future<void> deleteData() async {
    String path = await getDatabase();
    print("1)$path");

    final directory = await getApplicationDocumentsDirectory();
    final dbPath = '${directory.path}/$dataBaseName';

    final file = File(dbPath);
    if (await file.exists()) {
      await file.delete();
      print('Database deleted');
    } else {
      print('Database does not exist');
    }

  }


  // Функция чисто скопировать в рабочую область базу данных
  // Дальнейшее использование не рекомендуется.
  Future<void> copyDatabase() async {
    String path = await getDatabase();

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load('assets/database/$dataBaseName');
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      File file = File(path);
      await file.writeAsBytes(bytes);
      print("База данных успешно скопирована в: $path");
    } else {
      print("База данных уже существует по пути: $path");
    }

  }
  Future<List<Map>> printDatabase(String request) async {
    String path = await getDatabase();
    Database database = await openDatabase(path, version: 1);
    List<Map> list = await database.rawQuery(request);
    await database.close();
   return list;
  }


}

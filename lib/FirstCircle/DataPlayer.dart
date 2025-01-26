



import 'package:ratrace/servises/ManagementDataBase.dart';

class DataPlayer{
  ManagementDataBase managementDataBase = ManagementDataBase('professions.db');

  String character;


  DataPlayer(this.character) {
    init(); // Вызов функции init в конструкторе
  }

  late String doxod;
  late String rashod;
  late String sberezh;
  late String passive;


  void fetchAndPrintSalaries() {
    managementDataBase.printDatabase("SELECT Salary FROM Prof WHERE Name='$character'")
        .then((List<Map> list) {
      // Перебираем элементы списка и выводим их в консоль
      for (var item in list) {
        print('Salary: ${item['Savings']}'); // Замените 'Salary' на имя вашего столбца
      }
    }).catchError((error) {
      // Обработка ошибок
      print('Error fetching data: $error');
    });
  }
  void init() {
    managementDataBase.printDatabase("SELECT * FROM Prof WHERE Name='$character'")
        .then((List<Map> list){
      for (var item in list) {
        sberezh = item['Savings'];
      }
    }).catchError((error) {
      print('Error fetching data: $error');
    });

  }


}
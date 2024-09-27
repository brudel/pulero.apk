import 'package:pulero_apk/src/database/mydatabase.dart';

class Dweller {
  static Future<List<Map<String, dynamic>>> getDwellers() async {
    return MyDatabase.query('dwellers');
  }

  static Future<Map<String, dynamic>> getDweller(int id) async {
    return (await MyDatabase.query('dwellers', where: 'id = ?', whereArgs: [id]))[0];
  }
}
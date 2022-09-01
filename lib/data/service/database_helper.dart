import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
  static Future database() async {
    final databasePath = await getDatabasesPath();
    return openDatabase(join(databasePath, 'op_note_database.db'), onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT, imageContent TEXT, drawingContent TEXT)');
    }, version: 1);
  }

  static Future<List<Map<String, dynamic>>> getNotes() async {
    final database = await Databasehelper.database();
    return database.query("notes", orderBy: "id DESC");
  }

  static Future insertNote(Map<String, dynamic> data) async {
    final database = await Databasehelper.database();
    database.insert("notes", data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future deleteNote(int id) async {
    final database = await Databasehelper.database();
    return database.delete("notes", where: "id = ?", whereArgs: [id]);
  }
}

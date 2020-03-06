
import 'package:flutter_app_todolist/db/todo_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodoDatabase {
  static const String DB_NAME = "todo.db";
  static const int DB_VERSION = 1;
  static Database _database;

  TodoDatabase._internal();
  static final TodoDatabase instance = TodoDatabase._internal();

  Database get database => _database;

  static const initScript = [TodoTable.CREATE_TABLE_QUERY];
  static const migrationScript = [TodoTable.CREATE_TABLE_QUERY];

  init() async{
    _database = await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version){
        initScript.forEach((script) async => await db.execute(script));
      },
      version: DB_VERSION,
      onUpgrade: (db, oldVersion, newVersion){
        initScript.forEach((script) async => await db.execute(script));
      }
    );
  }

}
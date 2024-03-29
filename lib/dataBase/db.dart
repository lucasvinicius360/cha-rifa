import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  static Database? _database;

  get database async {
    if (_database != null) {
      return _database;
    }

    return await _initDataBase();
  }

  _initDataBase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'crudSqlite.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(
      _getUsers,
    );
  }

  String get _users => '''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT, 
      payment BOOLEAN 
      number INTEGER
      
    )
  ''';

  String get _getUsers => ''' 
    ALTER TABLE users ADD COLUMN number INTEGER;
    ''';

  Future<void> adicionarColunaNumber(Database db) async {
  await db.execute('ALTER TABLE users ADD COLUMN number INTEGER');
  }
}

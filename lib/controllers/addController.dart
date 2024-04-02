import 'package:cha_rifa/dataBase/db.dart';
import 'package:flutter/widgets.dart';

import 'package:sqflite/sqflite.dart';

class UsersRepositores extends ChangeNotifier {
  late Database db;
  List<Map<String, dynamic>> _users = [];
  List<Map<String, dynamic>> get users => _users;

  UsersRepositores() {
    _init();
  }

  _init() async {

    await getUsers();
  }

  getUsers() async {
    db = await DB.instance.database;
    // db.execute('ALTER TABLE users ADD COLUMN number INTEGER');
    _users = await db.query('users');
    notifyListeners();
    return _users; 
  }

  addUsers(String name, int email, bool checkValue) async {
    db = await DB.instance.database;
    await db.insert(
      'users',
      {'name': name, 'number': email, 'payment': checkValue},
    );
    await getUsers(); // Atualiza a lista de usuários após a inserção
  }

  getUserById(int id) async {
    db = await DB.instance.database;
    List<Map<String, dynamic>> user =
        await db.query('users', where: 'id = ?', whereArgs: [id]);
    return user.first;
  }

  updateUsers(int id, String name, int email, bool checkValue) async {
    db = await DB.instance.database;
    await db.update(
      'users',
      {'name': name, 'number': email, 'payment': checkValue},
      where: 'id = ?',
      whereArgs: [id],
    );
    await getUsers(); // Atualiza a lista de usuários após a atualização
  }

  deleteUsers(int id) async {
    db = await DB.instance.database;
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
    await getUsers(); // Atualiza a lista de usuários após a exclusão
  }
}

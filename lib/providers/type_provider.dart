import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../models/type_model.dart';

class TypeProvider extends ChangeNotifier {
  String table = "type";
  final Database db;
  final List<TypeModel> typeList;

  TypeProvider(this.db, this.typeList);

  Future<void> addPokemon(TypeModel type) async {
    await db.insert(
      table,
      type.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }

  Future<List<Map>> getOne(int typeId) async {
    return await db.query(table, where: "id = ?", whereArgs: [typeId]);
  }

  Future<void> removeById(int typeId) async {
    await db.delete('pokemon', where: 'id = ?', whereArgs: [typeId]);
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    return await db.query(table);
  }
}

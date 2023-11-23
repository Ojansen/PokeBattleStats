import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poke_battle_stats/constants.dart';
import 'package:poke_battle_stats/models/nature_model.dart';
import 'package:sqflite/sqflite.dart';

class NatureProvider extends ChangeNotifier {
  final List<NatureModel> naturesListState;
  String table = natureTable;
  final Database db;

  NatureProvider(this.db, this.naturesListState);

  Future<List<Map>> getOne(int natureId) async {
    return await db.query(table, where: "id = ?", whereArgs: [natureId]);
  }

  Future<List<Map<String, Object?>>> getAll() async {
    return await db.query(table);
  }
}

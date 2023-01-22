
import 'package:sqflite/sqflite.dart';

class Migrations {
  int version = 1;

  createDatabase(Database db, int version) async {
    var batch = db.batch();
    _createTablePokemon(batch);
    _createTableTypes(batch);
    _createTableNature(batch);
    await batch.commit();
  }

  void _createTablePokemon(Batch batch) {
    batch.execute('DROP TABLE IF EXISTS pokemon');
    batch.execute('''CREATE TABLE pokemon (id INTEGER PRIMARY KEY, name TEXT, type TEXT, sprite TEXT, stats BLOB, moves BLOB)''');
  }

  void _createTableTypes(Batch batch) {
    batch.execute('DROP TABLE IF EXISTS type');
    batch.execute('''CREATE TABLE type (id INTEGER PRIMARY KEY, name TEXT, damage_class TEXT, damage_relation BLOB, moves BLOb, pokemon BLOB)''');
  }

  void _createTableNature(Batch batch) {
    batch.execute('DROP TABLE IF EXISTS nature');
    batch.execute('''CREATE TABLE nature (id INTEGER PRIMARY KEY, name TEXT, increased_stat TEXT, decreased_stat TEXT, hates_flavor TEXT)''');
  }
}
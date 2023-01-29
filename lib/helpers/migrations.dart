
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
    batch.execute('DROP TABLE IF EXISTS Pokemon');
    batch.execute('''CREATE TABLE Pokemon (id INTEGER PRIMARY KEY, pokemonJson TEXT)''');
  }

  void _createTableTypes(Batch batch) {
    batch.execute('DROP TABLE IF EXISTS Type');
    batch.execute('''CREATE TABLE Type (id INTEGER PRIMARY KEY, typeJson TEXT)''');
  }

  void _createTableNature(Batch batch) {
    batch.execute('DROP TABLE IF EXISTS Nature');
    batch.execute('''CREATE TABLE Nature (id INTEGER PRIMARY KEY, natureJson TEXT)''');
  }
}
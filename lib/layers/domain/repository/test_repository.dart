import 'package:matule/layers/data/local/sqfite.dart';
import 'package:sqflite/sqflite.dart';

abstract class TestRepository {
  Future<Database>  get database => Sqfite().openDB();

  Future<void> createTestDB() async {
    final db = await database;
    await db.execute('CREATE TABLE IF NOT EXISTS test(id INTEGER PRIMARY KEY, name TEXT, lastname TEXT)');
  }
}

import 'package:matule/layers/domain/entity/test_entity.dart';
import 'package:matule/layers/domain/repository/test_repository.dart';
import 'package:sqflite/sqflite.dart';

class TestRepositoryProvider extends TestRepository {
  TestRepositoryProvider._instance();
  static final TestRepositoryProvider _provider =
      TestRepositoryProvider._instance();

  factory TestRepositoryProvider() => _provider;

  Future<void> createTest(TestEntity test) async {
    final db = await database;
    await db.insert(
      'test',
      test.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<TestEntity>> readTest() async {
    final db = await database;
    await Future.delayed(Duration(seconds: 2));
    final List<Map<String, Object?>> userMaps = await db.query('test');

    return userMaps.toList().map((toElement) {
      return TestEntity.fromMap(toElement);
    }).toList();
  }

  Future<void> updateTest(TestEntity test) async {
    final db = await database;
    await db.update(
      'test',
      test.toMap(),
      where: 'id = ?',
      whereArgs: [test.id],
    );
  }

  Future<void> deleteTest(int id) async {
    final db = await database;
    await db.delete('test', where: 'id = ?', whereArgs: [id]);
  }
}

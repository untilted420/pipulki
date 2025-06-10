import 'package:flutter/widgets.dart';
import 'package:matule/layers/domain/entity/test_entity.dart';
import 'package:matule/layers/domain/entity/user_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sqfite {
  Future<Database> openDB() async {
    Database database = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
    );
    return database;
  }
}

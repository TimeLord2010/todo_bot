import 'dart:io';

import 'package:discord_bot_dart/data/schemas/projects.dart';
import 'package:discord_bot_dart/data/schemas/todos.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Projects, Todos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  static QueryExecutor _openConnection() {
    var dir = Directory.current;
    var file = File('${dir.path}/database.db');
    return NativeDatabase.createInBackground(file);
  }

  @override
  int get schemaVersion => 1;
}

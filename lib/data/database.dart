import 'dart:io';

import 'package:discord_bot_dart/data/schemas/projects.dart';
import 'package:discord_bot_dart/data/schemas/todos.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Projects, Todos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.addColumn(todos, todos.deadline);
        }
        if (from < 3) {
          await m.addColumn(todos, todos.priority);
        }
        if (from < 4) {
          await m.addColumn(todos, todos.status);
        }
      },
    );
  }

  static QueryExecutor _openConnection() {
    var dir = Directory.current;
    var file = File('${dir.path}/database.db');
    return NativeDatabase.createInBackground(file);
  }

  @override
  int get schemaVersion => 4;
}

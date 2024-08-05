import 'package:discord_bot_dart/data/schemas/projects.dart';
import 'package:drift/drift.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1)();
  TextColumn get description => text()();
  IntColumn get projectId => integer().nullable().references(Projects, #id)();
  IntColumn get priority => integer().nullable()();
  DateTimeColumn get deadline => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}

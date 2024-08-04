import 'package:discord_bot_dart/data/database.dart';

AppDatabase? database;

AppDatabase createDatabase() {
  if (database != null) {
    return database!;
  }
  database = AppDatabase();
  return database!;
}

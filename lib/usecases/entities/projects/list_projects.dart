import 'package:discord_bot_dart/data/database.dart';
import 'package:discord_bot_dart/data/factories/create_database.dart';

Future<List<Project>> listProjects() async {
  var db = createDatabase();
  var projects = await db.select(db.projects).get();
  return projects;
}

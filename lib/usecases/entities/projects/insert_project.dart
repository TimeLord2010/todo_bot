import 'package:discord_bot_dart/data/database.dart';
import 'package:discord_bot_dart/data/factories/create_database.dart';

Future<Project> insertProject(String name) async {
  var db = createDatabase();
  var projectsCompanion = ProjectsCompanion.insert(
    title: name,
  );
  var created = await db.into(db.projects).insertReturning(projectsCompanion);
  return created;
}

import 'package:discord_bot_dart/data/database.dart';
import 'package:discord_bot_dart/data/factories/create_database.dart';
import 'package:drift/drift.dart';

Future<void> editProjectName(int projectId, String name) async {
  var db = createDatabase();
  var where = db.update(db.projects)..where((x) => x.id.equals(projectId));
  await where.write(ProjectsCompanion(
    title: Value(name),
  ));
}

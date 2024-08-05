import 'package:discord_bot_dart/data/factories/create_database.dart';

Future<void> deleteTodosByProject(int projectId) async {
  var db = createDatabase();
  var where = db.delete(db.todos)..where((x) => x.projectId.equals(projectId));
  await where.go();
}

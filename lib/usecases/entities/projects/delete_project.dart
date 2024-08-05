import 'package:discord_bot_dart/data/factories/create_database.dart';
import 'package:discord_bot_dart/usecases/entities/todos/delete_todos_by_project.dart';

Future<void> deleteProject(int projectId) async {
  await deleteTodosByProject(projectId);
  var db = createDatabase();
  var where = db.delete(db.projects)..where((x) => x.id.equals(projectId));
  await where.go();
}

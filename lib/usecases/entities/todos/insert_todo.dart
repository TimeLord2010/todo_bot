import 'package:discord_bot_dart/data/database.dart';
import 'package:discord_bot_dart/data/factories/create_database.dart';

Future<Todo> insertTodo({
  required String title,
}) async {
  final db = createDatabase();
  var todosCompanion = TodosCompanion.insert(
    title: title,
    description: '',
    createdAt: DateTime.now(),
  );
  var todo = await db.into(db.todos).insertReturning(todosCompanion);
  return todo;
}

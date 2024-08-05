import 'package:discord_bot_dart/data/database.dart';
import 'package:discord_bot_dart/data/factories/create_database.dart';

Future<List<Todo>> listTodos({
  int skip = 0,
  int limit = 15,
}) async {
  var db = createDatabase();
  var select = db.select(db.todos)..limit(limit, offset: skip);
  var todos = await select.get();
  return todos;
}

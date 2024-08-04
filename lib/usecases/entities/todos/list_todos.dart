import 'package:discord_bot_dart/data/database.dart';
import 'package:discord_bot_dart/data/factories/create_database.dart';

Future<List<Todo>> listTodos() async {
  var db = createDatabase();

  var todos = await db.select(db.todos).get();
  return todos;
}

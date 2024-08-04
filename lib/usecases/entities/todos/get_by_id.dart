import 'package:discord_bot_dart/data/database.dart';
import 'package:discord_bot_dart/data/factories/create_database.dart';

Future<Todo> getById(int id) {
  var db = createDatabase();
  var select = db.select(db.todos);
  var todo = select..where((x) => x.id.equals(id));
  return todo.getSingle();
}

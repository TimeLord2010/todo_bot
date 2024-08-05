import 'package:discord_bot_dart/data/factories/create_database.dart';

Future<void> deleteTodo(int id) async {
  var db = createDatabase();
  var op = db.delete(db.todos)..where((x) => x.id.equals(id));
  await op.go();
}

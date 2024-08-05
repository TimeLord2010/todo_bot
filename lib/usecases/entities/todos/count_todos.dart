import 'package:discord_bot_dart/data/factories/create_database.dart';
import 'package:drift/drift.dart';

Future<int> countTodos() async {
  var db = createDatabase();
  final amountOfTodos = db.todos.id.count();
  var query = db.selectOnly(db.todos)..addColumns([amountOfTodos]);
  var result = query.map((row) => row.read(amountOfTodos));
  var amount = await result.getSingle();
  return amount ?? 0;
}

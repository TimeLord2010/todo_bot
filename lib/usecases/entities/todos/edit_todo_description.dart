import 'package:discord_bot_dart/data/database.dart';
import 'package:discord_bot_dart/data/factories/create_database.dart';
import 'package:drift/drift.dart';

Future<void> editTodoDescription(int id, String description) async {
  var db = createDatabase();
  var update = db.update(db.todos);
  var where = update..where((x) => x.id.equals(id));
  where.write(TodosCompanion(
    description: Value(description),
  ));
}

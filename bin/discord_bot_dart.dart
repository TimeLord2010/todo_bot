import 'package:discord_bot_dart/data/env.dart';
import 'package:discord_bot_dart/repositories/extensions/todo_ext.dart';
import 'package:discord_bot_dart/usecases/entities/todos/edit_todo_description.dart';
import 'package:discord_bot_dart/usecases/entities/todos/get_by_id.dart';
import 'package:discord_bot_dart/usecases/entities/todos/insert_todo.dart';
import 'package:discord_bot_dart/usecases/entities/todos/list_todos.dart';
import 'package:nyxx/nyxx.dart';

Future<void> main(List<String> arguments) async {
  const token = Env.discordBotToken;
  final client = await Nyxx.connectGateway(token, GatewayIntents.allUnprivileged);

  final botUser = await client.users.fetchCurrentUser();

  print('Listening for messages...');
  client.onMessageCreate.listen((event) async {
    Future<void> send(String msg) async {
      await event.message.channel.sendMessage(MessageBuilder(
        content: msg,
        //replyId: event.message.id,
      ));
    }

    if (!event.mentions.contains(botUser)) {
      print('Message ignored: no bot mention');
      return;
    }
    var member = event.member;
    if (member != null && member.id == botUser.id) {
      print('Message ignored: This was message sent by the bot');
      return;
    }
    var msg = event.message.content;
    print('Message received: $msg');
    if (msg.contains('>')) {
      msg = msg.substring(msg.indexOf('>') + 1);
      msg = msg.trim();
    }
    print('Sanitized message: $msg');

    // Create todo
    if (msg.startsWith('/ctd')) {
      msg = msg.replaceFirst('/ctd', '').trim();
      var inserted = await insertTodo(
        title: msg,
      );
      send('Created todo!\n${inserted.toIdentedJson}');
      return;
    }

    // List todos
    if (msg.startsWith('/l')) {
      var todos = await listTodos();
      var content = todos.map((x) {
        var desc = x.description;

        // CreatedAt
        var created = x.createdAt.toIso8601String();
        var lastDots = created.lastIndexOf(':');
        created = created.substring(0, lastDots);

        var parts = [
          '- **${x.title}** (#${x.id})',
          if (desc != '') '> $desc',
        ];
        return parts.join('\n');
      }).join('\n');
      send('Todos:\n$content');
      return;
    }

    // Edit todo
    var editPat = RegExp(r'\/etd\s+#(\d+)\s+(.+)');
    var match = editPat.firstMatch(msg);
    if (match != null) {
      var id = int.parse(match.group(1)!);
      String rest = match.group(2)!;
      if (rest.startsWith('/d')) {
        rest = rest.replaceFirst('/d', '').trim();
        await editTodoDescription(id, rest);
      }
      var todo = await getById(id);
      send(todo.toIdentedJson);
      return;
    }

    print('Message codes: ${msg.codeUnits.join(',')}');
    await event.message.channel.sendMessage(MessageBuilder(
      content: 'You mentioned me!',
      replyId: event.message.id,
    ));
  });
}

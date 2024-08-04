import 'package:discord_bot_dart/data/database.dart';
import 'package:vit_dart_extensions/vit_dart_extensions.dart';

extension TodoExt on Todo {
  Map<String, dynamic> get toMap {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'projectId': projectId,
    };
  }

  String get toIdentedJson {
    return toMap.prettyJSON;
  }
}

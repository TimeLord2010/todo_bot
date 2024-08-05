import 'package:discord_bot_dart/data/database.dart';
import 'package:vit_dart_extensions/vit_dart_extensions.dart';

extension ProjectExt on Project {
  Map<String, dynamic> get toMap {
    return {
      'id': id,
      'title': title,
    };
  }

  String get toIdentedJson {
    return toMap.prettyJSON;
  }
}

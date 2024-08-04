import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', useConstantCase: true)
abstract class Env {
  @EnviedField(varName: 'DISCORD_BOT_TOKEN')
  static const String discordBotToken = _Env.discordBotToken;

  @EnviedField(varName: 'DISCORD_BOT_PERMISSION')
  static const String discordBotPermission = _Env.discordBotPermission;
}

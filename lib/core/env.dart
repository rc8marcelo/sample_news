import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'NEWS_API_KEY')
  static const String apiKey = _Env.apiKey;
}

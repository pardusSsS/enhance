import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'ENHANCE_KEY', obfuscate: true)
  static final enhanceKey = _Env.enhanceKey.toString();
  @EnviedField(varName: 'ENHANCE_HOST', obfuscate: true)
  static final enhanceHost = _Env.enhanceHost.toString();
  @EnviedField(varName: 'ENHACE_URL', obfuscate: true)
  static final enhanceUrl = _Env.enhanceUrl.toString();
}

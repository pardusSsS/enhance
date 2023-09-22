import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  //enhance start
  @EnviedField(varName: 'ENHANCE_KEY', obfuscate: true)
  static final enhanceKey = _Env.enhanceKey.toString();
  @EnviedField(varName: 'ENHANCE_HOST', obfuscate: true)
  static final enhanceHost = _Env.enhanceHost.toString();
  @EnviedField(varName: 'ENHACE_URL', obfuscate: true)
  static final enhanceUrl = _Env.enhanceUrl.toString();
  //enhance finish

  //text-to-image start
  @EnviedField(varName: 'TEXT_TO_IMAGE_KEY', obfuscate: true)
  static final textToImageKey = _Env.textToImageKey.toString();
  @EnviedField(varName: 'TEXT_TO_IMAGE_HOST', obfuscate: true)
  static final textToImageHost = _Env.textToImageHost.toString();
  @EnviedField(varName: 'TEXT_TO_IMAGE_URL', obfuscate: true)
  static final textToImageUrl = _Env.textToImageUrl.toString();
  //text-to-image end

  //text-to-speech start
  @EnviedField(varName: 'TEXT_TO_SPEECH_KEY', obfuscate: true)
  static final textToSpeechKey = _Env.textToSpeechKey.toString();
  @EnviedField(varName: 'TEXT_TO_SPEECH_HOST', obfuscate: true)
  static final textToSpeechHost = _Env.textToSpeechHost.toString();
  @EnviedField(varName: 'TEXT_TO_SPEECH_URL', obfuscate: true)
  static final textToSpeechUrl = _Env.textToSpeechUrl.toString();
  //text-to-speech end

  //firestore start
  @EnviedField(varName: 'START_PACKET_LIMIT', obfuscate: true)
  static final startPacket = _Env.startPacket.toString();
  @EnviedField(varName: 'USER_USAGE_LIMIT', obfuscate: true)
  static final userUsage = _Env.userUsage.toString();
  //firestore end
}

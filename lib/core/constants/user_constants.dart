import 'package:enhance/core/base/model/first_usage_limit_model.dart';
import 'package:enhance/core/constants/app_constants.dart';

class AppUserConst {
  static String? userUid;

  //firestore
  static int? enhanceLimit;
  static int? textToSpeechLimit;
  static int? textToImageLimit;
  static int? converterLimit;

  static setUserUsageToLocal(UsageLimitModel data) {
    enhanceLimit = data.enhance;
    converterLimit = data.converter;
    textToImageLimit = data.textToImage;
    textToSpeechLimit = data.textToSpeech;
  }

  static Map<String, dynamic> sumUserUsages() {
    var sum = enhanceLimit! +
        converterLimit! +
        textToImageLimit! +
        textToSpeechLimit!;

    var perEnhance = (enhanceLimit! * 100) / sum;
    var perConverter = (enhanceLimit! * 100) / sum;
    var perTextToImage = (textToImageLimit! * 100) / sum;
    var perTextToSpeech = (textToSpeechLimit! * 100) / sum;

    return {
      "enhance": double.parse(perEnhance.toStringAsFixed(0)),
      "textToImage": double.parse(perTextToImage.toStringAsFixed(0)),
      "textToSpeech": double.parse(perTextToSpeech.toStringAsFixed(0)),
      "converter": double.parse(perConverter.toStringAsFixed(0)),
    };
  }
}

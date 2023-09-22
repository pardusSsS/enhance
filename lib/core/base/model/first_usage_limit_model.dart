import 'package:json_annotation/json_annotation.dart';

part 'first_usage_limit_model.g.dart';

@JsonSerializable()
class UsageLimitModel {
  late final int textToImage;
  late final int textToSpeech;
  late final int converter;
  late final int enhance;

  UsageLimitModel({
    required this.textToImage,
    required this.textToSpeech,
    required this.converter,
    required this.enhance,
  });

  factory UsageLimitModel.fromJson(Map<String, dynamic> json) =>
      _$UsageLimitModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsageLimitModelToJson(this);
}

class SetUsageLimitData {
  final int textToImage;
  final int textToSpeech;
  final int converter;
  final int enhance;

  SetUsageLimitData({
    required this.textToImage,
    required this.textToSpeech,
    required this.converter,
    required this.enhance,
  });

  Map<String, dynamic> toJson() {
    return {
      "textToImage": textToImage,
      "textToSpeech": textToSpeech,
      "converter": converter,
      "enhance": enhance,
    };
  }
}

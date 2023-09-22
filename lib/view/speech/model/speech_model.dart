import 'package:json_annotation/json_annotation.dart';

part 'speech_model.g.dart';

@JsonSerializable()
class SpeechModel {
  late final String id;
  late final String status;
  late final String url;

  SpeechModel({
    required this.id,
    required this.status,
    required this.url,
  });

  factory SpeechModel.fromJson(Map<String, dynamic> json) =>
      _$SpeechModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpeechModelToJson(this);
}

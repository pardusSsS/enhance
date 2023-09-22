// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speech_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeechModel _$SpeechModelFromJson(Map<String, dynamic> json) => SpeechModel(
      id: json['id'] as String,
      status: json['status'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$SpeechModelToJson(SpeechModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'url': instance.url,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_usage_limit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsageLimitModel _$UsageLimitModelFromJson(Map<String, dynamic> json) =>
    UsageLimitModel(
      textToImage: json['textToImage'] as int,
      textToSpeech: json['textToSpeech'] as int,
      converter: json['converter'] as int,
      enhance: json['enhance'] as int,
    );

Map<String, dynamic> _$UsageLimitModelToJson(UsageLimitModel instance) =>
    <String, dynamic>{
      'textToImage': instance.textToImage,
      'textToSpeech': instance.textToSpeech,
      'converter': instance.converter,
      'enhance': instance.enhance,
    };

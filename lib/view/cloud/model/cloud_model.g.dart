// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudModel _$CloudModelFromJson(Map<String, dynamic> json) => CloudModel(
      id: json['id'] as String,
      status: json['status'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$CloudModelToJson(CloudModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'url': instance.url,
    };

CloudErrorModel _$CloudErrorModelFromJson(Map<String, dynamic> json) =>
    CloudErrorModel(
      Status: json['Status'] as String,
      ETA: json['ETA'] as String,
    );

Map<String, dynamic> _$CloudErrorModelToJson(CloudErrorModel instance) =>
    <String, dynamic>{
      'Status': instance.Status,
      'ETA': instance.ETA,
    };

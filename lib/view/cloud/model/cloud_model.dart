import 'package:json_annotation/json_annotation.dart';

part 'cloud_model.g.dart';

@JsonSerializable()
class CloudModel {
  late final String id;
  late final String status;
  late final String url;

  CloudModel({
    required this.id,
    required this.status,
    required this.url,
  });

  factory CloudModel.fromJson(Map<String, dynamic> json) =>
      _$CloudModelFromJson(json);
}

@JsonSerializable()
class CloudErrorModel {
  late final String Status;
  late final String ETA;

  CloudErrorModel({
    required this.Status,
    required this.ETA,
  });

  factory CloudErrorModel.fromJson(Map<String, dynamic> json) =>
      _$CloudErrorModelFromJson(json);
}

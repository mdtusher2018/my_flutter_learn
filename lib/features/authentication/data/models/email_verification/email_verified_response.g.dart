// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verified_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmailVerifiedResponse _$EmailVerifiedResponseFromJson(
  Map<String, dynamic> json,
) => _EmailVerifiedResponse(
  status: json['status'] as String,
  statusCode: (json['statusCode'] as num).toInt(),
  message: json['message'] as String,
  data: EmailVerifiedData.fromJson(json['data'] as Map<String, dynamic>),
  errors: json['errors'] as List<dynamic>? ?? const [],
);

Map<String, dynamic> _$EmailVerifiedResponseToJson(
  _EmailVerifiedResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
};

_EmailVerifiedData _$EmailVerifiedDataFromJson(Map<String, dynamic> json) =>
    _EmailVerifiedData(
      type: json['type'] as String? ?? 'user',
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$EmailVerifiedDataToJson(_EmailVerifiedData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'accessToken': instance.accessToken,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    _SignupResponse(
      status: json['status'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: SignupData.fromJson(json['data'] as Map<String, dynamic>),
      errors: json['errors'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$SignupResponseToJson(_SignupResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
      'errors': instance.errors,
    };

_SignupData _$SignupDataFromJson(Map<String, dynamic> json) => _SignupData(
  type: json['type'] as String? ?? 'user',
  signUpToken: json['signUpToken'] as String,
);

Map<String, dynamic> _$SignupDataToJson(_SignupData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'signUpToken': instance.signUpToken,
    };

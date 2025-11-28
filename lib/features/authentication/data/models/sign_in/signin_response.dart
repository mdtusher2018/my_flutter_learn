// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_response.freezed.dart';
part 'signin_response.g.dart';

@freezed
abstract class SigninResponse with _$SigninResponse {
  const factory SigninResponse({
    required String status,
    required int statusCode,
    required String message,
    required DataModel data,
    required List<dynamic> errors,
  }) = _SigninResponse;

  factory SigninResponse.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseFromJson(json);
}

@freezed
abstract class DataModel with _$DataModel {
  const factory DataModel({
    required String? type,
    required Attributes attributes,
    required String accessToken,
  }) = _DataModel;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}

@freezed
abstract class Attributes with _$Attributes {
  const factory Attributes({required UserModel user}) = _Attributes;

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
}

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: '_id') required String id,
    required String fullName,
    required String email,
    required List<String> role,
    required String currentRole,
    required bool isAdmin,
    required bool isOwner,
    required String postalCode,
    required bool isBan,
    required bool isApproved,
    required String formatted_phone_number,
    required String formatted_address,
    required int totalDeal,
    required int totalSavings,
    required int visitedCityCount,
    required int visitedPlaceCount,
    required int givenReviewCount,
    required double avgrating,
    required int totalRatings,
    required String image,
    required String password,
    required String createdAt,
    required String updatedAt,
    @JsonKey(name: '__v') required int v,
    required String lastLogin,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

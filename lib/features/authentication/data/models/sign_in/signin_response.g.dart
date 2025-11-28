// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SigninResponse _$SigninResponseFromJson(Map<String, dynamic> json) =>
    _SigninResponse(
      status: json['status'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: DataModel.fromJson(json['data'] as Map<String, dynamic>),
      errors: json['errors'] as List<dynamic>,
    );

Map<String, dynamic> _$SigninResponseToJson(_SigninResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
      'errors': instance.errors,
    };

_DataModel _$DataModelFromJson(Map<String, dynamic> json) => _DataModel(
  type: json['type'] as String?,
  attributes: Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
  accessToken: json['accessToken'] as String,
);

Map<String, dynamic> _$DataModelToJson(_DataModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'attributes': instance.attributes,
      'accessToken': instance.accessToken,
    };

_Attributes _$AttributesFromJson(Map<String, dynamic> json) =>
    _Attributes(user: UserModel.fromJson(json['user'] as Map<String, dynamic>));

Map<String, dynamic> _$AttributesToJson(_Attributes instance) =>
    <String, dynamic>{'user': instance.user};

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['_id'] as String,
  fullName: json['fullName'] as String,
  email: json['email'] as String,
  role: (json['role'] as List<dynamic>).map((e) => e as String).toList(),
  currentRole: json['currentRole'] as String,
  isAdmin: json['isAdmin'] as bool,
  isOwner: json['isOwner'] as bool,
  postalCode: json['postalCode'] as String,
  isBan: json['isBan'] as bool,
  isApproved: json['isApproved'] as bool,
  formatted_phone_number: json['formatted_phone_number'] as String,
  formatted_address: json['formatted_address'] as String,
  totalDeal: (json['totalDeal'] as num).toInt(),
  totalSavings: (json['totalSavings'] as num).toInt(),
  visitedCityCount: (json['visitedCityCount'] as num).toInt(),
  visitedPlaceCount: (json['visitedPlaceCount'] as num).toInt(),
  givenReviewCount: (json['givenReviewCount'] as num).toInt(),
  avgrating: (json['avgrating'] as num).toDouble(),
  totalRatings: (json['totalRatings'] as num).toInt(),
  image: json['image'] as String,
  password: json['password'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  v: (json['__v'] as num).toInt(),
  lastLogin: json['lastLogin'] as String,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'role': instance.role,
      'currentRole': instance.currentRole,
      'isAdmin': instance.isAdmin,
      'isOwner': instance.isOwner,
      'postalCode': instance.postalCode,
      'isBan': instance.isBan,
      'isApproved': instance.isApproved,
      'formatted_phone_number': instance.formatted_phone_number,
      'formatted_address': instance.formatted_address,
      'totalDeal': instance.totalDeal,
      'totalSavings': instance.totalSavings,
      'visitedCityCount': instance.visitedCityCount,
      'visitedPlaceCount': instance.visitedPlaceCount,
      'givenReviewCount': instance.givenReviewCount,
      'avgrating': instance.avgrating,
      'totalRatings': instance.totalRatings,
      'image': instance.image,
      'password': instance.password,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'lastLogin': instance.lastLogin,
    };

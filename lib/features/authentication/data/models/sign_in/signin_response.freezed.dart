// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SigninResponse {

 String get status; int get statusCode; String get message; DataModel get data; List<dynamic> get errors;
/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SigninResponseCopyWith<SigninResponse> get copyWith => _$SigninResponseCopyWithImpl<SigninResponse>(this as SigninResponse, _$identity);

  /// Serializes this SigninResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SigninResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,statusCode,message,data,const DeepCollectionEquality().hash(errors));

@override
String toString() {
  return 'SigninResponse(status: $status, statusCode: $statusCode, message: $message, data: $data, errors: $errors)';
}


}

/// @nodoc
abstract mixin class $SigninResponseCopyWith<$Res>  {
  factory $SigninResponseCopyWith(SigninResponse value, $Res Function(SigninResponse) _then) = _$SigninResponseCopyWithImpl;
@useResult
$Res call({
 String status, int statusCode, String message, DataModel data, List<dynamic> errors
});


$DataModelCopyWith<$Res> get data;

}
/// @nodoc
class _$SigninResponseCopyWithImpl<$Res>
    implements $SigninResponseCopyWith<$Res> {
  _$SigninResponseCopyWithImpl(this._self, this._then);

  final SigninResponse _self;
  final $Res Function(SigninResponse) _then;

/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? statusCode = null,Object? message = null,Object? data = null,Object? errors = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DataModel,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}
/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataModelCopyWith<$Res> get data {
  
  return $DataModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SigninResponse].
extension SigninResponsePatterns on SigninResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SigninResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SigninResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SigninResponse value)  $default,){
final _that = this;
switch (_that) {
case _SigninResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SigninResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SigninResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  int statusCode,  String message,  DataModel data,  List<dynamic> errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SigninResponse() when $default != null:
return $default(_that.status,_that.statusCode,_that.message,_that.data,_that.errors);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  int statusCode,  String message,  DataModel data,  List<dynamic> errors)  $default,) {final _that = this;
switch (_that) {
case _SigninResponse():
return $default(_that.status,_that.statusCode,_that.message,_that.data,_that.errors);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  int statusCode,  String message,  DataModel data,  List<dynamic> errors)?  $default,) {final _that = this;
switch (_that) {
case _SigninResponse() when $default != null:
return $default(_that.status,_that.statusCode,_that.message,_that.data,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SigninResponse implements SigninResponse {
  const _SigninResponse({required this.status, required this.statusCode, required this.message, required this.data, required final  List<dynamic> errors}): _errors = errors;
  factory _SigninResponse.fromJson(Map<String, dynamic> json) => _$SigninResponseFromJson(json);

@override final  String status;
@override final  int statusCode;
@override final  String message;
@override final  DataModel data;
 final  List<dynamic> _errors;
@override List<dynamic> get errors {
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_errors);
}


/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SigninResponseCopyWith<_SigninResponse> get copyWith => __$SigninResponseCopyWithImpl<_SigninResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SigninResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SigninResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other._errors, _errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,statusCode,message,data,const DeepCollectionEquality().hash(_errors));

@override
String toString() {
  return 'SigninResponse(status: $status, statusCode: $statusCode, message: $message, data: $data, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$SigninResponseCopyWith<$Res> implements $SigninResponseCopyWith<$Res> {
  factory _$SigninResponseCopyWith(_SigninResponse value, $Res Function(_SigninResponse) _then) = __$SigninResponseCopyWithImpl;
@override @useResult
$Res call({
 String status, int statusCode, String message, DataModel data, List<dynamic> errors
});


@override $DataModelCopyWith<$Res> get data;

}
/// @nodoc
class __$SigninResponseCopyWithImpl<$Res>
    implements _$SigninResponseCopyWith<$Res> {
  __$SigninResponseCopyWithImpl(this._self, this._then);

  final _SigninResponse _self;
  final $Res Function(_SigninResponse) _then;

/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? statusCode = null,Object? message = null,Object? data = null,Object? errors = null,}) {
  return _then(_SigninResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DataModel,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

/// Create a copy of SigninResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataModelCopyWith<$Res> get data {
  
  return $DataModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$DataModel {

 String? get type; Attributes get attributes; String get accessToken;
/// Create a copy of DataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataModelCopyWith<DataModel> get copyWith => _$DataModelCopyWithImpl<DataModel>(this as DataModel, _$identity);

  /// Serializes this DataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataModel&&(identical(other.type, type) || other.type == type)&&(identical(other.attributes, attributes) || other.attributes == attributes)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,attributes,accessToken);

@override
String toString() {
  return 'DataModel(type: $type, attributes: $attributes, accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class $DataModelCopyWith<$Res>  {
  factory $DataModelCopyWith(DataModel value, $Res Function(DataModel) _then) = _$DataModelCopyWithImpl;
@useResult
$Res call({
 String? type, Attributes attributes, String accessToken
});


$AttributesCopyWith<$Res> get attributes;

}
/// @nodoc
class _$DataModelCopyWithImpl<$Res>
    implements $DataModelCopyWith<$Res> {
  _$DataModelCopyWithImpl(this._self, this._then);

  final DataModel _self;
  final $Res Function(DataModel) _then;

/// Create a copy of DataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? attributes = null,Object? accessToken = null,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Attributes,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of DataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttributesCopyWith<$Res> get attributes {
  
  return $AttributesCopyWith<$Res>(_self.attributes, (value) {
    return _then(_self.copyWith(attributes: value));
  });
}
}


/// Adds pattern-matching-related methods to [DataModel].
extension DataModelPatterns on DataModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataModel value)  $default,){
final _that = this;
switch (_that) {
case _DataModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataModel value)?  $default,){
final _that = this;
switch (_that) {
case _DataModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? type,  Attributes attributes,  String accessToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataModel() when $default != null:
return $default(_that.type,_that.attributes,_that.accessToken);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? type,  Attributes attributes,  String accessToken)  $default,) {final _that = this;
switch (_that) {
case _DataModel():
return $default(_that.type,_that.attributes,_that.accessToken);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? type,  Attributes attributes,  String accessToken)?  $default,) {final _that = this;
switch (_that) {
case _DataModel() when $default != null:
return $default(_that.type,_that.attributes,_that.accessToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DataModel implements DataModel {
  const _DataModel({required this.type, required this.attributes, required this.accessToken});
  factory _DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);

@override final  String? type;
@override final  Attributes attributes;
@override final  String accessToken;

/// Create a copy of DataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataModelCopyWith<_DataModel> get copyWith => __$DataModelCopyWithImpl<_DataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataModel&&(identical(other.type, type) || other.type == type)&&(identical(other.attributes, attributes) || other.attributes == attributes)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,attributes,accessToken);

@override
String toString() {
  return 'DataModel(type: $type, attributes: $attributes, accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class _$DataModelCopyWith<$Res> implements $DataModelCopyWith<$Res> {
  factory _$DataModelCopyWith(_DataModel value, $Res Function(_DataModel) _then) = __$DataModelCopyWithImpl;
@override @useResult
$Res call({
 String? type, Attributes attributes, String accessToken
});


@override $AttributesCopyWith<$Res> get attributes;

}
/// @nodoc
class __$DataModelCopyWithImpl<$Res>
    implements _$DataModelCopyWith<$Res> {
  __$DataModelCopyWithImpl(this._self, this._then);

  final _DataModel _self;
  final $Res Function(_DataModel) _then;

/// Create a copy of DataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? attributes = null,Object? accessToken = null,}) {
  return _then(_DataModel(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Attributes,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttributesCopyWith<$Res> get attributes {
  
  return $AttributesCopyWith<$Res>(_self.attributes, (value) {
    return _then(_self.copyWith(attributes: value));
  });
}
}


/// @nodoc
mixin _$Attributes {

 UserModel get user;
/// Create a copy of Attributes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttributesCopyWith<Attributes> get copyWith => _$AttributesCopyWithImpl<Attributes>(this as Attributes, _$identity);

  /// Serializes this Attributes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Attributes&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'Attributes(user: $user)';
}


}

/// @nodoc
abstract mixin class $AttributesCopyWith<$Res>  {
  factory $AttributesCopyWith(Attributes value, $Res Function(Attributes) _then) = _$AttributesCopyWithImpl;
@useResult
$Res call({
 UserModel user
});


$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$AttributesCopyWithImpl<$Res>
    implements $AttributesCopyWith<$Res> {
  _$AttributesCopyWithImpl(this._self, this._then);

  final Attributes _self;
  final $Res Function(Attributes) _then;

/// Create a copy of Attributes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}
/// Create a copy of Attributes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [Attributes].
extension AttributesPatterns on Attributes {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Attributes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Attributes() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Attributes value)  $default,){
final _that = this;
switch (_that) {
case _Attributes():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Attributes value)?  $default,){
final _that = this;
switch (_that) {
case _Attributes() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserModel user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Attributes() when $default != null:
return $default(_that.user);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserModel user)  $default,) {final _that = this;
switch (_that) {
case _Attributes():
return $default(_that.user);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserModel user)?  $default,) {final _that = this;
switch (_that) {
case _Attributes() when $default != null:
return $default(_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Attributes implements Attributes {
  const _Attributes({required this.user});
  factory _Attributes.fromJson(Map<String, dynamic> json) => _$AttributesFromJson(json);

@override final  UserModel user;

/// Create a copy of Attributes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttributesCopyWith<_Attributes> get copyWith => __$AttributesCopyWithImpl<_Attributes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttributesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Attributes&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'Attributes(user: $user)';
}


}

/// @nodoc
abstract mixin class _$AttributesCopyWith<$Res> implements $AttributesCopyWith<$Res> {
  factory _$AttributesCopyWith(_Attributes value, $Res Function(_Attributes) _then) = __$AttributesCopyWithImpl;
@override @useResult
$Res call({
 UserModel user
});


@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$AttributesCopyWithImpl<$Res>
    implements _$AttributesCopyWith<$Res> {
  __$AttributesCopyWithImpl(this._self, this._then);

  final _Attributes _self;
  final $Res Function(_Attributes) _then;

/// Create a copy of Attributes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Attributes(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}

/// Create a copy of Attributes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$UserModel {

@JsonKey(name: '_id') String get id; String get fullName; String get email; List<String> get role; String get currentRole; bool get isAdmin; bool get isOwner; String get postalCode; bool get isBan; bool get isApproved; String get formatted_phone_number; String get formatted_address; int get totalDeal; int get totalSavings; int get visitedCityCount; int get visitedPlaceCount; int get givenReviewCount; double get avgrating; int get totalRatings; String get image; String get password; String get createdAt; String get updatedAt;@JsonKey(name: '__v') int get v; String get lastLogin;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.role, role)&&(identical(other.currentRole, currentRole) || other.currentRole == currentRole)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.isOwner, isOwner) || other.isOwner == isOwner)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.isBan, isBan) || other.isBan == isBan)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved)&&(identical(other.formatted_phone_number, formatted_phone_number) || other.formatted_phone_number == formatted_phone_number)&&(identical(other.formatted_address, formatted_address) || other.formatted_address == formatted_address)&&(identical(other.totalDeal, totalDeal) || other.totalDeal == totalDeal)&&(identical(other.totalSavings, totalSavings) || other.totalSavings == totalSavings)&&(identical(other.visitedCityCount, visitedCityCount) || other.visitedCityCount == visitedCityCount)&&(identical(other.visitedPlaceCount, visitedPlaceCount) || other.visitedPlaceCount == visitedPlaceCount)&&(identical(other.givenReviewCount, givenReviewCount) || other.givenReviewCount == givenReviewCount)&&(identical(other.avgrating, avgrating) || other.avgrating == avgrating)&&(identical(other.totalRatings, totalRatings) || other.totalRatings == totalRatings)&&(identical(other.image, image) || other.image == image)&&(identical(other.password, password) || other.password == password)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.v, v) || other.v == v)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,fullName,email,const DeepCollectionEquality().hash(role),currentRole,isAdmin,isOwner,postalCode,isBan,isApproved,formatted_phone_number,formatted_address,totalDeal,totalSavings,visitedCityCount,visitedPlaceCount,givenReviewCount,avgrating,totalRatings,image,password,createdAt,updatedAt,v,lastLogin]);

@override
String toString() {
  return 'UserModel(id: $id, fullName: $fullName, email: $email, role: $role, currentRole: $currentRole, isAdmin: $isAdmin, isOwner: $isOwner, postalCode: $postalCode, isBan: $isBan, isApproved: $isApproved, formatted_phone_number: $formatted_phone_number, formatted_address: $formatted_address, totalDeal: $totalDeal, totalSavings: $totalSavings, visitedCityCount: $visitedCityCount, visitedPlaceCount: $visitedPlaceCount, givenReviewCount: $givenReviewCount, avgrating: $avgrating, totalRatings: $totalRatings, image: $image, password: $password, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, lastLogin: $lastLogin)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String fullName, String email, List<String> role, String currentRole, bool isAdmin, bool isOwner, String postalCode, bool isBan, bool isApproved, String formatted_phone_number, String formatted_address, int totalDeal, int totalSavings, int visitedCityCount, int visitedPlaceCount, int givenReviewCount, double avgrating, int totalRatings, String image, String password, String createdAt, String updatedAt,@JsonKey(name: '__v') int v, String lastLogin
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? email = null,Object? role = null,Object? currentRole = null,Object? isAdmin = null,Object? isOwner = null,Object? postalCode = null,Object? isBan = null,Object? isApproved = null,Object? formatted_phone_number = null,Object? formatted_address = null,Object? totalDeal = null,Object? totalSavings = null,Object? visitedCityCount = null,Object? visitedPlaceCount = null,Object? givenReviewCount = null,Object? avgrating = null,Object? totalRatings = null,Object? image = null,Object? password = null,Object? createdAt = null,Object? updatedAt = null,Object? v = null,Object? lastLogin = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as List<String>,currentRole: null == currentRole ? _self.currentRole : currentRole // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,isBan: null == isBan ? _self.isBan : isBan // ignore: cast_nullable_to_non_nullable
as bool,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,formatted_phone_number: null == formatted_phone_number ? _self.formatted_phone_number : formatted_phone_number // ignore: cast_nullable_to_non_nullable
as String,formatted_address: null == formatted_address ? _self.formatted_address : formatted_address // ignore: cast_nullable_to_non_nullable
as String,totalDeal: null == totalDeal ? _self.totalDeal : totalDeal // ignore: cast_nullable_to_non_nullable
as int,totalSavings: null == totalSavings ? _self.totalSavings : totalSavings // ignore: cast_nullable_to_non_nullable
as int,visitedCityCount: null == visitedCityCount ? _self.visitedCityCount : visitedCityCount // ignore: cast_nullable_to_non_nullable
as int,visitedPlaceCount: null == visitedPlaceCount ? _self.visitedPlaceCount : visitedPlaceCount // ignore: cast_nullable_to_non_nullable
as int,givenReviewCount: null == givenReviewCount ? _self.givenReviewCount : givenReviewCount // ignore: cast_nullable_to_non_nullable
as int,avgrating: null == avgrating ? _self.avgrating : avgrating // ignore: cast_nullable_to_non_nullable
as double,totalRatings: null == totalRatings ? _self.totalRatings : totalRatings // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,v: null == v ? _self.v : v // ignore: cast_nullable_to_non_nullable
as int,lastLogin: null == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String fullName,  String email,  List<String> role,  String currentRole,  bool isAdmin,  bool isOwner,  String postalCode,  bool isBan,  bool isApproved,  String formatted_phone_number,  String formatted_address,  int totalDeal,  int totalSavings,  int visitedCityCount,  int visitedPlaceCount,  int givenReviewCount,  double avgrating,  int totalRatings,  String image,  String password,  String createdAt,  String updatedAt, @JsonKey(name: '__v')  int v,  String lastLogin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.role,_that.currentRole,_that.isAdmin,_that.isOwner,_that.postalCode,_that.isBan,_that.isApproved,_that.formatted_phone_number,_that.formatted_address,_that.totalDeal,_that.totalSavings,_that.visitedCityCount,_that.visitedPlaceCount,_that.givenReviewCount,_that.avgrating,_that.totalRatings,_that.image,_that.password,_that.createdAt,_that.updatedAt,_that.v,_that.lastLogin);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String fullName,  String email,  List<String> role,  String currentRole,  bool isAdmin,  bool isOwner,  String postalCode,  bool isBan,  bool isApproved,  String formatted_phone_number,  String formatted_address,  int totalDeal,  int totalSavings,  int visitedCityCount,  int visitedPlaceCount,  int givenReviewCount,  double avgrating,  int totalRatings,  String image,  String password,  String createdAt,  String updatedAt, @JsonKey(name: '__v')  int v,  String lastLogin)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.fullName,_that.email,_that.role,_that.currentRole,_that.isAdmin,_that.isOwner,_that.postalCode,_that.isBan,_that.isApproved,_that.formatted_phone_number,_that.formatted_address,_that.totalDeal,_that.totalSavings,_that.visitedCityCount,_that.visitedPlaceCount,_that.givenReviewCount,_that.avgrating,_that.totalRatings,_that.image,_that.password,_that.createdAt,_that.updatedAt,_that.v,_that.lastLogin);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String fullName,  String email,  List<String> role,  String currentRole,  bool isAdmin,  bool isOwner,  String postalCode,  bool isBan,  bool isApproved,  String formatted_phone_number,  String formatted_address,  int totalDeal,  int totalSavings,  int visitedCityCount,  int visitedPlaceCount,  int givenReviewCount,  double avgrating,  int totalRatings,  String image,  String password,  String createdAt,  String updatedAt, @JsonKey(name: '__v')  int v,  String lastLogin)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.role,_that.currentRole,_that.isAdmin,_that.isOwner,_that.postalCode,_that.isBan,_that.isApproved,_that.formatted_phone_number,_that.formatted_address,_that.totalDeal,_that.totalSavings,_that.visitedCityCount,_that.visitedPlaceCount,_that.givenReviewCount,_that.avgrating,_that.totalRatings,_that.image,_that.password,_that.createdAt,_that.updatedAt,_that.v,_that.lastLogin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({@JsonKey(name: '_id') required this.id, required this.fullName, required this.email, required final  List<String> role, required this.currentRole, required this.isAdmin, required this.isOwner, required this.postalCode, required this.isBan, required this.isApproved, required this.formatted_phone_number, required this.formatted_address, required this.totalDeal, required this.totalSavings, required this.visitedCityCount, required this.visitedPlaceCount, required this.givenReviewCount, required this.avgrating, required this.totalRatings, required this.image, required this.password, required this.createdAt, required this.updatedAt, @JsonKey(name: '__v') required this.v, required this.lastLogin}): _role = role;
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String fullName;
@override final  String email;
 final  List<String> _role;
@override List<String> get role {
  if (_role is EqualUnmodifiableListView) return _role;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_role);
}

@override final  String currentRole;
@override final  bool isAdmin;
@override final  bool isOwner;
@override final  String postalCode;
@override final  bool isBan;
@override final  bool isApproved;
@override final  String formatted_phone_number;
@override final  String formatted_address;
@override final  int totalDeal;
@override final  int totalSavings;
@override final  int visitedCityCount;
@override final  int visitedPlaceCount;
@override final  int givenReviewCount;
@override final  double avgrating;
@override final  int totalRatings;
@override final  String image;
@override final  String password;
@override final  String createdAt;
@override final  String updatedAt;
@override@JsonKey(name: '__v') final  int v;
@override final  String lastLogin;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other._role, _role)&&(identical(other.currentRole, currentRole) || other.currentRole == currentRole)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.isOwner, isOwner) || other.isOwner == isOwner)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.isBan, isBan) || other.isBan == isBan)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved)&&(identical(other.formatted_phone_number, formatted_phone_number) || other.formatted_phone_number == formatted_phone_number)&&(identical(other.formatted_address, formatted_address) || other.formatted_address == formatted_address)&&(identical(other.totalDeal, totalDeal) || other.totalDeal == totalDeal)&&(identical(other.totalSavings, totalSavings) || other.totalSavings == totalSavings)&&(identical(other.visitedCityCount, visitedCityCount) || other.visitedCityCount == visitedCityCount)&&(identical(other.visitedPlaceCount, visitedPlaceCount) || other.visitedPlaceCount == visitedPlaceCount)&&(identical(other.givenReviewCount, givenReviewCount) || other.givenReviewCount == givenReviewCount)&&(identical(other.avgrating, avgrating) || other.avgrating == avgrating)&&(identical(other.totalRatings, totalRatings) || other.totalRatings == totalRatings)&&(identical(other.image, image) || other.image == image)&&(identical(other.password, password) || other.password == password)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.v, v) || other.v == v)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,fullName,email,const DeepCollectionEquality().hash(_role),currentRole,isAdmin,isOwner,postalCode,isBan,isApproved,formatted_phone_number,formatted_address,totalDeal,totalSavings,visitedCityCount,visitedPlaceCount,givenReviewCount,avgrating,totalRatings,image,password,createdAt,updatedAt,v,lastLogin]);

@override
String toString() {
  return 'UserModel(id: $id, fullName: $fullName, email: $email, role: $role, currentRole: $currentRole, isAdmin: $isAdmin, isOwner: $isOwner, postalCode: $postalCode, isBan: $isBan, isApproved: $isApproved, formatted_phone_number: $formatted_phone_number, formatted_address: $formatted_address, totalDeal: $totalDeal, totalSavings: $totalSavings, visitedCityCount: $visitedCityCount, visitedPlaceCount: $visitedPlaceCount, givenReviewCount: $givenReviewCount, avgrating: $avgrating, totalRatings: $totalRatings, image: $image, password: $password, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, lastLogin: $lastLogin)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String fullName, String email, List<String> role, String currentRole, bool isAdmin, bool isOwner, String postalCode, bool isBan, bool isApproved, String formatted_phone_number, String formatted_address, int totalDeal, int totalSavings, int visitedCityCount, int visitedPlaceCount, int givenReviewCount, double avgrating, int totalRatings, String image, String password, String createdAt, String updatedAt,@JsonKey(name: '__v') int v, String lastLogin
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? email = null,Object? role = null,Object? currentRole = null,Object? isAdmin = null,Object? isOwner = null,Object? postalCode = null,Object? isBan = null,Object? isApproved = null,Object? formatted_phone_number = null,Object? formatted_address = null,Object? totalDeal = null,Object? totalSavings = null,Object? visitedCityCount = null,Object? visitedPlaceCount = null,Object? givenReviewCount = null,Object? avgrating = null,Object? totalRatings = null,Object? image = null,Object? password = null,Object? createdAt = null,Object? updatedAt = null,Object? v = null,Object? lastLogin = null,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self._role : role // ignore: cast_nullable_to_non_nullable
as List<String>,currentRole: null == currentRole ? _self.currentRole : currentRole // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,isBan: null == isBan ? _self.isBan : isBan // ignore: cast_nullable_to_non_nullable
as bool,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,formatted_phone_number: null == formatted_phone_number ? _self.formatted_phone_number : formatted_phone_number // ignore: cast_nullable_to_non_nullable
as String,formatted_address: null == formatted_address ? _self.formatted_address : formatted_address // ignore: cast_nullable_to_non_nullable
as String,totalDeal: null == totalDeal ? _self.totalDeal : totalDeal // ignore: cast_nullable_to_non_nullable
as int,totalSavings: null == totalSavings ? _self.totalSavings : totalSavings // ignore: cast_nullable_to_non_nullable
as int,visitedCityCount: null == visitedCityCount ? _self.visitedCityCount : visitedCityCount // ignore: cast_nullable_to_non_nullable
as int,visitedPlaceCount: null == visitedPlaceCount ? _self.visitedPlaceCount : visitedPlaceCount // ignore: cast_nullable_to_non_nullable
as int,givenReviewCount: null == givenReviewCount ? _self.givenReviewCount : givenReviewCount // ignore: cast_nullable_to_non_nullable
as int,avgrating: null == avgrating ? _self.avgrating : avgrating // ignore: cast_nullable_to_non_nullable
as double,totalRatings: null == totalRatings ? _self.totalRatings : totalRatings // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,v: null == v ? _self.v : v // ignore: cast_nullable_to_non_nullable
as int,lastLogin: null == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

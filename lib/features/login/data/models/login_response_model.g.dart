// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserData _$LoginUserDataFromJson(Map<String, dynamic> json) =>
    LoginUserData(
      token: json['token'] as String?,
      userName: json['username'] as String?,
    );

Map<String, dynamic> _$LoginUserDataToJson(LoginUserData instance) =>
    <String, dynamic>{'token': instance.token, 'username': instance.userName};

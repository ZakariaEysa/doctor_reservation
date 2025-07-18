// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserData _$RegisterUserDataFromJson(Map<String, dynamic> json) =>
    RegisterUserData(
      token: json['token'] as String?,
      userName: json['username'] as String?,
    );

Map<String, dynamic> _$RegisterUserDataToJson(RegisterUserData instance) =>
    <String, dynamic>{'token': instance.token, 'username': instance.userName};

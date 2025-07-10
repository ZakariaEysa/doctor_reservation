// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestBody _$RegisterRequestBodyFromJson(Map<String, dynamic> json) =>
    RegisterRequestBody(
      phone: json['phone'] as String,
      confirmPassword: json['password_confirmation'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      gender: (json['gender'] as num).toInt(),
    );

Map<String, dynamic> _$RegisterRequestBodyToJson(
  RegisterRequestBody instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'password': instance.password,
  'password_confirmation': instance.confirmPassword,
  'phone': instance.phone,
  'gender': instance.gender,
};

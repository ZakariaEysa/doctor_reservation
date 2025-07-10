import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String name;
  final String email;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String confirmPassword;
  final String phone;
      
  final int gender;

  RegisterRequestBody({
    required this.phone,
    required this.confirmPassword,
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
  });

 Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);

}
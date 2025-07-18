import 'package:json_annotation/json_annotation.dart';
part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterUserData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  RegisterUserData({this.token, this.userName});

  factory RegisterUserData.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserDataFromJson(json);
}

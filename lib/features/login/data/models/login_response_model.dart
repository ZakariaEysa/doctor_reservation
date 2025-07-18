import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';



@JsonSerializable()
class LoginUserData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  LoginUserData({this.token, this.userName});

  factory LoginUserData.fromJson(Map<String, dynamic> json) =>
      _$LoginUserDataFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';

part 'signUpRequest.g.dart';

@JsonSerializable()
class SignUpRequest {
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "age")
  int? age;

  SignUpRequest({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.password,
    this.gender,
    this.age,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}

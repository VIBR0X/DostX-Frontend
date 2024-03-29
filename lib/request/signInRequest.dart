import 'package:json_annotation/json_annotation.dart';

part 'signInRequest.g.dart';

@JsonSerializable()
class SignInRequest {
  @JsonKey(name: "phone_number")
  String? phoneNumber;

  SignInRequest({
    this.phoneNumber,
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}

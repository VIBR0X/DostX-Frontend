import 'package:json_annotation/json_annotation.dart';
part 'signUpResponse.g.dart';

@JsonSerializable()
class SignUpResponse {
  String? refresh;
  String? access;
  dynamic userProfile; // This field can be of any type depending on your user profile structure

  SignUpResponse({
    this.refresh,
    this.access,
    this.userProfile,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
part 'signInResponse.g.dart';

@JsonSerializable()
class SignInResponse {
  String? refresh;


  SignInResponse({
    this.refresh,

  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}

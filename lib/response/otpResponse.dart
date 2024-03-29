import 'package:json_annotation/json_annotation.dart';
part 'otpResponse.g.dart';

@JsonSerializable()
class otpResponse {
  bool? key;
  otpResponse({
    this.key,
  });

  factory otpResponse.fromJson(Map<String, dynamic> json) =>
      _$otpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$otpResponseToJson(this);
}

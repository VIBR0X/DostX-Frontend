import 'package:json_annotation/json_annotation.dart';

part 'otpVer.g.dart';

@JsonSerializable()
class otpVerRequest {
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  @JsonKey(name: "otp")
  String? otp;

  otpVerRequest({
    this.phoneNumber,
    this.otp
  });

  factory otpVerRequest.fromJson(Map<String, dynamic> json) =>
      _$otpVerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$otpVerRequestToJson(this);
}

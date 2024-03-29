// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otpVer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

otpVerRequest _$otpVerRequestFromJson(Map<String, dynamic> json) =>
    otpVerRequest(
      phoneNumber: json['phone_number'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$otpVerRequestToJson(otpVerRequest instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'otp': instance.otp,
    };

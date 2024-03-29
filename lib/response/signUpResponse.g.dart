// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signUpResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
      userProfile: json['userProfile'],
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
      'userProfile': instance.userProfile,
    };

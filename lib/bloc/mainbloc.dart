import 'package:dostx/request/otpVer.dart';
import 'package:dostx/request/signInRequest.dart';
import 'package:dostx/response/otpResponse.dart';

import '../api/apiclient.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../request/signUpRequest.dart';
import '../response/signUpResponse.dart';
class mainBloc {
  late final ApiClient client;
  final dio = Dio();
  mainBloc() {
    client = ApiClient(dio);
  }
  Future<void> signupBloc(SignUpRequest sr) async {
    await client.postSignUpCred(sr, "application/json");
  }
  Future<void> signInBloc(SignInRequest sir) async{
    await client.verifyPhone(sir, "application/json");
  }
  Future<otpResponse> otpBloc(otpVerRequest vr) async{
    return await client.otpVer(vr, "application/json");

  }
}
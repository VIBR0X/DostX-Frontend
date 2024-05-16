import 'package:dio/dio.dart';
import 'package:dostx/request/otpVer.dart';
import 'package:dostx/pages/sign_in.dart';
import 'package:retrofit/retrofit.dart' as rt;
import '../response/signUpResponse.dart';
import '../request/signUpRequest.dart';
import '../request/signInRequest.dart';
import '../response/otpResponse.dart';
import '../response/signInResponse.dart';
part 'apiclient.g.dart';

@rt.RestApi(baseUrl: 'https://dostx-backend-528cb862fde5.herokuapp.com')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  @rt.POST('/auth/signup/')
  Future<SignUpResponse> postSignUpCred(@rt.Body() SignUpRequest, @rt.Header("Content-Type") String content_type);
  @rt.POST('/auth/verify_phone/')
  Future<SignInResponse> verifyPhone(@rt.Body() SignInRequest, @rt.Header("Content-Type") String content_type);
  @rt.POST('/auth/verify_otp/')
  Future<otpResponse> otpVer(@rt.Body() otpVerRequest, @rt.Header("Content-Type") String content_type);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiclient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://dostx-backend-528cb862fde5.herokuapp.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SignUpResponse> postSignUpCred(
    dynamic SignUpRequest,
    String content_type,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Content-Type': content_type};
    _headers.removeWhere((k, v) => v == null);
    final _data = SignUpRequest;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SignUpResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: content_type,
    )
            .compose(
              _dio.options,
              '/auth/signup/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = SignUpResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SignInResponse> verifyPhone(
    dynamic SignInRequest,
    String content_type,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Content-Type': content_type};
    _headers.removeWhere((k, v) => v == null);
    final _data = SignInRequest;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SignInResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: content_type,
    )
            .compose(
              _dio.options,
              '/auth/verify_phone/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = SignInResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<otpResponse> otpVer(
    dynamic otpVerRequest,
    String content_type,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Content-Type': content_type};
    _headers.removeWhere((k, v) => v == null);
    final _data = otpVerRequest;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<otpResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: content_type,
    )
            .compose(
              _dio.options,
              '/auth/verify_otp/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = otpResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

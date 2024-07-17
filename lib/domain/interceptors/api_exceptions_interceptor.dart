import 'dart:async';
import 'dart:io';

import 'package:template_app/core/error/exceptions/exceptions.dart';
import 'package:template_app/core/res/strings/strings.dart';
import 'package:chopper/chopper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_app/presentation/viewmodel/auth/auth_viewmodel.dart';

//TODO://Interceptors

class ApiExceptionsInterceptor implements ResponseInterceptor {
  final Ref _ref;

  ApiExceptionsInterceptor(this._ref);

  @override
  FutureOr<Response> onResponse(Response response) {
    try {
      validateResponse(response);
    } catch (error) {
      if (error is ApiException || error is UnexpectedException) {
        rethrow;
      } else if (error is TokenExpiredException) {
        throw TokenExpiredException(Strings.sessionExpiry);
      } else if (error is ClientException) {
        throw ClientException(Strings.clientError);
      } else if (error is SocketException) {
        throw SocketException(Strings.youAreOffline);
      } else {
        throw UnexpectedException(Strings.anUnexpectedError);
      }
    }
    return response;
  }

  void validateResponse(Response response) {
 
  }

  Future<void> handleTokenExpiry() async {
    print("Before Token Expiry");
    _ref.read(AuthViewModel.provider.notifier).refreshToken();
    print("After Token Expiry");
    // throw TokenExpiredException(Strings.translated.sessionExpiry);
  }
}

String getErrorMessage(dynamic error) {
  if (error is Map) {
    return error['errorMessage'] ?? Strings.anUnexpectedError;
  }
  return error ?? Strings.anUnexpectedError;
}

import 'dart:async';
import 'package:template_app/core/error/exceptions/exceptions.dart';
import 'package:chopper/chopper.dart';
import 'package:template_app/core/res/strings/strings.dart';
import 'package:template_app/data/datasource/local/user_local_datasource.dart';

class ApiAuthInterceptor implements RequestInterceptor {
  ApiAuthInterceptor(this._localDataSource);

  final UserLocalDataSource _localDataSource;

  @override
  FutureOr<Request> onRequest(Request request) {
    if (_shouldIgnoreTokenizedRequests(request)) return request;
    // final deviceInfo = _localDataSource.getDeviceInfo();
    // final currentUser = _localDataSource.getCurrentUser();
    // final authData = (deviceInfo ?? currentUser);
    String? token = 'Token!!';

    if (token != null) {
      return applyHeader(request, 'Authorization', 'Bearer $token');
    }

    throw InvalidCredentialsException(Strings.requestUnauthorized);
  }

  bool _shouldIgnoreTokenizedRequests(Request request) {
    final requestPaths = request.uri.pathSegments;
    return (requestPaths.contains("auth") && requestPaths.contains("client")) ||
        requestPaths.contains('refresh');
  }
}

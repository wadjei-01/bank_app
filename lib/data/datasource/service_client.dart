import 'package:template_app/core/app_constants.dart';

import 'package:chopper/chopper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_app/data/datasource/local/user_local_datasource.dart';
import 'package:template_app/data/datasource/remote/auth/user_service.dart';
import 'package:template_app/domain/interceptors/api_auth_interceptor.dart';
import 'package:template_app/domain/interceptors/api_authenticator.dart';
import 'package:template_app/domain/interceptors/api_exceptions_interceptor.dart';
import 'package:template_app/domain/interceptors/connectivity_interceptor.dart';

class ServiceClient {
  ServiceClient(this._ref);
  final ProviderRef _ref;

  ChopperClient get client => ChopperClient(
        baseUrl: Uri.parse(AppConstants.baseUrl),
        authenticator: ApiAuthenticator(_ref),
        services: [UserService.create()],
        // converter: JsonSerializableConverter(),
        errorConverter: const JsonConverter(),
        interceptors: [
          ConnectivityInterceptor(Connectivity()),
          ApiExceptionsInterceptor(_ref),
          ApiAuthInterceptor(_ref.watch(UserLocalDataSource.provider)),
          const HeadersInterceptor({'Cache-Control': 'no-cache'}),
          HttpLoggingInterceptor(),
          CurlInterceptor(),
        ],
      );

  static final provider = Provider((ref) => ServiceClient(ref).client);
}

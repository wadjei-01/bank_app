import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_app/presentation/viewmodel/auth/auth_viewmodel.dart';

class ApiAuthenticator extends Authenticator {
  ApiAuthenticator(this._ref);
  final Ref _ref;

  @override
  FutureOr<Request?> authenticate(Request request, Response response,
      [Request? originalRequest]) async {
    if (response.statusCode == 401 && !request.uri.path.contains('auth')) {
      try {
        final token = await _handleTokenExpiry();

        if (token != null) return request;

        return null;
      } catch (error) {
        debugPrint('ApiAuthenticator unable to refresh token:>> $error');
      }
    }
    return null;
  }

  Future<String?> _handleTokenExpiry() async {
    return await _ref.read(AuthViewModel.provider.notifier).refreshToken();
  }
}

import 'dart:async';
import 'dart:io';

import 'package:template_app/core/error/exceptions/exceptions.dart';
import 'package:chopper/chopper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:template_app/core/res/strings/strings.dart';

class ConnectivityInterceptor implements RequestInterceptor {
  ConnectivityInterceptor(this.connectivity);
  final Connectivity connectivity;

  @override
  FutureOr<Request> onRequest(Request request) async {
    try {
      final response = await InternetAddress.lookup('google.com');
      if (response.isNotEmpty && response[0].rawAddress.isNotEmpty) {
        return request;
      }
    } on SocketException {
      throw NetworkException(Strings.youAreOffline);
    } on FileSystemException {
      throw FileUploadException(Strings.fileUploadIssue);
    } on ClientException {
      throw ClientException(Strings.clientError);
    } catch (e) {
      throw UnexpectedException(Strings.anUnexpectedError);
    }

    throw NetworkException(Strings.youAreOffline);
  }
}

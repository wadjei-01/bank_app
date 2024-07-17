import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:template_app/core/app_router.dart';
import 'package:template_app/core/core_provider.dart';
import 'package:template_app/domain/repository/auth/user_repository_impl.dart';

class AuthViewModel with ChangeNotifier {
  AuthViewModel(this._userRepository, this._ref);

  final UserRepositoryImpl _userRepository;

  User? get authUser => _userRepository.currentUser;

  Ref _ref;

  void loginUser(String email) {
    try {
      _userRepository.loginUser(email);
      notifyListeners();
    } catch (e) {
      printWarning('Error Unable to log in user');
      _ref.read(routerProvider).goNamed('/failure');
    }
  }

  bool get landingPageState => _userRepository.landingPageState;

  void setLandingPageState() {
    _userRepository.setLandingPageState();
    notifyListeners();
  }

  Future<String> refreshToken() {
    return Future.value('string');
  }

  void logoutUser() {
    if ((landingPageState != null || landingPageState != false) &&
        authUser != null) {
      _userRepository.logOutUser();
      notifyListeners();
    }
  }

  static final provider = ChangeNotifierProvider(
      (ref) => AuthViewModel(ref.watch(UserRepositoryImpl.provider), ref));
}

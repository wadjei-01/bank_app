import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:template_app/data/datasource/local/user_local_datasource.dart';
import 'package:template_app/data/datasource/remote/auth/user_service.dart';
import 'package:template_app/data/repository/auth/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userService, this._dataSource);
  final UserLocalDataSource _dataSource;
  final UserService _userService;

  @override
  User? get currentUser => _dataSource.getCurrentUser();

  @override
  bool get landingPageState => _dataSource.getLandingPageState();

  @override
  void setLandingPageState() => _dataSource.setLandingPageState(true);

  @override
  void loginUser(
    String email,
  ) {
    final user = User(
        id: '1001',
        firstName: 'William',
        lastName: 'Adjei',
        email: email,
        password: '123');
    _dataSource.setUser(user);
  }

  @override
  void logOutUser() {
    _dataSource.clearUserLoginData();
    _dataSource.clearLandingPageState();
  }

  static final provider = Provider<UserRepositoryImpl>((ref) =>
      UserRepositoryImpl(ref.watch(UserService.provider),
          ref.watch(UserLocalDataSource.provider)));
}

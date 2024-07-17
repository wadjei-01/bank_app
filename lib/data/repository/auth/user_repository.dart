import 'package:models/models.dart';

abstract class UserRepository {
  void loginUser(String username);
  void logOutUser();

  User? get currentUser;
  bool? get landingPageState;
  void setLandingPageState();
}

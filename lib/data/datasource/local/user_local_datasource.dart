import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_app/core/core_provider.dart';
import 'package:template_app/core/storage_constants.dart';
import 'package:template_app/data/datasource/preference_manager.dart';
import 'package:models/models.dart';

class UserLocalDataSource {
  UserLocalDataSource({required this.storageManager});
  StorageManager storageManager;

  void setUser(User user) {
    try {
      storageManager.saveJsonMap(StorageConstants.userCacheKey, user.toJson());
    } catch (e) {
      printError('Error:>> Unable to store user data due to $e');
    }
  }

  User? getCurrentUser() {
    try {
      final user = storageManager.getJsonMap(StorageConstants.userCacheKey);
      if (user.isNotEmpty) return User.fromJson(user);
      return null;
    } catch (e) {
      printError('Error:>> Unable to retrieve user data due to:>> $e');
      return null;
    }
  }

  void clearUserLoginData() {
    try {
      storageManager.prefs.remove(StorageConstants.userCacheKey);
    } catch (e) {
      printError('Error:>> Unable to clear user data due to:>> $e');
    }
  }

  ///Landing Page
  bool getLandingPageState() {
    try {
      return storageManager.getBoolean(StorageConstants.landPageCacheKey);
    } catch (e) {
      printError('Error:>> unable to set state of landing page because of $e');
      return false;
    }
  }

  void setLandingPageState(bool value) {
    try {
      storageManager.saveBoolean(StorageConstants.landPageCacheKey, value);
    } catch (e) {
      printError('Error:>> unable to set state of landing page because of $e');
    }
  }

  void clearLandingPageState() {
    try {
      storageManager.prefs.remove(StorageConstants.landPageCacheKey);
    } catch (e) {
      printError('Error:>> Unable to clear landing page state because of $e');
    }
  }

  static final provider = Provider((ref) =>
      UserLocalDataSource(storageManager: ref.watch(StorageManager.provider)));
}

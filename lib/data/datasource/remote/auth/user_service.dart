import 'package:chopper/chopper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_app/data/datasource/service_client.dart';

part 'user_service.chopper.dart';

@ChopperApi()
abstract class UserService extends ChopperService {
  //   @Post(path: '/borga/user/api/v1/users')
  // Future<Response<BaseResponse<User>>> signUpUser(
  //     @Body() CreateUser createUser);

  static UserService create([ChopperClient? client]) => _$UserService(client);

  static final provider = Provider(
      (ref) => ref.watch(ServiceClient.provider).getService<UserService>());
}

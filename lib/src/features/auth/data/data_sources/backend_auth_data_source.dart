import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/features/auth/domain/entities/user_entity.dart';

part 'backend_auth_data_source.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class BackendAuthDataSource {
  factory BackendAuthDataSource(Dio dio) = _BackendAuthDataSource;

  @POST('/api/v1/users/signup')
  Future<HttpResponse<UserEntity>> signUp(
    @Body() Map<String, dynamic> body,
    @Header('Token') String idToken,
  );
}

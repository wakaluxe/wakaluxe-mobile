// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wakaluxe/src/common/resources/data_state.dart';
import 'package:wakaluxe/src/configs/usecase.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/backend_auth_data_source.dart';
import 'package:wakaluxe/src/features/auth/domain/entities/user_entity.dart';

class SignUpUsecase implements UseCase<DataState<UserEntity>, void> {
  SignUpUsecase(
    this._authRepository,
  ) : super();

  final BackendAuthDataSource _authRepository;

  @override
  Future<DataState<UserEntity>> call(void params) {
    // TODO: implement call
    //return  _authRepository.signUp();
    throw UnimplementedError();
  }
}

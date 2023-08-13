import 'package:dartz/dartz.dart';
import 'package:wakaluxe/src/features/auth/domain/entities/user_entity.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/logout_exception.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/sign_anonymously_exception.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/sign_in_with_credential.dart';

abstract class AuthRepository {
  Stream<UserEntity> get user;
  UserEntity? get currentUser;
  Future<void> veryPhoneNumber();
  Future<Either<SignAnonymouslyException, dynamic>> signInAnonymously();
  Future<Either<SignInWithCredentialException, dynamic>> signInWithCredential();

  Future<Either<LogOutException, dynamic>> signOut();
}

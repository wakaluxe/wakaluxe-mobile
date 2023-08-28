// ignore_for_file: public_member_api_docs, sort_constructors_first
/* import 'package:dartz/dartz.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/firebase_auth_remote_data_source.dart';

import 'package:wakaluxe/src/features/auth/domain/entities/user_entity.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/logout_exception.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/sign_anonymously_exception.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/sign_in_with_credential.dart';
import 'package:wakaluxe/src/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final FirebaseAuthRepository _firebaseAuthRepository;
  AuthRepositoryImplementation({
    required FirebaseAuthRepository firebaseAuthRepository,
  }) : _firebaseAuthRepository = firebaseAuthRepository;
  @override
  UserEntity? get currentUser => _firebaseAuthRepository.currentUser;

  @override
  Future<Either<SignAnonymouslyException, dynamic>> signInAnonymously() =>
      _firebaseAuthRepository.signInAnonymously();

  @override
  Future<Either<SignInWithCredentialException, dynamic>>
      signInWithCredential() {
    // TODO: implement signInWithCredential
    throw UnimplementedError();
  }

  @override
  Future<Either<LogOutException, dynamic>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  Stream<UserEntity> get user => throw UnimplementedError();

  @override*
  Future<void> veryPhoneNumber() {
    // TODO: implement veryPhoneNumber
    throw UnimplementedError();
  }
}
 */
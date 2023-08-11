// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:wakaluxe/src/common/Utils/logger.dart';
import 'package:wakaluxe/src/dependencies_container.dart';
import 'package:wakaluxe/src/features/auth/data/local_auser_data.dart';
import 'package:wakaluxe/src/features/auth/domain/entities/user_entity.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/logout_exception.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/phone_login_exceptions.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/sign_anonymously_exception.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/sign_in_with_credential.dart';

class FirebaseAuthRepository {
  final LocalUSerData _localUSerData = locator<LocalUSerData>();
  final FirebaseAuth _auth = locator<FirebaseAuth>();

  FirebaseAuthRepository();

  Stream<UserEntity> get user {
    return _auth.authStateChanges().map((firebaseUser) {
      final user =
          firebaseUser == null ? UserEntity.empty : firebaseUser.toUser;
      _localUSerData.saveUser(jsonEncode(user));
      return user;
    });
  }

  UserEntity get currentUser {
    return _localUSerData.getUser() ?? UserEntity.empty;
  }

  Future<void> veryPhoneNumber({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      throw const LogInWithPhoneException();
    }
  }

//   @override
// Stream<User> get user {
//   return auth.authStateChanges().map((firebaseUser) {
//     final user = firebaseUser == null ? UserEntity.empty : firebaseUser.toUser;
//     return user;
//   });
// }

  Future<Either<SignAnonymouslyException, UserCredential>>
      signInAnonymously() async {
    try {
      final response = await _auth.signInAnonymously();
      logInfo('the token is: ${await response.user?.getIdToken()}');
      return Right(response);
    } on FirebaseAuthException catch (e) {
      logError(e.toString());
      return Left(SignAnonymouslyException(message: e.message ?? e.code));
    } catch (e) {
      logError(e.toString());
      return Left(SignAnonymouslyException());
    }
  }

  Future<Either<SignInWithCredentialException, UserEntity>> signWithcredential(
    AuthCredential credential,
  ) async {
    try {
      final response = await _auth.signInWithCredential(credential);
      final user = response.user;
      final entity = user?.toUser;
      _localUSerData.saveUser(jsonEncode(entity));
      return Right(entity!);
    } on FirebaseAuthException catch (e) {
      logError(e.toString());
      return Left(SignInWithCredentialException.fromCode(e.code));
    } catch (e) {
      logError(e.toString());
      return const Left(SignInWithCredentialException());
    }
  }

  Future<Either<LogOutException, UserCredential>> signOut() async {
    try {
      await _auth.signOut();
      _localUSerData.deleteUser();
      final response = await _auth.signInAnonymously();
      return Right(response);
    } on FirebaseAuthException catch (e) {
      logError(e.toString());
      return Left(LogOutException());
    } catch (e) {
      logError(e.toString());
      return Left(LogOutException());
    }
  }
}

extension on User {
  UserEntity get toUser {
    return UserEntity(
      id: uid,
      fullName: displayName,
      profilePicture: photoURL,
      phoneNumber: phoneNumber,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:wakaluxe/src/common/Utils/logger.dart';
import 'package:wakaluxe/src/common/resources/exceptions.dart';
import 'package:wakaluxe/src/common/resources/network_connectivity.dart';
import 'package:wakaluxe/src/dependencies_container.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/backend_auth_data_source.dart';
import 'package:wakaluxe/src/features/auth/data/data_sources/local_auser_data.dart';
import 'package:wakaluxe/src/features/auth/domain/entities/user_entity.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/logout_exception.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/phone_login_exceptions.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/sign_anonymously_exception.dart';
import 'package:wakaluxe/src/features/auth/domain/exceptions/sign_in_with_credential.dart';

class AuthRepositorymplementation {
  final LocalUSerData _localUSerData = locator<LocalUSerData>();
  final FirebaseAuth _auth = locator<FirebaseAuth>();
  final BackendAuthDataSource _backend = locator<BackendAuthDataSource>();
  final NetworkConnectivity _networkConnectivity =
      locator<NetworkConnectivity>();

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

  @override
  Future<void> veryPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    try {
      await _networkConnectivity.isConnected();
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } on NetworkException {
      rethrow;
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
      final body = {
        'phoneNumber': entity?.phoneNumber,
      };
      final idToken = await user?.getIdToken();
      logDebug('the id token in sign with cred $idToken');
        _localUSerData.saveUser(jsonEncode(entity));
        return Right(entity!);
      /* final httpResponse = await _backend.signUp(body, idToken!);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        logInfo('the http response is: ${httpResponse.data}');
      } else {
        logError(
          '''error in signin with cred: status code: ${httpResponse.response.statusCode}, message: ${httpResponse.response.statusMessage}, requestOption: ${httpResponse.response.requestOptions}, data: ${httpResponse.data}''',
        );
        return const Left(SignInWithCredentialException('please retry later'));
      } */
    } on FirebaseAuthException catch (e) {
      logError(e.toString());
      return Left(SignInWithCredentialException.fromCode(e.code));
    } on DioException catch (e) {
      logError(e.error.toString());
      

      return Left(SignInWithCredentialException(e.message ?? 'unknown error'));
    } catch (e) {
      logError(e.toString());
      return const Left(SignInWithCredentialException());
    }
  }

  Future<Either<LogOutException, UserCredential>> signOut() async {
    try {
      await _auth.signOut();
      await _localUSerData.deleteUser();
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  final FirebaseStorage _storage = locator<FirebaseStorage>();

  Future<void> changeUserProfileImage() async {
    try {
      logInfo('the user is changing the profile image 1');
      final picker = locator<ImagePicker>();
      logInfo('the user is changing the profile image 2');
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      logInfo('the user is changing the profile image 3');
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        logInfo('the user is changing the profile image 4');
        final ref = _storage.ref('profileImages/${_auth.currentUser!.uid}');
        logDebug('the ref is: $ref');
        final snapshot = await ref.putFile(file);
        logInfo('the user is changing the profile image 5');
        final downloardUrl = await snapshot.ref.getDownloadURL();
        logInfo('the user is changing the profile image 6');
        await _auth.currentUser!.updatePhotoURL(downloardUrl);
        logInfo('the user is changing the profile image 7');
        final user = _auth.currentUser!.toUser;
        logInfo('the user is changing the profile image 8');
        _localUSerData.saveUser(jsonEncode(user));
        logInfo('the user is changing the profile image 9');
      } else {
        logError('no image selected');
        throw Exception('no image selected');
      }
    } on FirebaseException catch (e) {
      logError(e.toString());
      throw Exception(e.message ?? 'error changing profile image');
    } catch (e) {
      logError(e.toString());
      throw Exception('error changing profile image');
    }
  }

  Stream<UserEntity> get user {
    return _auth.authStateChanges().map((firebaseUser) {
      final user =
          firebaseUser == null ? UserEntity.empty : firebaseUser.toUser;
      _localUSerData.saveUser(jsonEncode(user));
      return user;
    });
  }

  Future<UserEntity> get currentUser async {
    if (await _networkConnectivity.isConnected()) {
      final user = _auth.currentUser;
      if (user != null) {
        final entity = user.toUser;
        _localUSerData.saveUser(jsonEncode(entity));
        return entity;
      }
    }
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
  Future<String> get getIdToken async {
    return await _auth.currentUser?.getIdToken() ?? '';
  }

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

  Future<Either<UpdateProfileException, UserEntity>> updateUserName(
    String newUserName,
  ) async {
    try {
      final user = _auth.currentUser;
      await user!.updateDisplayName(newUserName);
      final entity = user.toUser;
      _localUSerData.saveUser(jsonEncode(entity));
      return Right(entity);
    } on FirebaseAuthException catch (e) {
      logError(e.toString());
      return Left(UpdateProfileException.fromCode(e.code));
    } catch (e) {
      logError(e.toString());
      return Left(UpdateProfileException());
    }
  }

  Future<Either<UpdateProfileException, UserEntity>> updateUserPhoneNumber({
    required String newPhoneNumber,
    required void Function(String, int?) codeSent,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String) codeAutoRetrievalTimeout,
    required void Function(PhoneAuthCredential) verificationCompleted



  }) async {
    try {
      final completer = Completer<PhoneAuthCredential>();

      await _auth.verifyPhoneNumber(
        phoneNumber: newPhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          completer.complete(credential);
        },

        verificationFailed: (FirebaseAuthException e) {
          logError(e.toString());
          completer.completeError(UpdateProfileException.fromCode(e.code));
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Wait for the user to enter the SMS code
          //   final smsCode = await _smsCodeInput();
          final credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: '', // smsCode,
          );
          completer.complete(credential);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          completer.completeError(UpdateProfileException(message: 'Time out'));
        },
      );
    
      

      final credential = await completer.future;
      final user = _auth.currentUser;
      await user!.updatePhoneNumber(credential);
      final entity = user.toUser;
      _localUSerData.saveUser(jsonEncode(entity));
      return Right(entity);
    } on FirebaseAuthException catch (e) {
      logError(e.toString());
      return Left(UpdateProfileException.fromCode(e.code));
    } catch (e) {
      logError(e.toString());
      return Left(UpdateProfileException());
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

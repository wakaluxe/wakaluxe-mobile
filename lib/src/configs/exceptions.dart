// import 'package:dio/dio.dart';
// import 'package:wakaluxe/src/common/Utils/logger.dart';

// /// An enum that holds names for our custom exceptions.
// enum _ExceptionType {
//   /// The exception for an expired bearer token.
//   TokenExpiredException,

//   /// The exception for a prematurely cancelled request.
//   CancelException,

//   /// The exception for a failed connection attempt.
//   ConnectTimeoutException,

//   /// The exception for failing to send a request.
//   SendTimeoutException,

//   /// The exception for failing to receive a response.
//   ReceiveTimeoutException,

//   /// The exception for no internet connectivity.
//   SocketException,

//   /// A better name for the socket exception.
//   FetchDataException,

//   /// The exception for an incorrect parameter in a request/response.
//   FormatException,

//   /// The exception for an unknown type of failure.
//   UnrecognizedException,

//   /// The exception for an unknown exception from the api.
//   ApiException,

//   /// The exception for any parsing failure encountered during
//   /// serialization/deserialization of a request.
//   SerializationException,

//   CoonectionError,
//   BadCertificate
// }

// class CustomException implements Exception {
//   CustomException({
//     required this.message,
//     this.code,
//     int? statusCode,
//     this.exceptionType = _ExceptionType.ApiException,
//   })  : statusCode = statusCode ?? 500,
//         name = exceptionType.name;

//   factory CustomException.fromDioException(Exception error) {
//     try {
//       if (error is DioException) {
//         switch (error.type) {
//           case DioExceptionType.cancel:
//             return CustomException(
//               exceptionType: _ExceptionType.CancelException,
//               statusCode: error.response?.statusCode,
//               message: 'Request cancelled prematurely',
//             );
//           case DioExceptionType.connectionTimeout:
//             return CustomException(
//               exceptionType: _ExceptionType.ConnectTimeoutException,
//               statusCode: error.response?.statusCode,
//               message: 'Connection not established',
//             );
//           case DioExceptionType.sendTimeout:
//             return CustomException(
//               exceptionType: _ExceptionType.SendTimeoutException,
//               statusCode: error.response?.statusCode,
//               message: 'Failed to send',
//             );
//           case DioExceptionType.receiveTimeout:
//             return CustomException(
//               exceptionType: _ExceptionType.ReceiveTimeoutException,
//               statusCode: error.response?.statusCode,
//               message: 'Failed to receive',
//             );
//           case DioExceptionType.badResponse:
//           case DioExceptionType.unknown:
//             if (error.message!.contains(_ExceptionType.SocketException.name)) {
//               return CustomException(
//                 exceptionType: _ExceptionType.FetchDataException,
//                 statusCode: error.response?.statusCode,
//                 message: 'No internet connectivity',
//               );
//             }
//             if (error.response?.data['headers']['code'] == null) {
//               return CustomException(
//                 exceptionType: _ExceptionType.UnrecognizedException,
//                 statusCode: error.response?.statusCode,
//                 message: error.response?.statusMessage ?? 'Unknown',
//               );
//             }
//             final name = error.response?.data['headers']['code'] as String;
//             final message =
//                 error.response?.data['headers']['message'] as String;
//             if (name == _ExceptionType.TokenExpiredException.name) {
//               return CustomException(
//                 exceptionType: _ExceptionType.TokenExpiredException,
//                 code: name,
//                 statusCode: error.response?.statusCode,
//                 message: message,
//               );
//             }
//             return CustomException(
//               message: message,
//               code: name,
//               statusCode: error.response?.statusCode,
//             );
//           case DioExceptionType.badCertificate:
//             return CustomException(
//               exceptionType: _ExceptionType.BadCertificate,
//               statusCode: error.response?.statusCode,
//               message: ' bad certificate',
//             );
//           // TODO: Handle this case.

//           case DioExceptionType.connectionError:
//             // TODO: Handle this case.
//             return CustomException(
//               exceptionType: _ExceptionType.CoonectionError,
//               statusCode: error.response?.statusCode,
//               message: 'Connection not established',
//             );
//         }
//       } else {
//         return CustomException(
//           exceptionType: _ExceptionType.UnrecognizedException,
//           message: 'Error unrecognized',
//         );
//       }
//     } on FormatException catch (e) {
//       return CustomException(
//         exceptionType: _ExceptionType.FormatException,
//         message: e.message,
//       );
//     } on Exception catch (_) {
//       return CustomException(
//         exceptionType: _ExceptionType.UnrecognizedException,
//         message: 'Error unrecognized',
//       );
//     }
//   }

//   factory CustomException.fromParsingException(Exception error) {
//     // TODO(arafaysaleem): add logging to print stack trace
//     logError('$error');
//     return CustomException(
//       exceptionType: _ExceptionType.SerializationException,
//       message: 'Failed to parse network response to model or vice versa',
//     );
//   }
//   final String name, message;
//   final String? code;
//   final int? statusCode;
//   final _ExceptionType exceptionType;
// }

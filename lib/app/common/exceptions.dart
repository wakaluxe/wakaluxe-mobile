class CacheException implements Exception {
  final String message;
  CacheException({required this.message});
}

class ServerException implements Exception {
  final String message;
  ServerException({required this.message});
}

class NetworkException implements Exception {
  final String message;
  NetworkException({required this.message});
}

class FirebaseException implements Exception {
  final String message;
  FirebaseException({required this.message});
}
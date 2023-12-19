class UpdateProfileException implements Exception {
  final String message;

  UpdateProfileException({this.message = 'Error updating profile'});

  static UpdateProfileException fromCode(String code) {
    switch (code) {
      // Add cases for specific error codes here
      // For example:
      // case 'user-not-found':
      //   return UpdateProfileException(message: 'User not found');
      default:
        return UpdateProfileException();
    }
  }
}class NetworkException implements Exception {
  final String message = 'No Internet Connection';
}

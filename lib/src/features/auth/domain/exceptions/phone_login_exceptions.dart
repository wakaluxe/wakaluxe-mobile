// coverage:ignore-file
class LogInWithPhoneException implements Exception {
  const LogInWithPhoneException([
    this.message = 'Unknown error occurred.',
  ]);

  factory LogInWithPhoneException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithPhoneException(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithPhoneException(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithPhoneException(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithPhoneException(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithPhoneException();
    }
  }

  final String message;
}

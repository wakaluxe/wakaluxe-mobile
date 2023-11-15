// coverage:ignore-file
class SignInWithCredentialException implements Exception {
  const SignInWithCredentialException([
    this.message = 'Unknown error occurred.',
  ]);

  factory SignInWithCredentialException.fromCode(String code) {
    switch (code) {
      case 'invalid-credential':
        return const SignInWithCredentialException(
          'Your credentials may have expired. Please try again.',
        );
      case 'user-disabled':
        return const SignInWithCredentialException(
          'This user has been disabled. Please contact support for help.',
        );

      default:
        return const SignInWithCredentialException();
    }
  }

  final String message;
}

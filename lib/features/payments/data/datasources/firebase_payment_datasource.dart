/* import 'package:firebase_auth/firebase_auth.dart';

class FirebasePaymentDataSource {
  const FirebasePaymentDataSource(this._auth);
  final FirebaseAuth _auth;

  Future<void> verifyPaymentMobilePaymentMethod(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
      final cred =  PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: 'smsCode');
      _auth.signInWithCredential(cred)
      }
      ,
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
 */
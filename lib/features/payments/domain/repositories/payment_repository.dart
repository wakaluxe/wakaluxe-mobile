import 'package:dartz/dartz.dart';
import 'package:wakaluxe/app/common/failure.dart';

abstract class PaymentRepository {
  Future<void> initPayment({required String tourId, required String amount});
  Future<void> completePayment();
  /* Future<Either<Failure, PaymentMethod>> getPaymentMethods();
  Future<Either<Failure, void>> addPaymentMethod(PaymentMethod method);
  Future<Either<Failure, void>> removePaymentMethod(PaymentMethod method); */
}

import 'package:wakaluxe/features/payments/data/models/payment_method_model.dart';

abstract class PaymentRepository {
  Future<void> initPayment({required String tourId, required String amount});
  Future<void> completePayment();
  Future<List<MobilePaymentMethodModel>> getPaymentMethods();
  Future<void> addPaymentMethod(
    MobilePaymentMethodModel method,
  );
  Future<void> removePaymentMethod(MobilePaymentMethodModel index);
  /* Future<Either<Failure, PaymentMethod>> getPaymentMethods();
  Future<Either<Failure, void>> addPaymentMethod(PaymentMethod method);
  Future<Either<Failure, void>> removePaymentMethod(PaymentMethod method); */
  Future<void> verifyPaymentMobilePaymentMethod(String phoneNumber);
}

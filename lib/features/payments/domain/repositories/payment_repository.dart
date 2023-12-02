abstract class PaymentRepository {
  Future<void> initPayment({required String tourId, required String amount});
  Future<void> completePayment();
}

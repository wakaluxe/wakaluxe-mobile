// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:wakaluxe/features/payments/data/datasources/local_payment_datasource.dart';
import 'package:wakaluxe/features/payments/data/models/payment_method_model.dart';
import 'package:wakaluxe/features/payments/domain/repositories/payment_repository.dart';
import 'package:wakaluxe/src/common/Utils/logger.dart';

class PaymentRepositoryImp extends PaymentRepository {
  final LocalPaymentDataSource _localDataSource;
  PaymentRepositoryImp({
    required LocalPaymentDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  Future<void> completePayment() {
    // TODO: implement completePayment
    throw UnimplementedError();
  }

  @override
  Future<void> initPayment({required String tourId, required String amount}) {
    // TODO: implement initPayment
    throw UnimplementedError();
  }

  @override
  Future<void> addPaymentMethod(MobilePaymentMethodModel method) async {
    try {
      await _localDataSource.addPaymentMethod(method);
    } catch (e) {
      logError('the error in add payment method $e');
      throw Exception('Error adding payment method: $e');
    }
  }

  @override
  Future<List<MobilePaymentMethodModel>> getPaymentMethods() async {
    try {
      final methods = await _localDataSource.getPaymentMethods();
      return methods;
    } catch (e) {
      logError('the error in get payment method $e');
      throw Exception('Error getting payment methods: $e');
    }
  }

  @override
  Future<void> removePaymentMethod(MobilePaymentMethodModel method) async {
    try {
      await _localDataSource.removePaymentMethod(method);
    } catch (e) {
      logError('the error in remove payment method $e');
      throw Exception('Error removing payment method: $e');
    }
  }
  
  @override
  Future<void> verifyPaymentMobilePaymentMethod(String phoneNumber) {
    // TODO: implement verifyPaymentMobilePaymentMethod
    throw UnimplementedError();
  }
}

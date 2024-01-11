import 'package:wakaluxe/features/payments/data/models/payment_method_model.dart';
import 'package:wakaluxe/features/payments/domain/repositories/payment_repository.dart';
import 'package:wakaluxe/src/configs/usecase.dart';

class RemovePaymentMethodsUseCase
    extends UseCase<void, MobilePaymentMethodModel> {
  RemovePaymentMethodsUseCase(this.repository);
  final PaymentRepository repository;

  @override
  Future<void> call(MobilePaymentMethodModel params) async {
    return await repository.removePaymentMethod(
      params,
    );
  }
}

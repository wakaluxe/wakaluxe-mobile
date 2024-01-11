import 'package:wakaluxe/features/payments/data/models/payment_method_model.dart';
import 'package:wakaluxe/features/payments/domain/repositories/payment_repository.dart';
import 'package:wakaluxe/src/configs/usecase.dart';

class GetPaymentMethodsUsecase
    extends UseCase<List<MobilePaymentMethodModel>, NoParams> {
  GetPaymentMethodsUsecase(this.repository);
  final PaymentRepository repository;

  @override
  Future<List<MobilePaymentMethodModel>> call(NoParams params) async {
    return await repository.getPaymentMethods();
  }
}

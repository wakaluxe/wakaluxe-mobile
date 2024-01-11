import 'package:wakaluxe/features/payments/data/models/payment_method_model.dart';
import 'package:wakaluxe/src/common/Utils/cache_client.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';

class LocalPaymentDataSource {
  LocalPaymentDataSource(this._hiveClient);
  final HiveClient _hiveClient;

  Future<void> initialize() async {
    await _hiveClient.initialize(Constants.paymentBoxName);
  }

  Future<void> savePaymentMethod(
    List<MobilePaymentMethodModel> paymentMethods,
  ) async {
    final localData = paymentMethods.map((e) => e.toJson()).toList().asMap();
    await _hiveClient.addItems(localData);
  }

  Future<List<MobilePaymentMethodModel>> getPaymentMethods() async {
    final paymentMethods = await _hiveClient.getItems();
    final localData = paymentMethods
        .map((method) => MobilePaymentMethodModel.fromJson(method as String))
        .toList();
    return localData;
  }

  Future<void> addPaymentMethod(MobilePaymentMethodModel method) async {
    final paymentMethods = await getPaymentMethods();
    paymentMethods.add(method);
    await savePaymentMethod(paymentMethods);
  }

  Future<void> removePaymentMethod(MobilePaymentMethodModel method) async {
    final paymentMethods = await getPaymentMethods();
    paymentMethods.remove(method);
    await savePaymentMethod(paymentMethods);
  }
}

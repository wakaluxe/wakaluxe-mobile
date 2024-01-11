import 'dart:convert';

import 'package:wakaluxe/features/payments/data/models/payment_method_type.dart';

class MobilePaymentMethodModel {
 const MobilePaymentMethodModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.type,
  });

  factory MobilePaymentMethodModel.fromMap(Map<String, dynamic> json) =>
      MobilePaymentMethodModel(
        id: json['id'] as String,
        name: json['name'] as String,
        icon: json['icon'] as String,
        type: PaymentMethodType.map[json['type']]!,
      );

  factory MobilePaymentMethodModel.fromJson(String source) =>
      MobilePaymentMethodModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  final String id;
  final String name;
  final String icon;
  final String type;

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'icon': icon,
        'type': PaymentMethodType.reverseMap[type],
      };
  String toJson() => json.encode(toMap());
}

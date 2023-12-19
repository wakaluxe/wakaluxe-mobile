import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class InitPaymentReqModel {
  final String tourId;
  final int amount;
  InitPaymentReqModel({
    required this.tourId,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tourId': tourId,
      'amount': amount,
    };
  }

  factory InitPaymentReqModel.fromMap(Map<String, dynamic> map) {
    return InitPaymentReqModel(
      tourId: map['tourId'] as String,
      amount: map['amount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory InitPaymentReqModel.fromJson(String source) => InitPaymentReqModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DriverLoginState extends Equatable {
  const DriverLoginState({
    required this.emailPhone,
    required this.driverIdNo,
    required this.pin,
    required this.isVisible,
  });
  final String emailPhone;
  final String driverIdNo;
  final String pin;
  final bool isVisible;

  @override
  List<Object> get props => [emailPhone, driverIdNo, pin, isVisible];

  @override
  bool get stringify => true;

  DriverLoginState copyWith({
    String? emailPhone,
    String? driverIdNo,
    String? pin,
    bool? isVisible,
  }) {
    return DriverLoginState(
      emailPhone: emailPhone ?? this.emailPhone,
      driverIdNo: driverIdNo ?? this.driverIdNo,
      pin: pin ?? this.pin,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}

class DriverLoginInitial extends DriverLoginState {
  const DriverLoginInitial()
      : super(isVisible: true, emailPhone: '', driverIdNo: '', pin: '');
}

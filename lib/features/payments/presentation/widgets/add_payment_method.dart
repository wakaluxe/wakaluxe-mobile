import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wakaluxe/features/payments/data/models/payment_method_model.dart';
import 'package:wakaluxe/features/payments/data/models/payment_method_type.dart';
import 'package:wakaluxe/features/payments/presentation/cubit/payment_cubit.dart';
import 'package:wakaluxe/l10n/l10n.dart';
import 'package:wakaluxe/src/common/Utils/helpers.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_input_field.dart';
import 'package:wakaluxe/src/configs/helpers.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

class AddPaymentMethod extends StatefulWidget {
  const AddPaymentMethod({super.key});

  @override
  State<AddPaymentMethod> createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final phoneFormatter = MaskTextInputFormatter(
      mask: '+237 ###-##-##-##',
      filter: {'#': RegExp('[0-9]')},
    );
    return Container(
      height: 0.4.sh,
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: BlocConsumer(
        listener: (context, state) {
          if (state is PaymentAddPaymentMethodSuccessState) {
            Navigator.pop(context);
          }
          if (state is PaymentAddPaymentMethodErrorState) {
            context.showSnackBar(
              state.error,
              duration: const Duration(seconds: 2),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Text(
                AppLocalizations.of(context).addPaymentMethod,
                style: context.titleMd,
              ),
              WakaluxInputField(
                text: Theme.of(context).textTheme,
                hint: '+237 699 99 99 99',
                controller: _controller,
                formatter: [phoneFormatter],
                icon: Constants.hashtagIcon,
                validator: phoneNumberValidator,
              ),
              const Spacer(),
              WakaluxeButton(
                text: state is PaymentAddPaymentMethodInitialState
                    ? AppLocalizations.of(context).loading
                    : AppLocalizations.of(context).addPhoneNumber,
              ),
            ],
          );
        },
      ),
    );
  }

  _handleAddPhoneNumber(String phoneNumber) {
    final type = getPhoneNumberType(phoneNumber);
    final icon = paymentMethodIcon(type);
    final method = MobilePaymentMethodModel(
      id: phoneNumber,
      name: phoneNumber,
      icon: icon,
      type: type,
    );
    context.read<PaymentCubit>().addPaymentMethods(method);
  }

}

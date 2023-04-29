import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_input_field.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/payment_details_cubit/payment_details_cubit.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/payment_details_cubit/payment_details_state.dart';

@RoutePage(
  name: 'PaymentDetails',
)
class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    //create a cubit instance
    final cubit = PaymentDetailsCubit(
      driverNumber: TextEditingController(),
      taxiFare: TextEditingController(),
      customerNumber: TextEditingController(),
    );
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: BlocBuilder<PaymentDetailsCubit, PaymentDetailsState>(
          bloc: cubit,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Details',
                  style: context.titleLgBold,
                ),
                10.vGap,
                Text(
                  "Driver's Phone number ",
                  style: context.bodyMd,
                ),
                10.vGap,
                WakaluxInputField(
                  controller: cubit.driverNumber,
                  hint: '',
                  icon: '',
                  text: text,
                ),
                10.vGap,
                Text(
                  'Taxi fare (XAF) ',
                  style: context.bodyMd,
                ),
                10.vGap,
                WakaluxInputField(
                  controller: cubit.taxiFare,
                  hint: '',
                  icon: '',
                  text: text,
                ),
                10.vGap,
                Text(
                  "Customer's Phone number",
                  style: context.bodyMd,
                ),
                10.vGap,
                WakaluxInputField(
                  controller: cubit.customerNumber,
                  hint: '',
                  icon: '',
                  text: text,
                ),
                30.vGap,
                Align(
                  child: WakaluxeButtonMedium(
                    text: 'Dial *126#',
                    textColor: context.scheme.onTertiary,
                    action: () {
                      // we'll create a cubit.submit() method
                      context.router.pushNamed('/rating');
                    },
                  ),
                ),
                const Spacer(),
                const Align(
                  child: Text(
                    'it might take up to 5 mins to process your payment',
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

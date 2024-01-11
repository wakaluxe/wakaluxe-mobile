import 'package:flutter/material.dart';
import 'package:wakaluxe/l10n/l10n.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class DriverFetchingLoadingWidget extends StatelessWidget {
  const DriverFetchingLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //TaxiFetching(),
          const CircularProgressIndicator(),
          20.vGap,
          Text(AppLocalizations.of(context).fetchingDrivers),
        ],
      ),
    );
  }
}

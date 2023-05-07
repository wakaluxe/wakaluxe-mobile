import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';

class WakaluxBackButton extends StatelessWidget {
  const WakaluxBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.pop(),
      child: Transform.scale(
        scale: 0.5,
        child: SvgPicture.asset(Constants.backBoldIcon),
      ),
    );
  }
}

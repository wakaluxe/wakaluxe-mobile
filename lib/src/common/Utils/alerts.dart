import 'package:flutter/material.dart';
import 'package:m_toast/m_toast.dart';
import 'package:wakaluxe/src/dependencies_container.dart';

final toast = locator<ShowMToast>();

dynamic errorToast(BuildContext context, String mssg) => toast.errorToast(
      context,
      message: mssg,
      alignment: Alignment.center,
    );
dynamic successToast(BuildContext context, String mssg) => toast.successToast(
      context,
      message: mssg,
      alignment: Alignment.center,
    );

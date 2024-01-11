import 'package:flutter/material.dart';
import 'package:m_toast/m_toast.dart';

dynamic errorToast(BuildContext context, String mssg) =>
    ShowMToast(context).errorToast(
      message: mssg,
      alignment: Alignment.bottomCenter,
    );
dynamic successToast(BuildContext context, String mssg) =>
    ShowMToast(context).successToast(
      message: mssg,
      alignment: Alignment.bottomCenter,
    );

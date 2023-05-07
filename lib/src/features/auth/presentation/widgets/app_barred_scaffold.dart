// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';

class AppBarredScaffold extends StatelessWidget {
  const AppBarredScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          DropdownButton(
            underline: const SizedBox(),
            items: [
              DropdownMenuItem(
                child: Text(
                  'English',
                  style: text.label,
                ),
              ),
            ],
            onChanged: (val) {},
          )
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: body,
      ),
    );
  }
}

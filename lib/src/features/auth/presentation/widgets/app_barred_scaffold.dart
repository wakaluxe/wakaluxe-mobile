// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakaluxe/app/common/common.dart';

class AppBarredScaffold extends StatelessWidget {
  const AppBarredScaffold({
    required this.body,
    super.key,
  });
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: const [
          WakaluxeLangPicker(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: body,
      ),
    );
  }
}

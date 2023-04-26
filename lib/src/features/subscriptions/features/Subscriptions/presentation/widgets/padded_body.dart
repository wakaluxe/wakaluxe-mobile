// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaddedBody extends StatelessWidget {
  const PaddedBody({
    super.key,
    required this.body,
  });
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: body,
    );
  }
}

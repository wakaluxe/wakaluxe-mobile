import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 9.h),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding: EdgeInsets.only(left: 16.w),
              child: const TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Message...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          18.hGap,
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(Constants.sendIcon),
          ),
        ],
      ),
    );
  }
}

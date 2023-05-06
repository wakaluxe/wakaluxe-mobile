// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wakaluxe/src/common/widgets/wakalux_back_button.dart';

import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/configs/wakaluxe_theme.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const WakaluxBackButton(),
      ),
      body: SizedBox(
        width: context.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            children: <Widget>[
              Hero(
                tag: 'profile',
                child: Container(
                  height: 144.h,
                  width: 144.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage(Constants.profile),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, -3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
              73.vGap,
              const profileTile(
                title: 'Name',
                content: 'Customer/driver name',
                hasEdit: true,
              ),
              35.vGap,
              const profileTile(
                title: 'Phone Number',
                content: '+237690596605',
              ),
              35.vGap,
              const profileTile(
                title: 'Email',
                content: 'customer@gmail.com',
              ),
              35.vGap,
              const profileTile(
                title: 'Gender',
                content: 'Male',
              ),
              35.vGap,
              const profileTile(
                title: 'BirthDay',
                content: '',
                hasEdit: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class profileTile extends StatelessWidget {
  const profileTile({
    super.key,
    required this.title,
    required this.content,
    this.hasEdit = false,
  });

  final String title;
  final String content;
  final bool hasEdit;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Row(
      children: [
        SizedBox(
          width: 140.w,
          child: Text(
            title,
            style: t.body1,
          ),
        ),
        10.hGap,
        SizedBox(
          width: 186.w,
          child: Text(
            content,
            style: t.body1.copyWith(
              color: context.scheme.outline.withOpacity(0.5),
            ),
          ),
        ),
        10.hGap,
        if (hasEdit) SvgPicture.asset(Constants.editIcon)
      ],
    );
  }
}

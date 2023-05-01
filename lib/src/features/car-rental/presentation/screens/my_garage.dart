import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wakaluxe/data/dummy.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage(name: 'MyGarage')
class MyGarage extends StatelessWidget {
  const MyGarage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = myGarageContext;
    return Scaffold(
      backgroundColor: context.scheme.background,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...data.map(
              (e) => WakaluxCard(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text(
                        '${e['name']}',
                        style: context.titleLgBold,
                      ),
                      20.vGap,
                      Image.asset(
                        '${e['image']}',
                        height: 150,
                        width: context.width,
                        fit: BoxFit.contain,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

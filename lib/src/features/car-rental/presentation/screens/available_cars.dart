import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';

@RoutePage(name: 'AvailableCar')
class AvailableCars extends StatelessWidget {
  const AvailableCars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Available Cars',
                      style: context.titleLgBold,
                    ),
                  ),
                  MasonryGridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => SizedBox(
                      height: index.isEven ? 270 : 250,
                      child: WakaluxCard(
                        width: context.width,
                        child: const WakaluxeDealCard(
                          tag: 'Daily',
                          imageUrl: 'assets/images/Luxurious.png',
                          name: 'Luxurius',
                          price: '150,000',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: context.height * 0.06,
              width: context.width,
              decoration: BoxDecoration(
                color: context.scheme.background,
                border: Border(
                  top: BorderSide(
                    color: context.scheme.onBackground,
                  ),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.sort,
                      color: context.scheme.onBackground,
                    ),
                    10.hGap,
                    Text(
                      'Any',
                      style: context.bodyMdBold,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

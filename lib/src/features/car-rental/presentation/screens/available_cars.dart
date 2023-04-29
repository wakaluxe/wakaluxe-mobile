import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';

@RoutePage(name: 'AvailableCar')
class AvailableCars extends StatelessWidget {
  const AvailableCars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          MasonryGridView.builder(
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => SizedBox(
              //if index is factor of 2 then show provide larger height container
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
          )
        ],
      ),
    );
  }
}

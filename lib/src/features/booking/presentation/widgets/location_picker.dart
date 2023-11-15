/* import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/features/booking/presentation/cubit/booking_cubit.dart';

class WakaluxLocationPicker extends StatefulWidget {
  const WakaluxLocationPicker({super.key});

  @override
  State<WakaluxLocationPicker> createState() => _WakaluxLocationPickerState();
}

class _WakaluxLocationPickerState extends State<WakaluxLocationPicker> {
  final _scrollController = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) => DraggableScrollableSheet(
        initialChildSize: 0.35,
        minChildSize: 0.15,
        controller: _scrollController,
        snap: true,
        snapSizes: const [
          0.15,
          0.9,
        ],
        maxChildSize: 0.9,
        builder: (context, scrollController) =>  SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.35,
          child: PlacePicker(
            apiKey: Platform.isAndroid
                ? Constants.androidGoogleMapKey
                : Constants.androidGoogleMapKey,
            hintText: 'Find a place ...',
            searchingText: 'Please wait ...',
            selectText: 'Select place',
            initialPosition: state.myLocation!,
            useCurrentLocation: true,
            selectInitialPosition: true,
            usePlaceDetailSearch: true,
            zoomControlsEnabled: true,
            onPlacePicked: (PickResult result) {
              /*  setState(() {
                selectedPlace = result;
                _showPlacePickerInContainer = false;
              }); */
            },
            onTapBack: () {
              /* setState(() {
                _showPlacePickerInContainer = false;
              }); */
            },
          ),
        ),
      ),
    );
  }
}
 */

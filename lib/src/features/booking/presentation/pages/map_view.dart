/* import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:wakaluxe/src/common/Utils/logger.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:wakaluxe/src/features/booking/presentation/widgets/location_picker.dart';

//@RoutePage(name: 'HomeMap')
class WakaluxMapView extends StatefulWidget {
  const WakaluxMapView({super.key});

  @override
  _WakaluxMapViewState createState() => _WakaluxMapViewState();
}

class _WakaluxMapViewState extends State<WakaluxMapView> {
  @override
  void initState() {
    //context.read<BookingCubit>().getRealTimeLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const WakaluxLocationPicker(),
      body: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {
          if (state is BookingOnAppStartSuccess) {
            logDebug('my location ${state.myLocation}');
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                onMapCreated: (controller) =>
                    context.read<BookingCubit>().onMapCreated(controller),
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    state.myLocation!.latitude,
                    state.myLocation!.longitude,
                  ),
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId('current Location'),
                    position: state.myLocation!,
                  ),
                  if (state.hasDirection) ...{
                    Marker(
                      markerId: const MarkerId('destination Location'),
                      icon: state.destinationIcon,
                    ),
                    Marker(
                      markerId: const MarkerId('source Location'),
                      icon: state.sourceIcon,
                    ),
                  }
                },
                polylines: {
                  if (state.hasDirection)
                    Polyline(
                      color: Colors.blue,
                      width: 6,
                      polylineId: const PolylineId('route'),
                      points: state.polyPoints,
                    ),
                },
              ),
              const SafeArea(
                child: Column(),
              ),
            ],
          );
        },
      ),
    );
  }
}

Map<String, double>? _initialLocation;

/* List<LatLng> _polylineCoordinates = [];
 */
final Completer<GoogleMapController> _mapController = Completer();
/* const LatLng _source = LatLng(3.8857, 11.5454);
const LatLng _destination = LatLng(3.892268, 11.547712); */
String address = 'null';
String autocompletePlace = 'null';

Future<void> _handleDestinationSelection(
  LatLng myLocation,
  BuildContext context,
) async {
  await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PlacePicker(
        apiKey: Platform.isAndroid
            ? Constants.androidGoogleMapKey
            : Constants.iosGoogleMapKey,
        onPlacePicked: (result) {
          logDebug('destined location ${result.geometry!.location}');

          //      _waypoints.add(_destination);
          /* context.read<BookingCubit>().add(
                  SelectLocationEvent(
                    lat: result.geometry!.location.lat,
                    lng: result.geometry!.location.lng,
                  ),
                ); */
          context.read<BookingCubit>().getDirections(
                myLocation,
                LatLng(
                  result.geometry!.location.lat,
                  result.geometry!.location.lng,
                ),
              );
          Navigator.of(context).pop();
        },
        initialPosition: myLocation,
        useCurrentLocation: true,
        resizeToAvoidBottomInset:
            false, // only works in page mode, less flickery, remove if wrong offsets
      ),
    ),
  );
}
 */

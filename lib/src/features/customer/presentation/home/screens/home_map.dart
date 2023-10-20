// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print, inference_failure_on_instance_creation, use_build_context_synchronously
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
//import 'package:map_location_picker/map_location_picker.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:map_location_picker/map_location_picker.dart';

import 'package:wakaluxe/data/dummy.dart';
import 'package:wakaluxe/src/common/Utils/wakalux_icons_icons.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakaluxe_driver_card.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
//import 'package:wakaluxe/src/features/customer/data/data_sources/mapbox_services.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/screens/wakaluxe_home_sheets.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/on_trip_widget.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/pay_fare_widget.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/select_driver_widget.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/showing_booking_detail_widget.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/taxi_fetching.dart';

// List<Map<String, dynamic>> data = []
@RoutePage(name: 'HomeMap')
class HomeMap extends StatefulWidget {
  const HomeMap({super.key});

  static String path = '/home-map';

  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  String address = 'null';
  String autocompletePlace = 'null';
  final Completer<GoogleMapController> _mapController = Completer();

  final LatLng _source = const LatLng(3.8857, 11.5454);
  final LatLng _destination = const LatLng(3.892268, 11.547712);
  LocationData? _currentPosition;

  List<LatLng> _polylineCoordinates = [];
  //Prediction? initialValue;

  // final TextEditingController _controller = TextEditingController();
  //final LatLng _center = const LatLng(45.521563, -122.677433);

  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) =>
      mapController = controller;

  Future<void> _getPolyPoints() async {
    final polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
      Constants.androidGoogleMapKey,
      PointLatLng(_source.latitude, _source.longitude),
      PointLatLng(_destination.latitude, _destination.longitude),
    );

    if (result.points.isNotEmpty) {
      final points =
          result.points.map((e) => LatLng(e.latitude, e.longitude)).toList();
      _polylineCoordinates = points;
      setState(() {});
    }
  }

  Future<void> _getCurrentLocation() async {
    final location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    _currentPosition = locationData;
    final controller = await _mapController.future;

    location.onLocationChanged.listen((event) {
      _currentPosition = event;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              event.latitude!,
              event.longitude!,
            ),
            zoom: 14.4746,
          ),
        ),
      );
      setState(() {});
    });
  }

  /*  WayPoint? _origin;

  WayPoint? _destination;

  double? _distanceRemaining, _durationRemaining; 
  MapBoxNavigationViewController? _controller; */
//  late MapBoxOptions _navigationOption;

  @override
  void initState() {
    _getCurrentLocation();
    _getPolyPoints();
    super.initState();
//    initialize();
  }

  Map<String, double>? _initialLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.onTrip) {
            context.showSnackBar('Will be able to get directions in 5s');
          }
          if (state.getDirections) {
            context.showSnackBar(
              'Click, Payment bottom will show in 10s',
            );
          }
          if (state.loadingDrivers) {
            Future.delayed(const Duration(seconds: 4), () {
              context.read<HomeBloc>().add(
                    ShowDriversEvent(showDrivers: true, loadingDrivers: false),
                  );
            });
          }

          /*    final starter = WayPoint(
            name: 'departing point',
            latitude: _initialLocation!['latitude'],
            longitude: _initialLocation!['longitude'],
            isSilent: false,
          ); */

          if (state.payfare) {
            //TODO: GOOGLE MAP NAV START
            /*   MapBoxNavigation.instance.startNavigation(
              wayPoints: [
                /* _origin,
                _destination, */
                starter,
                _destined!,
              ],
            ); */
          }
        },
        builder: (context, state) {
          final data = getDriverData();
          if (state.loadingDrivers) {
            return const TaxiFetching();
          }
          return Stack(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  //     if (state.myCoordinate.latitude != 0) {
                  _initialLocation = {
                    'latitude': 3.8848841,
                    'longitude': 11.5449282,
                  };
                  //     }

                  return GoogleMap(
                    myLocationEnabled: true,
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        _initialLocation!['latitude']!,
                        _initialLocation!['longitude']!,
                      ),
                      zoom: 16,
                    ),
                  );
                },
              ),
              SafeArea(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              //  remove and replace with hamburger icon
                              GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: context.colorScheme.background,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.menu,
                                    color: context.colorScheme.onBackground,
                                  ),
                                ),
                              ),
                              8.hGap,
                              Expanded(
                                flex: 4,
                                child: SizedBox(
                                  child: (state.getDirections ||
                                          state.onTrip ||
                                          state.payfare ||
                                          state.showBookingDetails)
                                      ? Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                context.colorScheme.background,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: const Text(
                                            'Driver reaching Destination in 5 mins',
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      : WakaluxeLocationWidget(
                                          leading: Icon(
                                            Icons.person,
                                            color: context.colorScheme.primary,
                                          ),
                                          trainling: Icon(
                                            Icons.close,
                                            color: context
                                                .colorScheme.onBackground,
                                          ),
                                          message: 'Location Coordinates',
                                          onTap: () {
                                            debugPrint('Testing out');
                                          },
                                        ),
                                ),
                              ),
                              8.hGap,
                              WakaluxeProfileImage(
                                onTap: () {
                                  Scaffold.of(context).openEndDrawer();
                                },
                                imageUrl: 'https://i.pravatar.cc/480',
                              ),
                            ],
                          ),
                          5.vGap,
                          if (state.getDirections ||
                              state.onTrip ||
                              state.payfare ||
                              state.showBookingDetails)
                            0.vGap
                          else
                            Row(
                              children: [
                                Expanded(child: 30.hGap),
                                Expanded(
                                  flex: 4,
                                  child: SizedBox(
                                    child: WakaluxeLocationWidget(
                                      leading: Icon(
                                        WakaluxIcons.location,
                                        color: context.colorScheme.error,
                                      ),
                                      trainling: Icon(
                                        Icons.close,
                                        color: context.colorScheme.onBackground,
                                      ),
                                      message: 'Destination Coordinates',
                                      onTap: _handleDestinationSelection,
                                    ),
                                  ),
                                ),
                                Expanded(child: 30.hGap),
                              ],
                            ),
                          // will handle a bottom sheet and a modal sheet
                        ],
                      ),
                    ),
                    if (state.selectDriver) const SelectDriverWidget(),
                    if (state.showDrivers)
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          height: context.height * 0.36,
                          width: context.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              //dummy data to be removed
                              final driver = data[index];
                              return WakaluxCard(
                                child: WakaluxeBookingDetails(
                                  action: () {
                                    context.read<HomeBloc>().add(
                                          HomeInitialEvent(),
                                        ); // show dialof to confirm ride
                                    WakaluxeBottomSheets.showConfirmDialog(
                                      context,
                                    );
                                  },
                                  driverImage: driver['driverImage'] as String,
                                  driverName: driver['driverName'] as String,
                                  rating: 4.0,
                                  recommended: 30,
                                  distance: double.parse(
                                    driver['distance'].toString(),
                                  ).toStringAsFixed(2),
                                  price: driver['price'] as String,
                                  time: '5',
                                  imageLiknks: images,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    if (state.showBookingDetails)
                      const ShowBookingDetailsWidget(),
                    if (state.onTrip) const OnTripWidget(),
                    if (state.getDirections)
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: WakaluxeButton(
                            text: 'Get Directions',
                            action: () {
                              WakaluxeBottomSheets.showDiretionSheet(context);
                            },
                            color: context.colorScheme.tertiary,
                            textColor: context.colorScheme.onTertiary,
                          ),
                        ),
                      ),
                    //TODO: GOOGLE MAP NAV START
                    if (state.payfare) const PayFareWidget(waypoints: [])
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  //WayPoint? _destined;

  Future<void> _handleDestinationSelection() async {
    // _waypoints.add(_origin);
    /*  await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: Platform.isAndroid
              ? Constants.androidGoogleMapKey
              : Constants.iosGoogleMapKey,
          onPlacePicked: (result) {
            logDebug('destined location ${result.geometry!.location}');
            _destined = WayPoint(
              name: 'destination',
              latitude: result.geometry!.location.lat,
              longitude: result.geometry!.location.lng,
              isSilent: false,
            );
            //      _waypoints.add(_destination);
            context.read<HomeBloc>().add(
                  SelectLocationEvent(
                    lat: result.geometry!.location.lat,
                    lng: result.geometry!.location.lng,
                  ),
                );
            Navigator.of(context).pop();
          },
          initialPosition: _center,
          useCurrentLocation: true,
          resizeToAvoidBottomInset:
              false, // only works in page mode, less flickery, remove if wrong offsets
        ),
      ),
    ); */
  }

  @override
  void dispose() {
    super.dispose();
  }
}

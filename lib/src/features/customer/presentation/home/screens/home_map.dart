import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';

import 'package:location/location.dart' as Loc;
import 'package:wakaluxe/data/dummy.dart';
import 'package:wakaluxe/l10n/l10n.dart';
import 'package:wakaluxe/src/common/Utils/logger.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/wakaluxe_driver_card.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';
import 'package:wakaluxe/src/features/customer/domain/entities/location_entity.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/driver_fetching_loading_widget.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/pay_fare_widget.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/select_driver_widget.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/showing_booking_detail_widget.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/taxi_fetching.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/trip_state_widget.dart';

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
  late final Completer<GoogleMapController> _mapController = Completer();

  LatLng? _source;
  final fakeDestination = const LatLng(3.8860, 11.5454);
  LatLng? _destination;
  // = const LatLng(3.892268, 11.547712);
  Loc.LocationData? _currentPosition;

  List<LatLng> _polylineCoordinates = [];
  BitmapDescriptor _sourceIcon = BitmapDescriptor.defaultMarker;

  //Prediction? initialValue;

  LatLng? _center;
  //const LatLng(45.521563, -122.677433);

  late GoogleMapController mapController;
  Set<Marker> _markers = {};
  Future<BitmapDescriptor> getMarkerIcon(String imagePath) async {
    final ref = FirebaseStorage.instance.ref().child(imagePath);
    final url = await ref.getDownloadURL();

    final completer = Completer<ui.Image>();
    final stream = NetworkImage(url).resolve(ImageConfiguration.empty);
    final listener = ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info.image);
    });
    stream.addListener(listener);
    final image = await completer.future;
    stream.removeListener(listener);

    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(pngBytes);
  }

  Future<void> _showBookingRideDetailBottomSheet() async {
    showBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(8.w),
        height: 0.8.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: context.colorScheme.surface,
        ),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                boxShadow: [],
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  WakaluxPlaceWidget(
                    controller: _startLocationPlacePickerController,
                    placeHolder: 'Current Location',
                    initialPostion: _currentPosition == null
                        ? const LatLng(3.8731776, 11.5146752)
                        : LatLng(
                            _currentPosition!.latitude!,
                            _currentPosition!.longitude!,
                          ),
                  ),
                  SizedBox(
                    width: 0.8.sw,
                    child: const Divider(),
                  ),
                  WakaluxPlaceWidget(
                    controller: _endLocationPlacePickerController,
                    placeHolder: 'where are you going to ?',
                    initialPostion: _currentPosition == null
                        ? const LatLng(3.8731776, 11.5146752)
                        : LatLng(
                            _currentPosition!.latitude!,
                            _currentPosition!.longitude!,
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _startLocationPlacePickerController = TextEditingController();
  final _endLocationPlacePickerController = TextEditingController();

  Set<Marker> generateNearbyMarkers(double latitude, double longitude) {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(16, 16)),
      Constants.taxiIcon,
    ).then((icon) {
      for (var i = 0; i < 10; i++) {
        final offset =
            i / 1000; // This will create a small offset for each marker
        final marker = Marker(
          markerId: MarkerId('marker$i'),
          icon: icon,
          position: LatLng(latitude + offset, longitude + offset),
        );
        _markers.add(marker);
      }
    });

    return _markers;
  }

  void _onMapCreated(GoogleMapController controller) =>
      _mapController.complete(controller);

  Future<void> _getPolyPoints() async {
    final polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
      Constants.androidGoogleMapKey,
      PointLatLng(_source!.latitude, _source!.longitude),
      PointLatLng(_destination!.latitude, _destination!.longitude),
    );

    if (result.points.isNotEmpty) {
      final points =
          result.points.map((e) => LatLng(e.latitude, e.longitude)).toList();
      _polylineCoordinates = points;
      setState(() {});
    }
  }

  Future<void> _handleMyLocationButton() async {
    final locationService = Loc.Location();
    var permissionStatus = await locationService.hasPermission();
    if (permissionStatus == Loc.PermissionStatus.denied) {
      permissionStatus = await locationService.requestPermission();
      if (permissionStatus != Loc.PermissionStatus.granted) {
        return;
      }
    }

    final locationData = await locationService.getLocation();
    await mapController.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(locationData.latitude!, locationData.longitude!),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    final location = Loc.Location();

    bool serviceEnabled;
    Loc.PermissionStatus permissionGranted;
    Loc.LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == Loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != Loc.PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

    _currentPosition = locationData;
    logInfo('location data: $_currentPosition ');
    setState(() {});
    final controller = await _mapController.future;
    await location.changeSettings(
      interval: 100,
    );
    location.onLocationChanged.listen((event) {
      _currentPosition = event;
      context.read<HomeBloc>().add(
            UpdateUserCoordindateEvent(
              LatLng(locationData.latitude!, locationData.longitude!),
            ),
          );
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              event.latitude!,
              event.longitude!,
            ),
            zoom: 18.4746,
          ),
        ),
      );
      _markers = generateNearbyMarkers(event.latitude!, event.longitude!);
      setState(() {});
    });
  }

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      floatingActionButton: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => FloatingActionButton(
          backgroundColor: context.colorScheme.primary,
          shape: const CircleBorder(),
          onPressed: () => _handleDestinationSelectionWithoutPlacePicker(
            state.myCoordinate,
          ),
          child: const Icon(
            Icons.navigation_outlined,
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(16),
            height: 0.3.sh,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).whereAreYouGoing,
                      suffixIcon: const Icon(
                        Icons.search,
                      ),
                      border: OutlineInputBorder(
                        gapPadding: 1,
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.r),
                        ),
                      ),
                    ),
                  ),
                ),
                /*    const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Destination',
                    border: OutlineInputBorder(),
                  ),
                ), */
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: 5, // Replace with the number of past rides
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: context.colorScheme.surface,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${AppLocalizations.of(context).destination} $index',
                                style: context.theme.textTheme.bodyMedium,
                              ),
                              1.vGap,
                              Text(
                                '1$index m',
                                style: context.theme.textTheme.bodySmall,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset(
                                  Constants.taxiIcon,
                                  fit: BoxFit.fill,
                                  width: 40.w,
                                  height: 40.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.onTrip) {
            //  context.showSnackBar('Will be able to get directions in 5s');
          }
          if (state.getDirections) {
            context.showSnackBar(
              'Click, Payment bottom will show in 10s',
            );
          }
          if (state.showDrivers) {
            _getPolyPoints();
            _setCustomMarkerIcon();
          }
          /*  if (state.loadingDrivers) {
            Future.delayed(const Duration(seconds: 1), () {
              context.read<HomeBloc>().add(
                    ShowDriversEvent(showDrivers: true, loadingDrivers: false),
                  );
            });
          } */
          if (state.showDrivers) {
            _mapController.future.then((controller) {
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(
                      _destination!.latitude,
                      _destination!.longitude,
                    ),
                    zoom: 18.4746,
                  ),
                ),
              );
            });
          }
          if (state.getDirections) {
            _getPolyPoints();
          }

          if (state.payfare) {
            //TODO: GOOGLE MAP NAV START
          }
        },
        builder: (context, state) {
          final data = getDriverData();
          if (state.loadingDrivers) {
            return const DriverFetchingLoadingWidget();
          }
          if (state.selectDriver) {
            return const TaxiFetching();
          }
          return Stack(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return
                      /* _currentPosition?.latitude == null
                      ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Getting your location...'),
                            ],
                          ),
                        )
                      :  */
                      _currentPosition == null
                          ? const Center(child: CircularProgressIndicator())
                          : GoogleMap(
                              zoomControlsEnabled: false,
                              mapToolbarEnabled: false,
                              compassEnabled: false,
                              myLocationButtonEnabled: false,
                              polylines: {
                                if (_polylineCoordinates.isNotEmpty)
                                  Polyline(
                                    polylineId: const PolylineId('route'),
                                    color: context.colorScheme.primary,
                                    width: 5,
                                    points: _polylineCoordinates,
                                  ),
                              },
                              markers: {
                                ..._markers,
                                Marker(
                                  //    icon: _currentIcon,
                                  markerId: const MarkerId('current location'),
                                  position: LatLng(
                                    _currentPosition!.latitude!,
                                    _currentPosition!.longitude!,
                                  ),
                                ),
                                if (_source != null &&
                                    _destination != null) ...{
                                  Marker(
                                    markerId: const MarkerId('start location'),
                                    position: _source!,
                                    icon: _sourceIcon,
                                  ),
                                  Marker(
                                    //   icon: _destinationIcon,
                                    markerId:
                                        const MarkerId('destination location'),
                                    position: _destination!,
                                  ),
                                },
                              },
                              onMapCreated: _onMapCreated,
                              initialCameraPosition: CameraPosition(
                                target: LatLng(
                                  _currentPosition!.latitude!,
                                  _currentPosition!.longitude!,
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
                          5.vGap,

                          // will handle a bottom sheet and a modal sheet
                        ],
                      ),
                    ),
                    if (state.selectDriver) const SelectDriverWidget(),
                    if (state.showBookingDetails)
                      ShowBookingDetailsWidget(
                        tourId: state.tourData.data!.datum!.id!,
                      ),
                    /* if (state.tourData.data!.datum!.duration !> 0)
                      Positioned(
                        top: 20,
                        child: TravelTimeWidget(
                          travelTime: state.tourData.data!.datum!.duration! ,
                        ),
                      ), */

                    if (state.onTrip) ...[const NavigationInfoWidget()],
                    /* if (state.getDirections)
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
                      ), */
                    //TODO: GOOGLE MAP NAV START
                    if (state.showDestionPicker)
                      /* Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 32,
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: PlacePicker(
                              apiKey: Platform.isAndroid
                                  ? Constants.androidGoogleMapKey
                                  : Constants.androidGoogleMapKey,
                              hintText: 'Find a place ...',
                              searchingText: 'Please wait ...',
                              selectText: 'Select place',
                              //    initialPosition: HomePage.kInitialPosition,
                              useCurrentLocation: true,
                              selectInitialPosition: true,
                              initialPosition: LatLng(
                                _currentPosition!.latitude!,
                                _currentPosition!.longitude!,
                              ),
                              usePlaceDetailSearch: true,
                              zoomControlsEnabled: true,
                              //   ignoreLocationPermissionErrors: true,
                              onPlacePicked: (PickResult result) {
                                setState(() {
                                  //      selectedPlace = result;
                                  //    _showPlacePickerInContainer = false;
                                });
                              },
                              onTapBack: () {
                                setState(() {
                                  //       _showPlacePickerInContainer = false;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
 */
                      if (state.payfare) const PayFareWidget(waypoints: []),

                    if (state.showDrivers)
                      /* Container(
                        width: 0.8.sw,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                        ),
                      ), */
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            child: WakaluxCard(
                              child: WakaluxeBookingDetails(
                                action: () {
                                  context.read<HomeBloc>().add(
                                        SelectedRideEvent(),
                                      ); // show dialof to confirm ride
                                  /* WakaluxeBottomSheets.showConfirmDialog(
                                    context,
                                  ); */
                                },
                                //TODO: implement get phone number from driver response
                                phoneNumber: '690596606',
                                driverImage:
                                    data.first['driverImage'] as String,
                                driverName: data.first['driverName'] as String,
                                rating: 4.0,
                                recommended: 30,
                                distance: state.tourData.distanceText!,
                                price: '${state.tourData.data!.datum!.price!}',
                                time: state.tourData.durationText!,
                                imageLiknks: images,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

//final TextEditingController _controller = TextEditingController();

  Future<void> _handleDestinationSelectionWithoutPlacePicker(
    LocationEntity location,
  ) async {
    _destination = LatLng(
      fakeDestination.latitude,
      fakeDestination.longitude,
    );
    _source = LatLng(
      location.latitude,
      location.longitude,
    );
    /*  await _getPolyPoints();
    _setCustomMarkerIcon(); */
    logInfo('the destination in ui is $_destination');
    //      _waypoints.add(_destination);
    context.read<HomeBloc>().add(
          SelectLocationEvent(
            destination: LatLng(
              fakeDestination.latitude,
              fakeDestination.longitude,
            ),
            destinationAddress: 'Buea',
            source: LatLng(
              _currentPosition!.latitude!,
              _currentPosition!.longitude!,
            ),
          ),
        );
  }

  Future<void> _handleDestinationSelection(LocationEntity location) async {
    // _waypoints.add(_origin);
    // await WakaluxeBottomSheets.showDestinationPicker(context);

//create an alternative with mock location data for test
    _destination = LatLng(
      fakeDestination.latitude,
      fakeDestination.longitude,
    );
    _source = LatLng(
      location.latitude,
      location.longitude,
    );
    await _getPolyPoints();
    _setCustomMarkerIcon();
    //      _waypoints.add(_destination);
    context.read<HomeBloc>().add(
          SelectLocationEvent(
            destination: LatLng(
              fakeDestination.latitude,
              fakeDestination.longitude,
            ),
            destinationAddress: 'Buea',
            source: LatLng(
              _currentPosition!.latitude!,
              _currentPosition!.longitude!,
            ),
          ),
        );

//! PLACE PICKER wait for test
    /*   await Navigator.push(
longitude 11.5146752 latitude: 3.8731776
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: Platform.isAndroid
              ? Constants.androidGoogleMapKey
              : Constants.iosGoogleMapKey,
          initialPosition: LatLng(
            location.latitude,
            location.longitude,
          ),
          onPlacePicked: (result) {
            logDebug('destined location ${result.geometry!.location}');
            _destination = LatLng(
              result.geometry!.location.lat,
              result.geometry!.location.lng,
            );
            _source = LatLng(
              location.latitude,
              location.longitude,
            );

            //      _waypoints.add(_destination);
            context.read<HomeBloc>().add(
                  SelectLocationEvent(
                    destination: LatLng(
                      result.geometry!.location.lat,
                      result.geometry!.location.lng,

                    ),
                    source: LatLng(
                      _currentPosition!.latitude!,
                      _currentPosition!.longitude!,
                    ),
                    destinationAddress: result.formattedAddress!
                  ),
                );
            Navigator.of(context).pop();
          },
          // only works in page mode, less flickery, remove if wrong offsets
        ),
      ),
    );
   */
  }

  void _setCustomMarkerIcon() {
    /*  */
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(16, 16)),
      'assets/icons/source.png',
    ).then((value) => _sourceIcon = value);
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class WakaluxPlaceWidget extends StatefulWidget {
  const WakaluxPlaceWidget({
    required this.controller,
    required this.placeHolder,
    required this.initialPostion,
    super.key,
  });

  final TextEditingController controller;
  final String placeHolder;
  final LatLng initialPostion;

  @override
  State<WakaluxPlaceWidget> createState() => _WakaluxPlaceWidgetState();
}

class _WakaluxPlaceWidgetState extends State<WakaluxPlaceWidget> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Constants.markerIcon),
        2.hGap,
        GooglePlacesAutoCompleteTextFormField(
          initialValue: widget.placeHolder,
          textEditingController: widget.controller,
          googleAPIKey: Platform.isAndroid
              ? Constants.androidGoogleMapKey
              : Constants.iosGoogleMapKey,
          proxyURL:
              'https://your-proxy.com/', // only needed if you build for the web
          debounceTime: 400, // defaults to 600 ms,
          countries: const [
            'en',
          ], // optional, by default the list is empty (no restrictions)
          getPlaceDetailWithLatLng: (prediction) {
            // this method will return latlng with place detail
            print('placeDetails${prediction.lng}');
          }, // this callback is called when isLatLngRequired is true
          itmClick: (prediction) {
            widget.controller.text = prediction.description!;
            widget.controller.selection = TextSelection.fromPosition(
              TextPosition(
                offset: prediction.description!.length,
              ),
            );
          },
        ),
        2.hGap,
        InkWell(
          onTap: _handlePlacePicker,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: const Text('Map'),
          ),
        ),
      ],
    );
  }

  void _handlePlacePicker() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: Platform.isAndroid
              ? Constants.androidGoogleMapKey
              : Constants.iosGoogleMapKey,
          initialPosition: widget.initialPostion,
        ),
      ),
    );
  }
}

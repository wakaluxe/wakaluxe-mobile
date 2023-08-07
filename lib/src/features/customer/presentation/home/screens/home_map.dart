// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
//import 'package:map_location_picker/map_location_picker.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:map_location_picker/map_location_picker.dart';

import 'package:wakaluxe/data/dummy.dart';
import 'package:wakaluxe/features/payments/presentation/pages/payment_methods_screen.dart';
import 'package:wakaluxe/src/common/Utils/wakalux_icons_icons.dart';
import 'package:wakaluxe/src/common/common.dart';
import 'package:wakaluxe/src/common/widgets/menu_drawer.dart';
import 'package:wakaluxe/src/common/widgets/profile_drawer.dart';
import 'package:wakaluxe/src/common/widgets/wakaluxe_driver_card.dart';
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/extensions/build_context.dart';
import 'package:wakaluxe/src/extensions/num.dart';
import 'package:wakaluxe/src/features/customer/domain/bloc/home_bloc/home_bloc.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/screens/wakaluxe_home_sheets.dart';
import 'package:wakaluxe/src/features/customer/presentation/home/widgets/taxi_fetching.dart';
import 'package:wakaluxe/src/router/wakaluxe_router.gr.dart';

// List<Map<String, dynamic>> data = []
@RoutePage(name: 'HomeMap')
class HomeMap extends StatefulWidget {
  const HomeMap({super.key});

  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  String address = "null";
  String autocompletePlace = "null";
  //Prediction? initialValue;

  // final TextEditingController _controller = TextEditingController();
  late final LatLng _center;

  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  String? _platformVersion;
  String? _instruction;
  final _origin = WayPoint(
      name: "Way Point 1",
      latitude: 38.9111117447887,
      longitude: -77.04012393951416,
      isSilent: true);
  final _stop1 = WayPoint(
      name: "Way Point 2",
      latitude: 38.91113678979344,
      longitude: -77.03847169876099,
      isSilent: true);
  final _stop2 = WayPoint(
      name: "Way Point 3",
      latitude: 38.91040213277608,
      longitude: -77.03848242759705,
      isSilent: false);
  final _stop3 = WayPoint(
      name: "Way Point 4",
      latitude: 38.909650771013034,
      longitude: -77.03850388526917,
      isSilent: true);
  final _destination = WayPoint(
      name: "Way Point 5",
      latitude: 38.90894949285854,
      longitude: -77.03651905059814,
      isSilent: false);

  final _home = WayPoint(
      name: "Home",
      latitude: 37.77440680146262,
      longitude: -122.43539772352648,
      isSilent: false);

  final _store = WayPoint(
      name: "Store",
      latitude: 37.76556957793795,
      longitude: -122.42409811526268,
      isSilent: false);
  bool _isMultipleStop = false;
  double? _distanceRemaining, _durationRemaining;
  MapBoxNavigationViewController? _controller;
  bool _routeBuilt = false;
  bool _isNavigating = false;
  bool _inFreeDrive = false;
  late MapBoxOptions _navigationOption;
  Future<void> _onEmbeddedRouteEvent(e) async {
    _distanceRemaining = await MapBoxNavigation.instance.getDistanceRemaining();
    _durationRemaining = await MapBoxNavigation.instance.getDurationRemaining();

    switch (e.eventType) {
      case MapBoxEvent.progress_change:
        var progressEvent = e.data as RouteProgressEvent;
        if (progressEvent.currentStepInstruction != null) {
          _instruction = progressEvent.currentStepInstruction;
        }
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        setState(() {
          _routeBuilt = true;
        });
        break;
      case MapBoxEvent.route_build_failed:
        setState(() {
          _routeBuilt = false;
        });
        break;
      case MapBoxEvent.navigation_running:
        setState(() {
          _isNavigating = true;
        });
        break;
      case MapBoxEvent.on_arrival:
        if (!_isMultipleStop) {
          await Future.delayed(const Duration(seconds: 3));
          await _controller?.finishNavigation();
        } else {}
        break;
      case MapBoxEvent.navigation_finished:
      case MapBoxEvent.navigation_cancelled:
        setState(() {
          _routeBuilt = false;
          _isNavigating = false;
        });
        break;
      default:
        break;
    }
    setState(() {});
  }

  @override
  void initState() {
     super.initState();
    initialize();
  }

  List<WayPoint> _waypoints = [];

  Future<void> initialize() async {
    final location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _center = LatLng(location.latitude, location.longitude);
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    _navigationOption = MapBoxOptions(
        initialLatitude: 36.1175275,
        initialLongitude: -115.1839524,
        zoom: 13.0,
        tilt: 0.0,
        bearing: 0.0,
        enableRefresh: false,
        alternatives: true,
        voiceInstructionsEnabled: true,
        bannerInstructionsEnabled: true,
        allowsUTurnAtWayPoints: true,
        mode: MapBoxNavigationMode.drivingWithTraffic,
        mapStyleUrlDay: "https://url_to_day_style",
        mapStyleUrlNight: "https://url_to_night_style",
        units: VoiceUnits.imperial,
        simulateRoute: true,
        language: "en");
    _navigationOption.simulateRoute = true;

    MapBoxNavigation.instance.registerRouteEventListener(_onEmbeddedRouteEvent);
    MapBoxNavigation.instance.setDefaultOptions(_navigationOption);

    String? platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await MapBoxNavigation.instance.getPlatformVersion();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scheme.background,
      /*    drawer: const MenuDrawer(),
      endDrawer: const ProfileDrawer(),
  */
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
            Future.delayed(const Duration(seconds: 2), () {
              context.read<HomeBloc>().add(
                    ShowDriversEvent(showDrivers: true, loadingDrivers: false),
                  );
            });
          }

          if (state.payfare) {
            MapBoxNavigation.instance.startNavigation(
              wayPoints: _waypoints,
            );
          }
        },
        builder: (context, state) {
          final data = getDriverData();
          if (state.loadingDrivers) {
            return const TaxiFetching();
          }
          return Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11,
                ),
              ),
              /*   Expanded(
                child: Container(
                  color: Colors.grey,
                  child: GoogleMap(
                      options: _navigationOption,
                      onRouteEvent: _onEmbeddedRouteEvent,
                      onCreated:
                          (MapBoxNavigationViewController controller) async {
                        final _origin = WayPoint(
                            name: "Way Point 1",
                            latitude: state.lat,
                            longitude: state.lng,
                            isSilent: true);
                        _controller = controller;
                        await controller.initialize();
                        await controller
                            .buildRoute(wayPoints: [_origin, _destination]);
                      }),
                ),
              ), */
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
                                    color: context.scheme.background,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.menu,
                                    color: context.scheme.onBackground,
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
                                            color: context.scheme.background,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: const Text(
                                            'Driver reaching Destination in 5mins',
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      : WakaluxeLocationWidget(
                                          leading: Icon(
                                            Icons.person,
                                            color: context.scheme.primary,
                                          ),
                                          trainling: Icon(
                                            Icons.close,
                                            color: context.scheme.onBackground,
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
                                imageUrl: 'https://placeimg.com/640/480/any',
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
                                        color: context.scheme.error,
                                      ),
                                      trainling: Icon(
                                        Icons.close,
                                        color: context.scheme.onBackground,
                                      ),
                                      message: 'Destination Coordimates',
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
                    if (state.selectDriver)
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: WakaluxeButton(
                            text: 'Select a driver',
                            action: () {
                              context.read<HomeBloc>().add(
                                    SelectDriverEvent(
                                      selectDriver: !state.selectDriver,
                                    ),
                                  );
                              context.read<HomeBloc>().add(
                                    ShowDriversEvent(
                                      showDrivers: true,
                                      loadingDrivers: false,
                                    ),
                                  );
                            },
                            color: context.scheme.tertiary,
                            textColor: context.scheme.onTertiary,
                          ),
                        ),
                      ),
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
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: WakaluxCard(
                          child: WakaluxeCancleRide(
                            driverImage: 'https://placeimg.com/640/480/nature',
                            driverName: 'Ayuko Peters',
                            dropOffLocation: 'Avenue des banques',
                            paymentAmount: '500',
                            paymentMethod: 'MTN Mobile Money',
                            pickUpLocation: 'Dispensaire Messasi',
                            rating: 4.0,
                            timeLeft: 5,
                            action: () {
                              context.read<HomeBloc>().add(
                                    HomeInitialEvent(),
                                  );
                              WakaluxeBottomSheets.showRemarkSheet(
                                context,
                                () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    if (state.onTrip)
                      const Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: WakaluxCard(
                          child: WakaluxeOnTrip(
                            driverImage: Constants.driver,
                            driverName: 'Ayuko Peters',
                            rating: 4,
                          ),
                        ),
                      ),
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
                              final _origin = WayPoint(
                                  name: "Way Point 1",
                                  latitude: state.lat,
                                  longitude: state.lng,
                                  isSilent: true);

                              setState(() {
                                _controller?.buildRoute(
                                    wayPoints: [_origin, _destination]);
                              });
                            },
                            color: context.scheme.tertiary,
                            textColor: context.scheme.onTertiary,
                          ),
                        ),
                      ),
                    if (state.payfare)
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: WakaluxeButton(
                            text: 'Pay fare',
                            action: () async {
                              print("pay fare: ${_waypoints} ");

                              context.showSnackBar(
                                'Will still to move to payment screen',
                              );
                              await Future.delayed(Duration(seconds: 2));
                              context.read<HomeBloc>().add(
                                    HomeInitialEvent(),
                                  );
                              context.router.pushAndPopUntil(
                                const PaymentMethodsRoute(),
                                predicate: (_) => true,
                              );
                            },
                            color: context.scheme.primary,
                            // textColor: context.scheme.onTertoniary,
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _handleDestinationSelection() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final homePosition = WayPoint(
        name: 'location',
        latitude: position.latitude,
        longitude: position.longitude);
    _waypoints.add(homePosition);
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: Platform.isAndroid
              ? Constants.androidGoogleMapKey
              : Constants.iosGoogleMapKey,
          onPlacePicked: (result) {
            print(result.geometry!.location.lat);
            final waypoint = WayPoint(
                name: 'destinations',
                latitude: result.geometry!.location.lat,
                longitude: result.geometry!.location.lng);
            _waypoints.add(waypoint);
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
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}

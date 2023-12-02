import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:wakaluxe/src/configs/wakaluxe_constants.dart';
import 'package:wakaluxe/src/features/customer/data/models/api_tour_model.dart';

Future<CreateTourApiResModel> getTraveldData({
  required LatLng start,
  required LatLng end,
}) async {
  final url =
      'https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&key=${Constants.googleApiKey}';
  final response = await http.get(Uri.parse(url));
  final values = (jsonDecode(response.body)) as Map<String, dynamic>;
  final model = CreateTourApiResModel(
    durationValue: values['routes'][0]['legs'][0]['duration']['value'] as int,
    distanceValue: values['routes'][0]['legs'][0]['distance']['value'] as int,
    distanceText: values['routes'][0]['legs'][0]['distance']['text'] as String,
    durationText: values['routes'][0]['legs'][0]['duration']['text'] as String,
    destinationAddress:
        values['routes'][0]['legs'][0]['end_address'] as String,
  );
  return model;
}

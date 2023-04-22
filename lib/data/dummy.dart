import 'dart:math';

List<Map<String, dynamic>> suggestedRides = [
  {
    'name': 'Sedan',
    'price': '3000',
    'availableTime': '2 mins',
    'type': 'standard',
  },
  {
    'name': 'SUV',
    'price': '3000',
    'availableTime': '2 mins',
    'type': 'Comfortable SUV',
  },
  {
    'name': 'Luxurious',
    'price': '3000',
    'availableTime': '10 mins',
    'type': 'Comfortable SUV',
  },
  {
    'name': 'Taxi 4 Seat',
    'price': '3000',
    'availableTime': '2 mins',
    'type': 'standard',
  },
  {
    'name': 'Taxi 7 Seat',
    'price': '3000',
    'availableTime': '2 mins',
    'type': 'comfortable'
  },
];

List<String> images = [
  'https://placeimg.com/640/480/any',
  'https://placeimg.com/640/480/any',
  'https://placeimg.com/640/480/any',
  'https://placeimg.com/640/480/any',
];

List<Map<String, dynamic>> getDriverData() {
  final driversData = <Map<String, dynamic>>[];

  final random = Random();

  for (var i = 0; i < 6; i++) {
    driversData.add({
      'driverName': 'Driver ${i + 1}',
      'driverImage': 'https://placeimg.com/640/480/any',
      'distance': '${random.nextDouble()}',
      'price': '${random.nextInt(1000)}',
      'rating': random.nextDouble() * 5,
      'recommended': random.nextInt(100),
      'time': '${random.nextInt(10)}',
      'imageLinks': [
        'https://placeimg.com/640/480/any',
        'https://placeimg.com/640/480/animals',
        'https://placeimg.com/640/480/nature',
        'https://placeimg.com/640/480/tech',
      ],
    });
  }
  return driversData;
}

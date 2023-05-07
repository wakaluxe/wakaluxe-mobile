import 'dart:math';

List<Map<String, dynamic>> suggestedRides = [
  {
    'name': 'Sedan',
    'price': '3000',
    'availableTime': '2 mins',
    'type': 'standard',
    'image': 'assets/images/sedan_sm.png'
  },
  {
    'name': 'SUV',
    'price': '3000',
    'availableTime': '2 mins',
    'type': 'Comfortable SUV',
    'image': 'assets/images/suv_sm.png'
  },
  {
    'name': 'Luxurious',
    'price': '3000',
    'availableTime': '10 mins',
    'type': 'Comfortable SUV',
    'image': 'assets/images/luxurious_sm.png'
  },
  {
    'name': 'Taxi 4 Seat',
    'price': '3000',
    'availableTime': '2 mins',
    'type': 'standard',
    'image': 'assets/images/taxi_4.png'
  },
  {
    'name': 'Taxi 7 Seat',
    'price': '3000',
    'availableTime': '2 mins',
    'type': 'comfortable',
    'image': 'assets/images/taxi_7.png'
  },
];
List<Map<String, dynamic>> myGarageContext = [
  {
    'name': 'Suzuki Vitara',
    'image': 'assets/images/Suzuki-Car.png',
  },
  {
    'name': 'Range Rocer',
    'image': 'assets/images/SUV.png',
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

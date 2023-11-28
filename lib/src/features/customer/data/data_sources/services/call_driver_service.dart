import 'package:url_launcher/url_launcher.dart';

Future<void> callDriverService(String phoneNumber) async {
  final url = Uri.parse('tel:$phoneNumber');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $phoneNumber');
  }
}

Future<void> callDriverService(String phoneNumber) async {
  if (!await launchUrl('tel:${phoneNumber}')) {
    throw Exception('Could not launch $phoneNumber');
  }
}
class Event {
  final DateTime date;
  final String time;
  final String location;
  final double? latitude;
  final double? longitude;
  final String subject;

  Event({
    required this.date,
    required this.time,
    required this.location,
    this.latitude,
    this.longitude,
    required this.subject,
  });
}

import 'dart:convert';

List<LocationInterval> locationIntervalFromJson(String str) =>
    List<LocationInterval>.from(
        json.decode(str).map((x) => LocationInterval.fromJson(x)));

String locationIntervalToJson(List<LocationInterval> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationInterval {
  LocationInterval({
    required this.label,
    required this.duration,
  });

  String label;
  int duration;

  factory LocationInterval.fromJson(Map<String, dynamic> json) =>
      LocationInterval(
        label: json["label"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "duration": duration,
      };
}

import 'package:flutter/material.dart';

class StreamingPlatform {
  String id;
  String name;
  String logoUrl;
  List<String> supportedCountries;
  int totalCountries;

  StreamingPlatform({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.supportedCountries,
    required this.totalCountries,
  });
}

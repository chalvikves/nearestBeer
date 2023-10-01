// Things to put inside the API

import 'package:nearest_beer/features/bar/business/entities/sub_entities.dart';

class NoParams {}

class BarParams {
  final Geometry location;
  final int radius;
  final String type;

  BarParams({
    required this.location,
    required this.radius,
    required this.type,
  });
}

class TestParams {
  final int id;

  TestParams({required this.id});
}

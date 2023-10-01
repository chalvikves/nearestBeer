class ResultEntity {
  final PlaceEntity results;

  ResultEntity({required this.results});
}

class PlaceEntity {
  final String formattedAddress;
  final Geometry geometry;
  final String icon;
  final String iconBackgroundColor;
  final String name;
  final PlaceOpeningHours openingHours;
  final String placeId;
  final double rating;
  final bool servesBeer;

  PlaceEntity({
    required this.formattedAddress,
    required this.geometry,
    required this.icon,
    required this.iconBackgroundColor,
    required this.name,
    required this.openingHours,
    required this.placeId,
    required this.rating,
    required this.servesBeer,
  });
}

class Geometry {
  final LatLngLiteral location;

  Geometry({required this.location});
}

class LatLngLiteral {
  final double lat;
  final double lng;

  LatLngLiteral({required this.lat, required this.lng});
}

class PlaceOpeningHours {
  final bool openNow;
  final PlaceOpeningHoursPeriod periods;

  PlaceOpeningHours({
    required this.openNow,
    required this.periods,
  });
}

class PlaceOpeningHoursPeriod {
  final PlaceOpeningHoursPeriodDetail close;

  PlaceOpeningHoursPeriod({required this.close});
}

class PlaceOpeningHoursPeriodDetail {
  final int day;
  final String time;

  PlaceOpeningHoursPeriodDetail({required this.day, required this.time});
}

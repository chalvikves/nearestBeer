import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/bar_model.dart';
import '../../../../../core/errors/exceptions.dart';

abstract class BarLocalDataSource {
  Future<void>? cacheBar(BarModel? barToCache);

  Future<BarModel> getClosestBar();
  Future<Position> getCurrentPosition();
}

const cachedBar = 'CACHED_BAR';

class BarLocalDataSourceImpl implements BarLocalDataSource {
  final SharedPreferences sharedPreferences;

  BarLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<BarModel> getClosestBar() {
    final jsonString = sharedPreferences.getString(cachedBar);

    if (jsonString != null) {
      return Future.value(BarModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void>? cacheBar(BarModel? barToCache) async {
    if (barToCache != null) {
      sharedPreferences.setString(
        cachedBar,
        json.encode(
          barToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  @override
  Future<Position> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) {
      throw LocationException();
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

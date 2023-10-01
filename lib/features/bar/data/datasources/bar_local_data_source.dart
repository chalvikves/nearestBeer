import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/bar_model.dart';
import '../../../../../core/errors/exceptions.dart';

abstract class BarLocalDataSource {
  Future<void>? cacheBar(BarModel? barToCache);

  Future<BarModel> getClosestBar();
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
}

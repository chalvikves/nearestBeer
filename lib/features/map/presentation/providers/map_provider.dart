import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nearest_beer/core/connection/network_info.dart';
import 'package:nearest_beer/features/bar/data/datasources/bar_local_data_source.dart';
import 'package:nearest_beer/features/bar/data/datasources/bar_remote_data_source.dart';
import 'package:nearest_beer/features/bar/data/repositories/bar_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapProvider extends ChangeNotifier {
  Future<Position> getCurrentPosition() async {
    BarRepositoryImpl repository = BarRepositoryImpl(
      remoteDataSource: BarRemoteDataSourceImpl(
        dio: Dio(),
      ),
      localDataSource: BarLocalDataSourceImpl(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );

    final position = await repository.localDataSource.getCurrentPosition();
    return position;
  }
}

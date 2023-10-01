import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nearest_beer/core/connection/network_info.dart';
import 'package:nearest_beer/core/errors/failures.dart';
import 'package:nearest_beer/core/params/params.dart';
import 'package:nearest_beer/features/bar/business/entities/bar_entity.dart';
import 'package:nearest_beer/features/bar/business/entities/sub_entities.dart';
import 'package:nearest_beer/features/bar/business/usecases/get_bar.dart';
import 'package:nearest_beer/features/bar/data/datasources/bar_local_data_source.dart';
import 'package:nearest_beer/features/bar/data/datasources/bar_remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/bar_repository_impl.dart';

class BarProvider extends ChangeNotifier {
  BarEntity? barEntity;
  Failure? failure;

  BarProvider({
    this.barEntity,
    this.failure,
  });

  void eitherFailureOrBarEntity({
    // required Geometry location,
    // required int radius,
    // required String type,
    required int id,
  }) async {
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

    final failureOrBar = await GetBar(barRepository: repository).call(
        // barParams: BarParams(
        //   location: location,
        //   radius: radius,
        //   type: type,
        // ),
        barParams: TestParams(id: id));

    failureOrBar.fold((newFalure) {
      barEntity = null;
      failure = newFalure;
      notifyListeners();
    }, (newBar) {
      barEntity = newBar;
      failure = null;
      notifyListeners();
    });
  }
}

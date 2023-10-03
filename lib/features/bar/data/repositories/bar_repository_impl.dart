import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nearest_beer/core/connection/network_info.dart';
import 'package:nearest_beer/core/errors/exceptions.dart';
import 'package:nearest_beer/core/params/params.dart';
import 'package:nearest_beer/features/bar/business/repositories/bar_repository.dart';
import 'package:nearest_beer/features/bar/data/datasources/bar_local_data_source.dart';
import 'package:nearest_beer/features/bar/data/datasources/bar_remote_data_source.dart';

import '../../../../core/errors/failures.dart';
import '../models/bar_model.dart';

// Maybe add position into BarRepository

class BarRepositoryImpl implements BarRepository {
  final BarRemoteDataSource remoteDataSource;
  final BarLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  BarRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, BarModel>> getBar({
    required TestParams barParams,
    required Position position,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteBar = await remoteDataSource.getClosestBarFromPosition(
          params: barParams,
          position: position,
        );

        localDataSource.cacheBar(remoteBar);

        return Right(remoteBar);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'Server exception'));
      }
    } else {
      try {
        final localBar = await localDataSource.getClosestBar();
        return Right(localBar);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'No local data found'));
      }
    }
  }

  @override
  Future<Either<Failure, Position>> getCurrentPosition() async {
    try {
      final position = await localDataSource.getCurrentPosition();
      return Right(position);
    } on LocationException {
      return Left(LocationFailure(errorMessage: 'Location is disabled'));
    }
  }
}

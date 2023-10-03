import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nearest_beer/core/errors/failures.dart';
import 'package:nearest_beer/core/params/params.dart';
import 'package:nearest_beer/features/bar/business/entities/bar_entity.dart';

abstract class BarRepository {
  Future<Either<Failure, BarEntity>> getBar({
    required TestParams barParams,
    required Position position,
  });
  Future<Either<Failure, Position>> getCurrentPosition();
}

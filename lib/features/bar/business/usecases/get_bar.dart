import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nearest_beer/core/errors/failures.dart';
import 'package:nearest_beer/core/params/params.dart';
import 'package:nearest_beer/features/bar/business/entities/bar_entity.dart';
import 'package:nearest_beer/features/bar/business/repositories/bar_repository.dart';

class GetBar {
  final BarRepository barRepository;

  GetBar({
    required this.barRepository,
  });

  Future<Either<Failure, BarEntity>> call({
    required TestParams barParams,
    //required Position position,
  }) async {
    return await barRepository.getBar(
      barParams: barParams,
      //position: position,
    );
  }
}

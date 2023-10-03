import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nearest_beer/core/errors/exceptions.dart';

import '../../../../core/params/params.dart';
import '../models/bar_model.dart';

abstract class BarRemoteDataSource {
  Future<BarModel> getClosestBarFromPosition({
    required TestParams params,
    required Position position,
  });
}

class BarRemoteDataSourceImpl implements BarRemoteDataSource {
  final Dio dio;

  BarRemoteDataSourceImpl({required this.dio});

  @override
  Future<BarModel> getClosestBarFromPosition({
    required TestParams params,
    required Position position,
  }) async {
    // final response = await dio.get(
    //   'https://maps.googleapis.com/maps/api/place/nearbysearch/output?$params',
    //   queryParameters: {
    //     'api_key': const String.fromEnvironment('GOOGLE_API_KEY'),
    //   },
    // );

    final response = await dio.get(
      'https://pokeapi.co/api/v2/pokemon/${params.id}',
    );

    if (response.statusCode == 200) {
      return BarModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}

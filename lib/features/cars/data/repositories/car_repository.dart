import 'package:autochek_assessment/features/cars/data/models/car_inventory.dart';
import 'package:autochek_assessment/features/cars/data/models/car_inventory_detail.dart';
import 'package:autochek_assessment/features/cars/data/models/car_make.dart';
import 'package:autochek_assessment/features/cars/data/models/car_media.dart';
import 'package:autochek_assessment/utils/api_config.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CarRepository {
  CarRepository({required this.dio})
      : _dio = Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 3),
            receiveTimeout: const Duration(seconds: 3),
          ),
        );

  final Dio dio;

  final Dio _dio;

  Future<Either<String, CarMakes>> fetchCarPopularMakes() async {
    try {
      final response = await _dio.get(
        ApiConfig.popularMakes,
      );
      if (response.statusCode == 200 && response.data != null) {
        final carMakes = CarMakes.fromJson(
          response.data!,
        );
        return Right(carMakes);
      } else {
        return Left(response.statusMessage ?? 'Error');
      }
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, CarInventory>> fetchCarInventory() async {
    try {
      final response = await _dio.get(ApiConfig.allCars,);
      if (response.statusCode == 200 && response.data != null) {
        final carMakes = CarInventory.fromJson(
          response.data!,
        );
        return Right(carMakes);
      } else {
        return Left(response.statusMessage ?? 'Error');
      }
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, CarInventoryDetail>> fetchCarInventoryDetail({required String carId}) async {
    try {
      final response = await _dio.get(
        ApiConfig.carDetail(carId: carId),
      );
      if (response.statusCode == 200 && response.data != null) {
        final carMakes = CarInventoryDetail.fromJson(
          response.data!,
        );
        return Right(carMakes);
      } else {
        return Left(response.statusMessage ?? 'Error');
      }
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, CarMedia>> fetchCarMedia({required String carId}) async {
    try {
      final response = await _dio.get(
        ApiConfig.carMedia(carId: carId),
      );
      if (response.statusCode == 200 && response.data != null) {
        final carMakes = CarMedia.fromJson(
          response.data!,
        );
        return Right(carMakes);
      } else {
        return Left(response.statusMessage ?? 'Error');
      }
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }
}

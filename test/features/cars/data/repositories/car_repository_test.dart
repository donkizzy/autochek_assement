import 'package:autochek_assessment/features/cars/data/models/car_inventory.dart';
import 'package:autochek_assessment/features/cars/data/models/car_inventory_detail.dart';
import 'package:autochek_assessment/features/cars/data/models/car_make.dart';
import 'package:autochek_assessment/features/cars/data/models/car_media.dart';
import 'package:autochek_assessment/features/cars/data/repositories/car_repository.dart';
import 'package:autochek_assessment/utils/api_config.dart';
import 'package:autochek_assessment/utils/mock.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'car_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
 late  CarRepository carRepository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    carRepository = CarRepository(dio: mockDio);
  });

  group('fetchCarPopularMakes', () {

    test('returns CarMakes when successful', () async {

      when(mockDio.get(ApiConfig.popularMakes))
          .thenAnswer((_) async => Response(data: carMake, statusCode: 200, requestOptions: RequestOptions()));

      final result = await carRepository.fetchCarPopularMakes();
      result.fold(
            (l) => null,
            (r) {
          expect(r, isA<CarMakes>());
          expect(r, equals(CarMakes.fromJson(carMake)));
        },
      );

    });

    test('returns error message when fails', () async {

      when(mockDio.get(ApiConfig.popularMakes))
          .thenAnswer((_) async => Response(statusCode: 400, requestOptions: RequestOptions()));

      final result = await carRepository.fetchCarPopularMakes();
      result.fold(
            (l) {
          expect(l, isA<String>());
        },(r) => null,
      );
    });
  });

  group('fetchCarInventory', () {
    test('returns CarInventory when successful', () async {

      when(mockDio.get(ApiConfig.allCars))
          .thenAnswer((_) async => Response(data: carInventory, statusCode: 200, requestOptions: RequestOptions()));

      final result = await carRepository.fetchCarInventory();
      result.fold(
            (l) => null,
            (r) {
          expect(r, isA<CarInventory>());
          expect(r, equals(CarInventory.fromJson(carInventory)));
        },
      );

    });

    test('returns error message when fails', () async {

      when(mockDio.get(ApiConfig.allCars))
          .thenAnswer((_) async => Response(data: 'Error', statusCode: 400, requestOptions: RequestOptions()));

      final result = await carRepository.fetchCarInventory();
      result.fold(
            (l) {
          expect(l, isA<String>());
        },(r) => null,
      );
    });
  });

  group('fetchCarInventoryDetail', () {
    test('returns CarInventoryDetail when successful', () async {

      when(mockDio.get(ApiConfig.carDetail(carId: 'M8JMxVUxJ')))
          .thenAnswer((_) async => Response(data: carInventoryDetail, statusCode: 200, requestOptions: RequestOptions()));

      final result = await carRepository.fetchCarInventoryDetail(carId: 'M8JMxVUxJ');
      result.fold(
            (l) => null,
            (r) {
          expect(r, isA<CarInventoryDetail>());
          expect(r, equals(CarInventoryDetail.fromJson(carInventoryDetail)));
        },
      );

    });

    test('returns error message when fails', () async {

      when(mockDio.get(ApiConfig.carDetail(carId: 'M8JMxVUxJ')))
          .thenAnswer((_) async => Response(data: 'Error', statusCode: 400, requestOptions: RequestOptions()));

      final result = await carRepository.fetchCarInventoryDetail(carId: 'M8JMxVUxJ');
      result.fold(
            (l) {
          expect(l, isA<String>());
        },(r) => null,
      );
    });
  });

  group('fetchCarMedia', () {
    test('returns CarMedia when successful', () async {
      when(mockDio.get(ApiConfig.carDetail(carId: 'M8JMxVUxJ')))
          .thenAnswer((_) async => Response(data: carMedia, statusCode: 200, requestOptions: RequestOptions()));

      final result = await carRepository.fetchCarMedia(carId: 'M8JMxVUxJ');
      result.fold(
            (l) => null,
            (r) {
          expect(r, isA<CarMedia>());
          expect(r, equals(CarInventoryDetail.fromJson(carInventoryDetail)));
        },
      );

    });

    test('returns error message when fails', () async {

      when(mockDio.get(ApiConfig.carDetail(carId: 'M8JMxVUxJ')))
          .thenAnswer((_) async => Response(data: 'Error', statusCode: 400, requestOptions: RequestOptions()));

      final result = await carRepository.fetchCarMedia(carId: 'M8JMxVUxJ');
      result.fold(
            (l) {
          expect(l, isA<String>());
        },(r) => null,
      );
    });

  });

}
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
  late CarRepository carRepository;
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
        },
        (r) => null,
      );
    });
    test('fetch car makes throws and Exception', () async {
      when(mockDio.get(ApiConfig.popularMakes)).thenThrow(DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.connectionTimeout,
      ));
      final result = await carRepository.fetchCarPopularMakes();
      result.fold(
        (l) {
          expect(() => l, throwsA(isA<DioException>));
          expect(() => l, isA<String>());
        },
        (r) => null,
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
        },
      );
    });

    test('returns error message when fails', () async {
      when(mockDio.get(ApiConfig.allCars))
          .thenAnswer((_) async => Response(statusCode: 400, requestOptions: RequestOptions()));

      final result = await carRepository.fetchCarInventory();
      result.fold(
        (l) {
          expect(l, isA<String>());
        },
        (r) => null,
      );
    });

    test('fetchInventory throws and Exception', () async {
      when(mockDio.get(ApiConfig.allCars)).thenThrow(DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.connectionTimeout,
      ));
      final result = await carRepository.fetchCarInventory();
      result.fold(
        (l) {
          expect(l, isA<String>());
        },
        (r) => null,
      );
    });
  });

  group('fetchCarInventoryDetail', () {
    test('returns CarInventoryDetail when successful', () async {
      when(mockDio.get(ApiConfig.carDetail(carId: 'M8JMxVUxJ'))).thenAnswer(
          (_) async => Response(data: carInventoryDetail, statusCode: 200, requestOptions: RequestOptions()));

      final result = await carRepository.fetchCarInventoryDetail(carId: 'M8JMxVUxJ');
      result.fold(
        (l) => null,
        (r) {
          expect(r, isA<CarInventoryDetail>());
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
        },
        (r) => null,
      );
    });

    test('fetchInventory details throws and Exception', () async {
      when(mockDio.get(ApiConfig.carDetail(carId: 'M8JMxVUxJ'))).thenThrow(DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.connectionTimeout,
      ));

      final result = await carRepository.fetchCarInventoryDetail(carId: 'M8JMxVUxJ');
      result.fold(
        (l) {
          expect(l, isA<String>());
        },
        (r) => null,
      );
    });
  });

  group('fetchCarMedia', () {
    test('returns CarMedia when successful', () async {
      when(mockDio.get(ApiConfig.carMedia(carId: 'M8JMxVUxJ')))
          .thenAnswer((_) async => Response(data: carMedia, statusCode: 200, requestOptions: RequestOptions()));

      final result = await carRepository.fetchCarMedia(carId: 'M8JMxVUxJ');
      result.fold(
        (l) => null,
        (r) {
          expect(r, isNotNull);
          expect(r, isA<CarMedia>());
        },
      );
    });

    test('returns error message when fails', () async {
      when(mockDio.get(ApiConfig.carMedia(carId: 'M8JMxVUxJ')))
          .thenAnswer((_) async => Response(statusCode: 400, requestOptions: RequestOptions()));

      final result = await carRepository.fetchCarMedia(carId: 'M8JMxVUxJ');
      result.fold(
        (l) {
          expect(l, isA<String>());
        },
        (r) => null,
      );
    });

    test('fetchCar Media throws and Exception', () async {
      when(mockDio.get(ApiConfig.carMedia(carId: 'M8JMxVUxJ'))).thenThrow(DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.connectionTimeout,
      ));

      final result = await carRepository.fetchCarMedia(carId: 'M8JMxVUxJ');
      result.fold(
        (l) {
          expect(l, isA<String>());
        },
        (r) => null,
      );
    });
  });
}

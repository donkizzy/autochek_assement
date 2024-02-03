import 'package:autochek_assessment/features/cars/data/models/car_inventory.dart';
import 'package:autochek_assessment/features/cars/data/models/car_inventory_detail.dart';
import 'package:autochek_assessment/features/cars/data/models/car_media.dart';
import 'package:autochek_assessment/utils/mock.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:autochek_assessment/features/cars/data/bloc/car_cubit.dart';
import 'package:autochek_assessment/features/cars/data/repositories/car_repository.dart';
import 'package:autochek_assessment/features/cars/data/models/car_make.dart';

import 'car_cubit_test.mocks.dart';

@GenerateMocks([CarRepository])
void main() {
  late CarCubit carCubit;
  late MockCarRepository mockCarRepository;

  setUp(() {
    mockCarRepository = MockCarRepository();
    carCubit = CarCubit(carRepository: mockCarRepository);
  });

  tearDown(() {
    carCubit.close();
  });
  test('initial state is correct', () {
    final cubit = CarCubit(carRepository: mockCarRepository);
    expect(cubit.state, CarInitial());
  });

  group('fetchCarPopularMakes', () {
    blocTest<CarCubit, CarState>(
      'fetchCarPopularMakes emits [FetchCarMakesLoading, FetchCarMakesSuccess] when successful',
      build: () => carCubit,
      setUp: () {
        when(mockCarRepository.fetchCarPopularMakes())
            .thenAnswer((_) async => Right(CarMakes.fromJson(carMake)));
      },
      act: (cubit) => cubit.fetchCarPopularMakes(),
      expect: () => <CarState>[
        FetchCarMakesLoading(),
        FetchCarMakesSuccess(carMakes: CarMakes.fromJson(carMake)),
      ],
    );

    blocTest<CarCubit, CarState>(
      'fetchCarPopularMakes emits [FetchCarMakesLoading, FetchCarMakesError] when fails',
      build: () => carCubit,
      setUp: () {
        when(mockCarRepository.fetchCarPopularMakes())
            .thenAnswer((_) async => const Left('Error message'));
      },
      act: (cubit) => cubit.fetchCarPopularMakes(),
      expect: () => <CarState>[
        FetchCarMakesLoading(),
        const FetchCarMakesError(error: 'Error message'),
      ],
    );
  });

  group('fetchCarInventory', () {
    blocTest<CarCubit, CarState>(
      'fetchCarInventory emits [FetchCarInventoryLoading, FetchCarInventorySuccess] when successful',
      build: () => carCubit,
      setUp: () {
        when(mockCarRepository.fetchCarInventory()).thenAnswer((_) async => Right(CarInventory.fromJson(carInventory)));
      },
      act: (cubit) => cubit.fetchCarInventory(),
      expect: () =>
      <CarState>[
        FetchCarInventoryLoading(),
        FetchCarInventorySuccess(carInventory: CarInventory.fromJson(carInventory)),
      ],
    );

    blocTest<CarCubit, CarState>(
      'fetchCarInventory emits [FetchCarInventoryLoading, FetchCarInventoryError] when fails',
      build: () => carCubit,
      setUp: () {
        when(mockCarRepository.fetchCarInventory())
            .thenAnswer((_) async => const Left('Error message'));
      },
      act: (cubit) => cubit.fetchCarInventory(),
      expect: () => <CarState>[
        FetchCarInventoryLoading(),
        const FetchCarInventoryError(error: 'Error message'),
      ],
    );
  });

  group('fetchCarInventoryDetail', () {
    blocTest<CarCubit, CarState>(
      'fetchCarInventoryDetail emits [FetchCarInventoryDetailsLoading, FetchCarInventoryDetailsSuccess] when successful',
      build: () => carCubit,
      setUp: () {
        when(mockCarRepository.fetchCarInventoryDetail(carId: 'M8JMxVUxJ'))
            .thenAnswer((_) async => Right(CarInventoryDetail.fromJson(carInventoryDetail)));
      },
      act: (cubit) => cubit.fetchCarInventoryDetail(carId: 'M8JMxVUxJ'),
      expect: () =>
      <CarState>[
        FetchCarInventoryDetailsLoading(),
        FetchCarInventoryDetailsSuccess(carInventoryDetail: CarInventoryDetail.fromJson(carInventoryDetail)),
      ],
    );

    blocTest<CarCubit, CarState>(
      'fetchCarInventoryDetail emits [FetchCarInventoryDetailsLoading, FetchCarInventoryDetailsError] when fails',
      build: () => carCubit,
      setUp: () {
        when(mockCarRepository.fetchCarInventoryDetail(carId: 'M8JMxVUxJ'))
            .thenAnswer((_) async => const Left('Error message'));
      },
      act: (cubit) => cubit.fetchCarInventoryDetail(carId: 'M8JMxVUxJ'),
      expect: () => <CarState>[
        FetchCarInventoryDetailsLoading(),
        const FetchCarInventoryDetailsError(error: 'Error message'),
      ],
    );
  });

  group('fetchCarMedia', () {
    blocTest<CarCubit, CarState>(
      'fetchCarMedia emits [FetchCarMediaLoading, FetchCarMediaSuccess] when successful',
      build: () => carCubit,
      setUp: () {
        when(mockCarRepository.fetchCarMedia(carId: 'M8JMxVUxJ'))
            .thenAnswer((_) async => Right(CarMedia.fromJson(carMedia)));
      },
      act: (cubit) => cubit.fetchCarMedia(carId: 'M8JMxVUxJ'),
      expect: () => <CarState>[
        FetchCarMediaLoading(),
        FetchCarMediaSuccess(carMedia: CarMedia.fromJson(carMedia)),
      ],
    );

    blocTest<CarCubit, CarState>(
      'fetchCarMedia emits [FetchCarMediaLoading, FetchCarInventoryDetailsError] when fails',
      build: () => carCubit,
      setUp: () {
        when(mockCarRepository.fetchCarMedia(carId: 'M8JMxVUxJ'))
            .thenAnswer((_) async => const Left('Error message'));
      },
      act: (cubit) => cubit.fetchCarMedia(carId: 'M8JMxVUxJ'),
      expect: () => <CarState>[
        FetchCarMediaLoading(),
        const FetchCarMediaError(error: 'Error message'),
      ],
    );
  });
}

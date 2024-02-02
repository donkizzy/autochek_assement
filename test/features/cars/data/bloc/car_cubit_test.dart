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

  // Add similar tests for fetchCarInventory, fetchCarInventoryDetail, and fetchCarMedia
}

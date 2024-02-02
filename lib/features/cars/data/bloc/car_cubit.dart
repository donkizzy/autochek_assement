import 'package:autochek_assessment/features/cars/data/models/car_inventory.dart';
import 'package:autochek_assessment/features/cars/data/models/car_inventory_detail.dart';
import 'package:autochek_assessment/features/cars/data/models/car_make.dart';
import 'package:autochek_assessment/features/cars/data/models/car_media.dart';
import 'package:autochek_assessment/features/cars/data/repositories/car_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  final CarRepository _carRepository;

  CarCubit({CarRepository? carRepository})
      : _carRepository = carRepository ?? CarRepository(dio: Dio()),
        super(CarInitial());

  Future<void> fetchCarPopularMakes() async {
    try {
      emit(FetchCarMakesLoading());
      final response = await _carRepository.fetchCarPopularMakes();
      response.fold(
        (l) => emit(FetchCarMakesError(error: l)),
        (r) => emit(FetchCarMakesSuccess(carMakes: r)),
      );
    } catch (e) {
      emit(FetchCarMakesError(error: e.toString()));
    }
  }

  Future<void> fetchCarInventory() async {
    try {
      emit(FetchCarInventoryLoading());
      final response = await _carRepository.fetchCarInventory();
      response.fold(
        (l) => emit(FetchCarInventoryError(error: l)),
        (r) => emit(FetchCarInventorySuccess(carInventory: r)),
      );
    } catch (e) {
      emit(FetchCarInventoryError(error: e.toString()));
    }
  }

  Future<void> fetchCarInventoryDetail({required String carId}) async {
    try {
      emit(FetchCarInventoryDetailsLoading());
      final response = await _carRepository.fetchCarInventoryDetail(carId: carId);
      response.fold(
        (l) => emit(FetchCarInventoryDetailsError(error: l)),
        (r) => emit(FetchCarInventoryDetailsSuccess(carInventoryDetail: r)),
      );
    } catch (e) {
      emit(FetchCarInventoryDetailsError(error: e.toString()));
    }
  }

  Future<void> fetchCarMedia({required String carId}) async {
    try {
      emit(FetchCarMediaLoading());
      final response = await _carRepository.fetchCarMedia(carId: carId);
      response.fold(
        (l) => emit(FetchCarMediaError(error: l)),
        (r) => emit(FetchCarMediaSuccess(carMedia: r)),
      );
    } catch (e) {
      emit(FetchCarMediaError(error: e.toString()));
    }
  }
}

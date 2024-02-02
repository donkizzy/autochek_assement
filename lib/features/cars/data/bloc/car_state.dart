part of 'car_cubit.dart';

abstract class CarState extends Equatable {
  const CarState();
}

class CarInitial extends CarState {
  @override
  List<Object> get props => [];
}

class FetchCarMakesLoading extends CarState {
  @override
  List<Object> get props => [];
}

class FetchCarMakesSuccess extends CarState {
  final CarMakes carMakes;

  const FetchCarMakesSuccess({required this.carMakes});
  @override
  List<Object> get props => [carMakes];
}

class FetchCarMakesError extends CarState {
  final String error;

  const FetchCarMakesError({required this.error});

  @override
  List<Object> get props => [error];
}

class FetchCarInventoryLoading extends CarState {
  @override
  List<Object> get props => [];
}

class FetchCarInventorySuccess extends CarState {
  final CarInventory carInventory;

  const FetchCarInventorySuccess({required this.carInventory});
  @override
  List<Object> get props => [carInventory];
}

class FetchCarInventoryError extends CarState {
  final String error;

  const FetchCarInventoryError({required this.error});
  @override
  List<Object> get props => [error];
}

class FetchCarInventoryDetailsLoading extends CarState {
  @override
  List<Object> get props => [];
}

class FetchCarInventoryDetailsSuccess extends CarState {
  final CarInventoryDetail carInventoryDetail;

  const FetchCarInventoryDetailsSuccess({required this.carInventoryDetail});

  @override
  List<Object> get props => [carInventoryDetail];
}

class FetchCarInventoryDetailsError extends CarState {
  final String error;

  const FetchCarInventoryDetailsError({required this.error});

  @override
  List<Object> get props => [error];
}

class FetchCarMediaLoading extends CarState {
  @override
  List<Object> get props => [];
}

class FetchCarMediaSuccess extends CarState {
  final CarMedia carMedia;

  const FetchCarMediaSuccess({required this.carMedia});
  @override
  List<Object> get props => [carMedia];
}

class FetchCarMediaError extends CarState {
  final String error;

  const FetchCarMediaError({required this.error});
  @override
  List<Object> get props => [error];
}

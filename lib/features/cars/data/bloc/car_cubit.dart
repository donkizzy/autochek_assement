import 'package:autochek_assessment/features/cars/data/models/car_inventory.dart';
import 'package:autochek_assessment/features/cars/data/models/car_inventory_detail.dart';
import 'package:autochek_assessment/features/cars/data/models/car_make.dart';
import 'package:autochek_assessment/features/cars/data/models/car_media.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  CarCubit() : super(CarInitial());
}

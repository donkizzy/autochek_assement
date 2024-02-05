import 'package:autochek_assessment/features/cars/data/bloc/car_cubit.dart';
import 'package:autochek_assessment/features/cars/presentation/widgets/car_make_item.dart';
import 'package:autochek_assessment/features/cars/presentation/widgets/error_widget.dart';
import 'package:autochek_assessment/features/cars/presentation/widgets/inventory_item.dart';
import 'package:autochek_assessment/features/cars/presentation/widgets/loading_widget.dart';
import 'package:autochek_assessment/utils/app_colors.dart';
import 'package:autochek_assessment/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CarCubit carCubit = CarCubit();

  @override
  void initState() {
    carCubit.fetchCarPopularMakes();
    carCubit.fetchCarInventory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: alabasterGrey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: alabasterGrey,
              iconTheme: const IconThemeData(color: Colors.black),
              leading: const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.apps),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Explore',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              leadingWidth: width(context) / 2,
              actions: const [
                Icon(Icons.shopping_bag_outlined),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          filled: true,
                          fillColor: snuffPurple.withOpacity(0.5),
                          prefixIcon: const Icon(Icons.search),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: appWhite,
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: appWhite,
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: appWhite,
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mineShaftBlack,
                      ),
                      child: Icon(Icons.tune, color: goldenRodYellow, size: 20),
                    )
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: BlocBuilder<CarCubit, CarState>(
                  bloc: carCubit,
                  buildWhen: (previousState, currentState) {
                    return currentState is FetchCarMakesLoading ||
                        currentState is FetchCarMakesSuccess ||
                        currentState is FetchCarMakesError;
                  },
                  builder: (context, state) {
                    if (state is FetchCarMakesLoading) {
                      return const LoadingWidget();
                    }
                    if (state is FetchCarMakesSuccess) {
                      return ListView.separated(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 0),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.carMakes.makeList?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return CarMakeItem(
                            makeList: state.carMakes.makeList?[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                      );
                    }
                    if (state is FetchCarMakesError) {
                      return ErrorState(
                        errorMessage: state.error,
                        retry: () {
                          carCubit.fetchCarPopularMakes();
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
          ];
        },
        body: BlocBuilder<CarCubit, CarState>(
          bloc: carCubit,
          buildWhen: (previousState, currentState) {
            return currentState is FetchCarInventoryLoading ||
                currentState is FetchCarInventorySuccess ||
                currentState is FetchCarInventoryError;
          },
          builder: (context, state) {
            if (state is FetchCarInventoryLoading) {
              return const LoadingWidget();
            }
            if (state is FetchCarInventorySuccess) {
              return ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 20),
                itemCount: state.carInventory.result?.length ?? 0,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InventoryItem(
                    carInventory: state.carInventory.result?[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              );
            }
            if (state is FetchCarInventoryError) {
              return ErrorState(
                  errorMessage: state.error,
                  retry: () {
                    carCubit.fetchCarInventory();
                  });
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

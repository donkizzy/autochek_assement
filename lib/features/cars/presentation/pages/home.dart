import 'package:autochek_assessment/features/cars/data/bloc/car_cubit.dart';
import 'package:autochek_assessment/features/cars/presentation/widgets/car_make_item.dart';
import 'package:autochek_assessment/features/cars/presentation/widgets/car_makes_loader.dart';
import 'package:autochek_assessment/features/cars/presentation/widgets/inventory_item.dart';
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
      backgroundColor: alabasterGrey.withOpacity(0.5),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: alabasterGrey.withOpacity(0.5),
              iconTheme: const IconThemeData(color: Colors.black),
              leading: const Row(
                children: [
                  SizedBox(
                    width: 10,
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
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
                height: 100,
                child: BlocBuilder<CarCubit, CarState>(
                  bloc: carCubit,
                  buildWhen: (previousState, currentState) {
                    return currentState is FetchCarMakesLoading ||
                        currentState is FetchCarMakesSuccess ||
                        currentState is FetchCarMakesError;
                  },
                  builder: (context, state) {
                    if (state is FetchCarMakesLoading) {
                      return const CarMakeLoader();
                    }
                    if (state is FetchCarMakesSuccess) {
                      return ListView.separated(
                        padding: const EdgeInsets.only(left: 20.0),
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
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(child: Text(state.error)),
                            const SizedBox(
                              height: 10,
                            ),
                            MaterialButton(
                              onPressed: () {
                                carCubit.fetchCarPopularMakes();
                              },
                              child: const Text('Retry'),
                            )
                          ],
                        ),
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
              return const Center(child: CircularProgressIndicator());
            }
            if (state is FetchCarInventorySuccess) {
              return ListView.separated(
                shrinkWrap: true,
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
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.error),
                    const SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      onPressed: () {
                        carCubit.fetchCarInventory();
                      },
                      child: const Text('Retry'),
                    )
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

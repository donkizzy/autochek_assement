import 'package:autochek_assessment/features/cars/data/bloc/car_cubit.dart';
import 'package:autochek_assessment/features/cars/data/models/car_inventory_detail.dart';
import 'package:autochek_assessment/features/cars/presentation/widgets/description_item.dart';
import 'package:autochek_assessment/features/cars/presentation/widgets/error_widget.dart';
import 'package:autochek_assessment/features/cars/presentation/widgets/image_thumbnail_item.dart';
import 'package:autochek_assessment/utils/app_colors.dart';
import 'package:autochek_assessment/utils/utilities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarDetailPage extends StatefulWidget {
  final String carId;

  const CarDetailPage({super.key, required this.carId});

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  ValueNotifier<String> selectedImageUrl = ValueNotifier('');
  CarCubit carCubit = CarCubit();
  ValueNotifier<CarInventoryDetail?> carInventoryDetail = ValueNotifier(null);

  @override
  void initState() {
    carCubit.fetchCarInventoryDetail(carId: widget.carId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: alabasterGrey,
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: carInventoryDetail,
        builder: (BuildContext context, CarInventoryDetail? value, Widget? child) {
          return Container(
            decoration: BoxDecoration(
                color: appWhite,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
            height: 170,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  if (value != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Wrap(
                            runSpacing: 5,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.location_on_outlined),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${value.city} ${value.state}',
                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.car_rental),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${value.sellingCondition}',
                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Total: ',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              moneyFormat(value.marketplacePrice.toString()),
                              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                            ),
                          ],
                        )
                      ],
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    color: codGray,
                    elevation: 0.0,
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    minWidth: width(context),
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(color: goldenRodYellow, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: alabasterGrey.withOpacity(0.5),
        iconTheme: const IconThemeData(color: Colors.black),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(Icons.arrow_back_ios),
              SizedBox(
                width: 15,
              ),
              Text(
                'Product',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        leadingWidth: width(context) / 2,
        actions: const [
          Icon(Icons.shopping_bag_outlined),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: BlocConsumer<CarCubit, CarState>(
        bloc: carCubit,
        buildWhen: (previousState, currentState) {
          return currentState is FetchCarInventoryDetailsLoading ||
              currentState is FetchCarInventoryDetailsSuccess ||
              currentState is FetchCarInventoryDetailsError;
        },
        builder: (context, state) {
          if (state is FetchCarInventoryDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FetchCarInventoryDetailsSuccess) {
            return ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Honda Pilot', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 740,
                  decoration: BoxDecoration(color: alabasterGrey),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 600,
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            width: width(context) - 40,
                            decoration: BoxDecoration(
                                color: appWhite, borderRadius: const BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: BlocBuilder<CarCubit, CarState>(
                                      bloc: carCubit,
                                      buildWhen: (previousState, currentState) {
                                        return currentState is FetchCarMediaLoading ||
                                            currentState is FetchCarMediaSuccess ||
                                            currentState is FetchCarMediaError;
                                      },
                                      builder: (context, state) {
                                        if (state is FetchCarMediaLoading) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                        if (state is FetchCarMediaSuccess) {
                                          return ListView.separated(
                                            itemCount: state.carMedia.carMediaList?.length ?? 0,
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (BuildContext context, int index) {
                                              return ImageThumbNaiItem(
                                                index: index,
                                                url: state.carMedia.carMediaList?[index].url ?? '',
                                                onChanged: (index) {
                                                  selectedImageUrl.value =
                                                      state.carMedia.carMediaList?[index].url ?? '';
                                                },
                                              );
                                            },
                                            separatorBuilder: (BuildContext context, int index) {
                                              return const SizedBox(
                                                width: 10,
                                              );
                                            },
                                          );
                                        }
                                        if (state is FetchCarMediaError) {
                                          return ErrorState(errorMessage: state.error, retry: () {});
                                        }
                                        return const SizedBox.shrink();
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: Text(
                                      'Description',
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  DescriptionItem(
                                    title: 'Engine Type',
                                    subTitle: state.carInventoryDetail.engineType ?? 'N/A',
                                  ),
                                  DescriptionItem(
                                    title: 'Transmission',
                                    subTitle: state.carInventoryDetail.transmission ?? 'N/A',
                                  ),
                                  DescriptionItem(
                                    title: 'VIN Number',
                                    subTitle: state.carInventoryDetail.vin ?? 'N/A',
                                  ),
                                  DescriptionItem(
                                    title: 'Interior Color',
                                    subTitle: state.carInventoryDetail.interiorColor ?? 'N/A',
                                  ),
                                  DescriptionItem(
                                    title: 'Exterior Color',
                                    subTitle: state.carInventoryDetail.exteriorColor ?? 'N/A',
                                  ),
                                  DescriptionItem(
                                    title: 'Has Insurance',
                                    subTitle: state.carInventoryDetail.insured.toString(),
                                  ),
                                  DescriptionItem(
                                    title: 'Fuel Type',
                                    subTitle: state.carInventoryDetail.fuelType ?? 'N/A',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Container(
                            height: 300,
                            width: width(context) - 80,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: snuffPurple,
                                border: Border.all(color: appWhite, width: 2),
                                borderRadius: const BorderRadius.all(Radius.circular(15))),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: ValueListenableBuilder(
                                valueListenable: selectedImageUrl,
                                builder: (BuildContext context, String? value, Widget? child) {
                                  return CachedNetworkImage(
                                    imageUrl: value ?? '',
                                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          if (state is FetchCarInventoryDetailsError) {
            return ErrorState(
              errorMessage: state.error,
              retry: () {
                carCubit.fetchCarPopularMakes();
              },
            );
          }
          return const SizedBox.shrink();
        },
        listener: (BuildContext context, CarState state) {
          if (state is FetchCarInventoryDetailsSuccess) {
            carInventoryDetail.value = state.carInventoryDetail;
            carCubit.fetchCarMedia(carId: widget.carId);
            selectedImageUrl.value = state.carInventoryDetail.imageUrl ?? '';
          }
        },
      ),
    );
  }
}

import 'package:autochek_assessment/features/cars/data/models/car_inventory.dart';
import 'package:autochek_assessment/features/cars/presentation/pages/car_detail.dart';
import 'package:autochek_assessment/utils/app_colors.dart';
import 'package:autochek_assessment/utils/utilities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InventoryItem extends StatelessWidget {
  final CarInventoryResult? carInventory;

  const InventoryItem({super.key, required this.carInventory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CarDetailPage(
                      carId: carInventory?.id ?? 'carDetail',
                    )));
      },
      child: Container(
        height: 350,
        color: alabasterGrey,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: 250,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: width(context) - 40,
                  decoration: BoxDecoration(color: appWhite, borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              carInventory?.title ?? 'N/A',
                              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: goldenRodYellow, size: 18),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text('${carInventory?.gradeScore?.toStringAsFixed(1) ?? 0}',
                                    style: TextStyle(color: frenchGray, fontWeight: FontWeight.w500, fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '${carInventory?.city ?? 'N/A'}, ${carInventory?.state ?? 'N/A'}',
                          style: TextStyle(color: frenchGray),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '₦${moneyFormat(carInventory?.marketplacePrice?.toString() ?? '')}',
                              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: codGray,
                              ),
                              child: Icon(Icons.add, color: goldenRodYellow, size: 15),
                            ),
                          ],
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
                child: Hero(
                  tag: carInventory?.id ?? 'carDetail',
                  child: Container(
                    height: 250,
                    width: width(context) - 80,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: snuffPurple,
                        border: Border.all(color: appWhite, width: 2),
                        borderRadius: const BorderRadius.all(Radius.circular(15))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: carInventory?.imageUrl ?? '',
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

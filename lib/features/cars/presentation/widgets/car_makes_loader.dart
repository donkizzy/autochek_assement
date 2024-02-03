import 'package:autochek_assessment/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarMakeLoader extends StatelessWidget {
  const CarMakeLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 20.0),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return CircleAvatar(
          radius: 35,
          child: Shimmer.fromColors(
            baseColor: mineShaftBlack.withOpacity(0.2),
            highlightColor: alabasterGrey,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 20,
        );
      },
    );
  }
}

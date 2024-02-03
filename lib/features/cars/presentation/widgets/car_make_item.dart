import 'package:autochek_assessment/features/cars/data/models/car_make.dart';
import 'package:autochek_assessment/utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CarMakeItem extends StatelessWidget {
  final MakeList? makeList;

  const CarMakeItem({super.key, required this.makeList});

  @override
  Widget build(BuildContext context) {
    String url = makeList?.imageUrl ?? '';
    return CircleAvatar(
        radius: 35,
        backgroundColor: appWhite,
        backgroundImage: url.endsWith('.svg')
            ? Svg(url, source: SvgSource.network, size: const Size(20, 20)) as ImageProvider
            : CachedNetworkImageProvider(
                url,
              ));
  }
}

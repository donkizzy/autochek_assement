import 'package:autochek_assessment/utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageThumbNaiItem extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;
  final String url;

  const ImageThumbNaiItem({super.key, required this.index, required this.onChanged, required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(index);
      },
      child: Container(
        decoration: BoxDecoration(
            color: snuffPurple, borderRadius: BorderRadius.circular(10), border: Border.all(color: codGray, width: 1)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: url,
            height: 40,
            width: 80,
            fit: BoxFit.fitWidth,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageThumbNaiItem extends StatelessWidget {
  final VoidCallback onChanged;
  final String url;

  const ImageThumbNaiItem({
    super.key,
    required this.onChanged,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged,
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
    );
  }
}

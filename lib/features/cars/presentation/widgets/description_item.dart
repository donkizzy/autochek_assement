import 'package:flutter/material.dart';

class DescriptionItem extends StatelessWidget {
  final String subTitle;
  final String title;

  const DescriptionItem({super.key, required this.subTitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              subTitle,
              style: const TextStyle(color: Colors.black, fontSize: 14),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

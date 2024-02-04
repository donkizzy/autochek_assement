import 'package:autochek_assessment/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  final String errorMessage;
  final VoidCallback retry;

  const ErrorState({super.key, required this.errorMessage, required this.retry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            errorMessage,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: retry,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: codGray,
            child: Text(
              'Retry',
              style: TextStyle(color: goldenRodYellow),
            ),
          )
        ],
      ),
    );
  }
}

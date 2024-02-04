import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  final String errorMessage;
  final VoidCallback retry;

  const ErrorState({super.key, required this.errorMessage, required this.retry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(errorMessage)),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: retry,
            child: const Text('Retry'),
          )
        ],
      ),
    );
  }
}

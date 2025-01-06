import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    required this.message,
    required this.onButtonPressed
  });

  final String message;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Oops! Something went wrong.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              )
            ),

            const SizedBox(height: 4),

            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16)
            ),

            const SizedBox(height: 10),

            FilledButton(
              onPressed: onButtonPressed,
              child: const Text(
                'Try Again',
                style: TextStyle(fontSize: 16)
              )
            )
          ]
        )
      )
    );
  }
}

import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {

  VoidCallback onPressed;

  StartButton({ super.key, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text("Start")
    );
  }

}

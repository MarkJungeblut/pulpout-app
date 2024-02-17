import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemoveFromPlan extends StatelessWidget {
  final VoidCallback pressed;

  const RemoveFromPlan({super.key, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: FilledButton(
          onPressed: () {
            pressed();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromARGB(124, 201, 190, 165)),
            foregroundColor:
                MaterialStateColor.resolveWith((states) => Colors.red),
          ),
          child: const Text("Entfernen"),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = StateProvider<String>((ref) => "Mein Trainingsplan");

class CompleteWorkoutScheduleInput extends ConsumerWidget {
  final isTitleSetProvider = StateProvider<bool>((ref) => false);

  final TextEditingController _controller = TextEditingController();

  CompleteWorkoutScheduleInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: "Name des Trainingsplans",
        suffixIcon: ref.watch(isTitleSetProvider) ? IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            // Clear the text when the clear button is pressed
            ref.invalidate(isTitleSetProvider);
            _controller.clear();
          },
        ) : null,
      ),
      onChanged: (String value) {
        ref.read(isTitleSetProvider.notifier).state = value.isNotEmpty;
        ref.read(titleProvider.notifier).state = value;
      },
    );
  }

}

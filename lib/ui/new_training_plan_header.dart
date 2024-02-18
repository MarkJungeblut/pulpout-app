import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'header_image.dart';

class NewTrainingPlanHeader extends StatelessWidget {

  final isTitleSetProvider = StateProvider<bool>((ref) => false);

  final TextEditingController _controller = TextEditingController();
  final void Function(String name) nameChanged;

  NewTrainingPlanHeader({super.key, required this.nameChanged});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        HeaderImage(
          image: "https://as2.ftcdn.net/v2/jpg/01/79/81/77/1000_F_179817756_QzTocli57q9G6a1Oe7kJtoMS5dNMU8cl.jpg"),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
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
                  nameChanged(value);
                },
              );
            },
          )
        ),
      ],
    );
  }
}

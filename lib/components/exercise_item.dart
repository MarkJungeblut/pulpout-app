import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pulpout_box_decoration.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: pulpoutBoxDecoration,
      child: Row(),
    );
  }

}

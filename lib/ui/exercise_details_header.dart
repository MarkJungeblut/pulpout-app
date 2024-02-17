import 'package:flutter/cupertino.dart';

import 'header_image.dart';
import 'title_bar.dart';

class ExerciseDetailsHeader extends StatelessWidget {
  final String title;

  const ExerciseDetailsHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        HeaderImage(
            image:
                "https://modusx.de/wp-content/uploads/bankdruecken-langhantel.gif",
            boxFit: BoxFit.scaleDown,
            height: 250),
        Container(
            margin: const EdgeInsets.only(top: 10, left: 10),
            child: TitleBar(
              title: title,
              titleDetails: [],
            ))
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';

import '../ui/header_image.dart';
import '../ui/title_bar.dart';

class NewTrainingPlanHeader extends StatelessWidget {
  const NewTrainingPlanHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const HeaderImage(image: "https://as2.ftcdn.net/v2/jpg/01/79/81/77/1000_F_179817756_QzTocli57q9G6a1Oe7kJtoMS5dNMU8cl.jpg"),
        Container(
            margin: const EdgeInsets.only(top: 10, left: 10),
            child: TitleBar(
              title: "Neuer Trainingsplan",
              titleDetails: [
                TitleDetails(title: "ÜBUNGEN", value: "-"),
                TitleDetails(title: "MUSKELGRUPPEN", value: "-"),
                TitleDetails(title: "MUSKELN", value: "-"),
              ],
            )
        ),
      ],
    );
  }

}

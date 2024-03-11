import 'package:flutter/cupertino.dart';

import '../header_image.dart';
import '../title_bar.dart';

class WorkoutScheduleOverviewHeader extends StatelessWidget {
  const WorkoutScheduleOverviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderImage(
          image: "https://as2.ftcdn.net/v2/jpg/01/74/21/25/1000_F_174212531_cerVf4uP6vinBWieBB46p2P5xVhnsNSK.jpg"
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 10),
          child: const TitleBar(
            title: "Trainingspläne",
            titleDetails: [
            ],
          )
        ),
      ],
    );
  }

}

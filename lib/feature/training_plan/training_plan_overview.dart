import 'package:flutter/cupertino.dart';
import 'package:pulpout/ui/header_image.dart';
import 'package:pulpout/ui/title_bar.dart';

class TrainingPlanOverview extends StatelessWidget {
  const TrainingPlanOverview({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderImage(),
        Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          child: TitleBar(
            title: "Trainingspläne",
            titleDetails: [
              TitleDetails(title: "ÜBUNGEN", value: "7"),
              TitleDetails(title: "MUSKELGRUPPEN", value: "4"),
              TitleDetails(title: "MUSKELN", value: "1"),
            ],
          )
        )
      ]
    );
  }

}

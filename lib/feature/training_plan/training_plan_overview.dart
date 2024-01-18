import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulpout/ui/empty.dart';
import 'package:pulpout/ui/header_image.dart';
import 'package:pulpout/ui/title_bar.dart';

import 'new_training_plan.dart';

class TrainingPlanOverview extends StatelessWidget {

  final List listOfPlans = [];

  TrainingPlanOverview({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderImage(image: "https://as2.ftcdn.net/v2/jpg/01/74/21/25/1000_F_174212531_cerVf4uP6vinBWieBB46p2P5xVhnsNSK.jpg"),
            Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: TitleBar(
                  title: "Trainingspläne",
                  titleDetails: [
                    TitleDetails(title: "ÜBUNGEN", value: "-"),
                    TitleDetails(title: "MUSKELGRUPPEN", value: "-"),
                    TitleDetails(title: "MUSKELN", value: "-"),
                  ],
                )
            ),
            if (listOfPlans.isEmpty)
              const Expanded(
                  child: Empty(
                      title: "Bereit für den ersten Schritt?",
                      subtitle: "Füge einen Trainingsplan hinzu um direkt loszulegen.",
                      offset: Offset(0, -50)
                  )
              )
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NewTrainingPlan()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}

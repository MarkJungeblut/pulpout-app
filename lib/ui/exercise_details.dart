import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulpout/model/exercise.dart';
import 'package:pulpout/ui/new_training_plan_header.dart';

import 'exercise_details_header.dart';

class ExerciseDetails extends StatelessWidget {

  final Exercise exercise;

  const ExerciseDetails({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 2 / 3,
      child: Scaffold(
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    "Details",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    )
                ),
              ],
            ),
            backgroundColor: const Color.fromARGB(
                124, 201, 190, 165),
            centerTitle: false,
            leading: const Icon(Icons.close),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Icon(Icons.star_border),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Icon(Icons.more_vert),
              )
            ]
        ),
        body: Column(
          children: [
            ExerciseDetailsHeader(title: exercise.name),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(exercise.description),
                    Container(margin: EdgeInsets.only(top: 20)),
                    Text(
                        "Tipps",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        )
                    ),
                    Text("Bauch anspannen"),
                    Text("Ellbogen nicht gestreckt"),
                    Text("Schultern zusammenziehen"),
                    Expanded(child: Container()),
                    Container(
                      alignment: Alignment.center,
                      child: FilledButton(
                        onPressed: () {  }, 
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(124, 201, 190, 165)),
                          foregroundColor: MaterialStateColor.resolveWith((states) => Colors.black),
                        ), 
                        child: Text("Hinzufügen")),
                    )

                  ],
                ),
              )
            )
          ],
        )

      ),
    );
  }

}

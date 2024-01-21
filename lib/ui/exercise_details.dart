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
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    "Details",
                    style: TextStyle(
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ExerciseDetailsHeader(title: exercise.name),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(exercise.description),
                          Container(margin: const EdgeInsets.only(top: 20)),

                          if (exercise.advices.isNotEmpty)
                            const Text(
                              "Tipps",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            ...exercise.advices.map((advice) => Text("- ${advice.name}")).toList(),
                            const SizedBox(height: 20), // Add some spacing between advice and button
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: FilledButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => const Color.fromARGB(124, 201, 190, 165)),
                    foregroundColor: MaterialStateColor.resolveWith((states) => Colors.black),
                  ),
                  child: const Text("Hinzufügen"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
// exercises.map((exercise) {
// return InkWell(
// onTap: () {
// showModalBottomSheet(
// context: context,
// isScrollControlled: true,
// builder: (BuildContext context) {
// return ExerciseDetails(exercise: exercise);
// },
// );
// },
// child: ExerciseListItem(exercise: exercise)
// );

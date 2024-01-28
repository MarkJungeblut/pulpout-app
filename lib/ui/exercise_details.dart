import 'package:flutter/material.dart';
import 'package:pulpout/model/exercise.dart';
import 'package:pulpout/ui/add_to_plan.dart';

import 'exercise_details_header.dart';

typedef ExerciseCallback = void Function(Exercise exercise);

class ExerciseDetails extends StatelessWidget {

  final Exercise exercise;
  final ExerciseCallback exerciseAdded;

  const ExerciseDetails({super.key, required this.exercise, required this.exerciseAdded});

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
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => {
                Navigator.pop(context)
              },
            ),
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
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 00),
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
            AddToPlan(pressed: () {
              exerciseAdded(exercise);
              Navigator.pop(context);
            })
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

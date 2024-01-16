import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulpout/model/exercise.dart';

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
                    exercise.name,
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
                margin: const EdgeInsets.only(right: 5),
                child: const Icon(Icons.star_border),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Icon(Icons.more_vert),
              )
            ]
        ),
      ),
    );
  }

}

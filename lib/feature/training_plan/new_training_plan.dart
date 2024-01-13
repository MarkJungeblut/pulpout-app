import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pulpout/model/exercise.dart';
import 'package:pulpout/model/exercise_group.dart';

import '../../ui/header_image.dart';
import '../../ui/title_bar.dart';

class NewTrainingPlan extends StatelessWidget {

  const NewTrainingPlan({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
              child: FutureBuilder<List<ExerciseGroup>>(
                future: getExerciseGroups(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text("Error occurred: ${snapshot.error}");
                  }

                  final List<ExerciseGroup> exerciseGroups = snapshot.data!;

                  return FutureBuilder<List<Exercise>>(
                    future: getExercises(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      if (snapshot.hasError) {
                        return Text("Error occurred: ${snapshot.error}");
                      }

                      final List<Exercise> exercises = snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: exerciseGroups.length,
                        itemBuilder: (context, index) {
                          final Iterable<Exercise> exercisesOfGroup = exercises.where((element) => element.exerciseGroup.id == exerciseGroups[index].id);

                          return ExpansionTile(
                            initiallyExpanded: true,
                            title: Text(exerciseGroups[index].name),
                            children: exercisesOfGroup.map((exercise) {
                              return InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {
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
                                                child: Icon(Icons.star_border),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(right: 10),
                                                child: Icon(Icons.more_vert),
                                              )
                                            ]
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                },
                                child: Container(
                                    height: 60,
                                    margin: const EdgeInsets.only(left: 20, right: 20),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 60,
                                            margin: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage("https://as2.ftcdn.net/v2/jpg/01/79/81/77/1000_F_179817756_QzTocli57q9G6a1Oe7kJtoMS5dNMU8cl.jpg"),
                                                )
                                            ),
                                          ),
                                          Container(
                                              margin: const EdgeInsets.only(left: 10, top: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      exercise.name,
                                                      textAlign: TextAlign.left,
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.bold
                                                      )
                                                  ),
                                                  const Text(
                                                      "foo",
                                                      textAlign: TextAlign.left
                                                  )
                                                ],
                                              )
                                          )
                                        ],
                                      ),
                                    )
                                ),
                              );
                            }).toList(),
                          );
                        },
                      );
                    },
                  );
                },
              )
            )
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
        },
        child: const Icon(Icons.check),
      ),
    );
  }

  Future<List<ExerciseGroup>> getExerciseGroups() async {
    final response = await get(Uri.parse('http://localhost:8080/exercise/group'));

    if (response.statusCode == 200) {
      Iterable exerciseGroups = jsonDecode(response.body);
      return List<ExerciseGroup>.from(exerciseGroups.map((exerciseGroup) => ExerciseGroup.fromJson(exerciseGroup)));
    }

    throw Exception("Failed to load exercise groups");
  }

  Future<List<Exercise>> getExercises() async {
    final response = await get(Uri.parse('http://localhost:8080/exercise'));

    if (response.statusCode == 200) {
      Iterable exercises = jsonDecode(response.body);
      return List<Exercise>.from(exercises.map((exercise) => Exercise.fromJson(exercise)));
    }

    throw Exception("Failed to load exercises");
  }

}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pulpout/model/exercise.dart';

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
              child: FutureBuilder<List<Exercise>>(
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
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(exercises[index].name)
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

  Future<List<Exercise>> getExercises() async {
    final response = await get(Uri.parse('http://localhost:8080/exercise'));

    if (response.statusCode == 200) {
      Iterable exercises = jsonDecode(response.body);
      return List<Exercise>.from(exercises.map((decodedExercise) => Exercise.fromJson(decodedExercise)));
    }

    throw Exception("Failed to load exercises");
  }

}

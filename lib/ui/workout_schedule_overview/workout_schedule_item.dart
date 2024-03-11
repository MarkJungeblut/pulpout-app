import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulpout/model/workout_schedule.dart';

class WorkoutScheduleItem extends StatelessWidget {
  final WorkoutSchedule workoutSchedule;

  const WorkoutScheduleItem({super.key, required this.workoutSchedule});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Add this line
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://as2.ftcdn.net/v2/jpg/01/79/81/77/1000_F_179817756_QzTocli57q9G6a1Oe7kJtoMS5dNMU8cl.jpg"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            workoutSchedule.name,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(onPressed: () => {}, icon: const Icon(Icons.more_vert))
                ],
              ),
            ));
      },
    );
  }
}

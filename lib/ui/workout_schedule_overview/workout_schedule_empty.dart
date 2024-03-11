import 'package:flutter/cupertino.dart';
import 'package:pulpout/ui/empty.dart';

class WorkoutScheduleEmpty extends StatelessWidget {
  const WorkoutScheduleEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Empty(
      title: "Bereit für den ersten Schritt?",
      subtitle: "Füge einen Trainingsplan hinzu um direkt loszulegen.",
      offset: Offset(0, -50)
    );
  }

}

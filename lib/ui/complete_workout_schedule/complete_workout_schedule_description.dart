import 'package:flutter/cupertino.dart';

class CompleteWorkoutScheduleDescription extends StatelessWidget {
  const CompleteWorkoutScheduleDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Fast geschafft!", style: TextStyle(fontSize: 32)),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: const Text("🎉", style: TextStyle(fontSize: 64)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: const Text("Nun fehlt nur noch der Name:", style: TextStyle(fontSize: 22)),
        ),
      ],
    );
  }

}

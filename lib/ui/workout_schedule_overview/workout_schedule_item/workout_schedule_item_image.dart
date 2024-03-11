import 'package:flutter/cupertino.dart';

class WorkoutScheduleItemImage extends StatelessWidget {
  final String image;

  const WorkoutScheduleItemImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 60,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image)
              // "https://as2.ftcdn.net/v2/jpg/01/79/81/77/1000_F_179817756_QzTocli57q9G6a1Oe7kJtoMS5dNMU8cl.jpg"),
        ),
      ),
    );
  }

}

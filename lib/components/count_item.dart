import 'package:flutter/cupertino.dart';
import 'package:pulpout/components/pulpout_box_decoration.dart';

class CountItem extends StatelessWidget {
  final int weight;
  final String unit;

  const CountItem({super.key, required this.weight, required this.unit});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: pulpoutBoxDecoration,
      child: Column(
        children: [
          Text(
            weight.toString(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600
            )
          ),
          Text(
            unit,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500
            )
          )
        ],
      ),
    );
  }

}

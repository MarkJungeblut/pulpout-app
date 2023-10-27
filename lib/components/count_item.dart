import 'package:flutter/cupertino.dart';
import 'package:pulpout/components/pulpout_box_decoration.dart';

class CountItem extends StatelessWidget {
  final double count;
  final String unit;
  final EdgeInsetsGeometry? padding;

  const CountItem({super.key, required this.count, required this.unit, this.padding});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: pulpoutBoxDecoration,
      padding: padding,
      child: Column(
        children: [
          Text(
            count.toString(),
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

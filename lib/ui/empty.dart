import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  final Offset? offset;
  final String title;
  final String subtitle;

  const Empty({super.key, this.offset, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: offset ?? const Offset(0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
            )
          ],
        ));
  }
}

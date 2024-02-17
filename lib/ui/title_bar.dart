import 'package:flutter/cupertino.dart';

class TitleDetails {
  String title;
  String value;

  TitleDetails({required this.title, required this.value});
}

class TitleBar extends StatelessWidget {
  final String title;

  final List<TitleDetails> titleDetails;

  const TitleBar({super.key, required this.title, required this.titleDetails});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      Container(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: titleDetails
                .map((details) => _buildDetailRow(details))
                .toList(),
          ))
    ]);
  }

  Widget _buildDetailRow(TitleDetails detail) {
    return Expanded(
        child: Column(
      children: [
        Text(
          detail.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        Container(
          padding: const EdgeInsets.only(top: 5),
          child: Text(detail.value, textAlign: TextAlign.center),
        )
      ],
    ));
  }
}

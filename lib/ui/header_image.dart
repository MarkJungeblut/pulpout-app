import 'package:flutter/cupertino.dart';

class HeaderImage extends StatelessWidget {

  final String image;

  const HeaderImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image),
        )
      ),
    );
  }

}

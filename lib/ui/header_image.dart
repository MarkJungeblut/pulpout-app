import 'package:flutter/cupertino.dart';

class HeaderImage extends StatelessWidget {
  final String image;
  double height = 300;
  BoxFit boxFit;

  HeaderImage(
      {super.key,
      required this.image,
      this.height = 300,
      this.boxFit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(30)),
          image: DecorationImage(
            fit: boxFit,
            image: NetworkImage(image),
          )),
    );
  }
}

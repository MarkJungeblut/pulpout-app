import 'package:flutter/cupertino.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://as2.ftcdn.net/v2/jpg/01/74/21/25/1000_F_174212531_cerVf4uP6vinBWieBB46p2P5xVhnsNSK.jpg',
          ),
        )
      ),
    );
  }

}

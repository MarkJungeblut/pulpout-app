import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ui/header_image.dart';
import '../../ui/title_bar.dart';

class NewTrainingPlan extends StatelessWidget {
  const NewTrainingPlan({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderImage(image: "https://as2.ftcdn.net/v2/jpg/01/79/81/77/1000_F_179817756_QzTocli57q9G6a1Oe7kJtoMS5dNMU8cl.jpg"),
            Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: TitleBar(
                  title: "Neuer Trainingsplan",
                  titleDetails: [
                    TitleDetails(title: "ÜBUNGEN", value: "-"),
                    TitleDetails(title: "MUSKELGRUPPEN", value: "-"),
                    TitleDetails(title: "MUSKELN", value: "-"),
                  ],
                )
            ),
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NewTrainingPlan()));
          // showDialog(context: context, builder: (context) => const AlertDialog(
          //   title: Text('Result'),
          //   content: Text('Foo'),
          // ));
        },
        child: const Icon(Icons.check),
      ),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_avia/models/avia_data.dart';

class RouteNameWidget extends StatelessWidget {
  final AsyncSnapshot<AviaData?> snapshot;

  const RouteNameWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Align(
      alignment: Alignment.centerLeft,
      child: RichText(
          text: TextSpan(
              text: "From ",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.normal),
              children: <TextSpan>[
            TextSpan(
                text: snapshot.data!.data!.search!.from!.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
            const TextSpan(
                text: " to ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.normal)),
            TextSpan(
                text: snapshot.data!.data!.search!.to!.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
          ])),
    ));
  }
}

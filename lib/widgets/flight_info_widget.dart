import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FlightInfoWidget extends StatelessWidget {
  dynamic time;
  dynamic date;
  String? city;
  String? airport;

  FlightInfoWidget(
      {Key? key, this.airport, this.city, this.date, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.loose,
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(date ?? 'No info',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ))),
                Text(city ?? 'No info',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )),
                Text(airport ?? 'No info',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            )));
  }
}

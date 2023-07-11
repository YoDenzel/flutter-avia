import 'package:flutter/material.dart';
import 'package:flutter_avia/models/avia_data.dart';
import 'package:intl/intl.dart';

import 'flight_info_widget.dart';

class FlightTicketWidget extends StatelessWidget {
  final Segment? data;

  const FlightTicketWidget({super.key, required this.data});

  String _durationToString(int minutes) {
    if (minutes <= 0) return 'No info';
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}m';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ]),
        child: Column(children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 32,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: const Icon(
                  Icons.airplanemode_active,
                  color: Colors.white,
                ),
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Total Time : 1h 35m',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ))
            ],
          ),
          Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 10, bottom: 10, top: 10),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: data?.thread?.carrier?.logo != null
                            ? Image.network(
                                data?.thread?.carrier?.logo ?? '',
                                width: 50,
                                height: 50,
                              )
                            : const Text(
                                'No image',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              )),
                  ),
                  Flexible(
                      child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlightInfoWidget(
                              airport: data?.from?.stationTypeName,
                              city: data?.from?.title,
                              date: DateFormat.yMMMMd('ru_RU').format(
                                  DateTime.parse(data?.departure ?? '')),
                              time: DateFormat.jm('ru_RU').format(
                                  DateTime.parse(data?.departure ?? ''))),
                          Flexible(
                              child: Row(children: [
                            Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: const Icon(
                                  Icons.airplanemode_active_outlined,
                                  color: Colors.grey,
                                )),
                            Text(
                              //duration
                              _durationToString(data?.duration ?? 0),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            )
                          ])),
                          FlightInfoWidget(
                              airport: data?.to?.stationTypeName,
                              city: data?.to?.title,
                              date: DateFormat.yMMMMd('ru_RU')
                                  .format(DateTime.parse(data?.arrival ?? '')),
                              time: DateFormat.jm('ru_RU')
                                  .format(DateTime.parse(data?.arrival ?? ''))),
                          const Flexible(
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text("\$480")))
                        ],
                      )
                    ],
                  ))
                ],
              )),
        ]));
  }
}

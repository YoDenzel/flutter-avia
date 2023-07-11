import 'package:flutter/material.dart';
import 'package:flutter_avia/models/avia_data.dart';

import 'flight_info_widget.dart';

class FlightTicketWidget extends StatelessWidget {
  final AviaData? data;

  const FlightTicketWidget({super.key, required this.data});

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
                        child: data?.data?.segments?[6].thread?.carrier?.logo !=
                                null
                            ? Image.network(
                                data?.data?.segments?[0].thread?.carrier
                                        ?.logo ??
                                    '',
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
                              airport: data
                                  ?.data!.segments?[0].thread?.carrier?.title,
                              city: data
                                  ?.data!.segments?[0].thread?.carrier?.title,
                              date: data
                                  ?.data!.segments?[0].thread?.carrier?.title,
                              time: data
                                  ?.data!.segments?[0].thread?.carrier?.title),
                          Flexible(
                              child: Row(children: [
                            Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: const Icon(
                                  Icons.airplanemode_active_outlined,
                                  color: Colors.grey,
                                )),
                            Text(
                              data?.data?.segments?[0].thread?.carrier?.title ??
                                  '',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            )
                          ])),
                          FlightInfoWidget(
                              airport: data
                                  ?.data!.segments?[0].thread?.carrier?.title,
                              city: data
                                  ?.data!.segments?[0].thread?.carrier?.title,
                              date: data
                                  ?.data!.segments?[0].thread?.carrier?.title,
                              time: data
                                  ?.data!.segments?[0].thread?.carrier?.title),
                          const Flexible(
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text("S480")))
                        ],
                      )
                    ],
                  ))
                ],
              )),
        ]));
  }
}

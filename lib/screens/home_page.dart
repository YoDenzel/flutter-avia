import 'dart:ui';

import 'package:flutter_avia/widgets/chips_list_widget.dart';
import 'package:flutter_avia/widgets/flight_info_widget.dart';
import 'package:flutter_avia/widgets/flight_ticket_widget.dart';
import 'package:flutter_avia/widgets/plane_tickets_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avia/models/avia_data.dart';
import 'package:flutter_avia/widgets/route_name_widget.dart';

import '../services/fetch_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<AviaData?> futureAviaData;
  int activeDateIndex = -1;
  bool isExpanded = false;

  final dates = List<String>.generate(
      30,
      (i) => DateFormat('d MMM').format(DateTime.utc(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ).add(Duration(days: i))));

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
    futureAviaData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ApplicationToolbar(futureAvia: futureAviaData),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  height: 40,
                  child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.stylus,
                      }),
                      child: ChipsListWidget(
                        activeDateIndex: activeDateIndex,
                        onClickAction: (int index) {
                          setState(() {
                            activeDateIndex = index;
                          });
                        },
                      ))),
              FutureBuilder(
                  future: futureAviaData,
                  builder: (BuildContext context,
                      AsyncSnapshot<AviaData?> snapshot) {
                    if (snapshot.hasData) {
                      return Flexible(
                          child: Column(
                        children: [
                          PlaneTicketsWidget(
                              isExpanded: isExpanded,
                              onClickAction: () => {
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    })
                                  }),
                          Visibility(
                              visible: true,
                              child: Flexible(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          snapshot.data!.data?.segments?.length,
                                      itemBuilder: (context, index) {
                                        return FlightTicketWidget(
                                            data: snapshot.data);
                                      })))
                        ],
                      ));
                    } else {
                      return const Text('Loading...');
                    }
                  })
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class ApplicationToolbar extends StatelessWidget
    implements PreferredSizeWidget {
  late Future<AviaData?> futureAvia;

  ApplicationToolbar({super.key, required this.futureAvia});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureAvia,
        builder: (BuildContext context, AsyncSnapshot<AviaData?> snapshot) {
          if (snapshot.hasData) {
            return RouteNameWidget(snapshot: snapshot);
          } else {
            return AppBar(
              title: const Text('Loading...'),
            );
          }
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

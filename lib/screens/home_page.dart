import 'dart:ui';

import 'package:flutter_avia/widgets/chips_list_widget.dart';
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
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        height: 65,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        margin: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Container(
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Transform.rotate(
                                    angle: 45 * 3.14 / 180,
                                    child: const Icon(
                                      Icons.airplanemode_active_sharp,
                                      color: Colors.white,
                                    ))),
                            Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const Text(
                                  'Plane',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            const Spacer(),
                            Transform.rotate(
                                angle: isExpanded
                                    ? 90 * 3.14 / 180
                                    : -90 * 3.14 / 180,
                                child: IconButton(
                                    onPressed: () => setState(() {
                                          isExpanded = !isExpanded;
                                        }),
                                    icon: const Icon(Icons.chevron_right)))
                          ],
                        ),
                      );
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

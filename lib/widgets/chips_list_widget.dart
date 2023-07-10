import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ChipsListWidget extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  int activeDateIndex;
  Function onClickAction;

  ChipsListWidget(
      {super.key, required this.activeDateIndex, required this.onClickAction});

  final dates = List<String>.generate(
      30,
      (i) => DateFormat('d MMM').format(DateTime.utc(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ).add(Duration(days: i))));

  @override
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: dates.length,
      controller: _controller,
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: ActionChip(
              backgroundColor:
                  index == activeDateIndex ? Colors.blue : Colors.white,
              labelStyle: TextStyle(
                  color:
                      index == activeDateIndex ? Colors.white : Colors.black),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              label: Text(
                dates[index].toString(),
                style: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                onClickAction(index);
              },
            ));
      },
    );
  }
}

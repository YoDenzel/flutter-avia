import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlaneTicketsWidget extends StatelessWidget {
  bool isExpanded;
  Function onClickAction;

  PlaneTicketsWidget(
      {super.key, required this.isExpanded, required this.onClickAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      margin: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(3)),
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
              angle: isExpanded ? 90 * 3.14 / 180 : -90 * 3.14 / 180,
              child: IconButton(
                  onPressed: () => onClickAction(),
                  icon: const Icon(Icons.chevron_right)))
        ],
      ),
    );
  }
}

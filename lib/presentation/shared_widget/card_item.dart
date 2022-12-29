import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Widget buildYourContainer;
  final double marginTop;
  final double marginBottom;
  final double marginStart;
  final double marginEnd;
  CardItem(
      {required this.buildYourContainer,
        required this.marginTop,
        required this.marginEnd,
        required this.marginBottom,
        required this.marginStart});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
          top: marginTop,
          bottom: marginBottom,
          start: marginEnd,
          end: marginEnd),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildYourContainer,
      ),
    );
  }
}
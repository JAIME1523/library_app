import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';

class CardViewColor extends StatelessWidget {
  const CardViewColor({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    Color widgetColor = RandomColor.getColorObject(Options());
    return Container(
      constraints: const BoxConstraints(minHeight: 200),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            widgetColor.withOpacity(0.6),
            widgetColor.withOpacity(0.4),
            widgetColor.withOpacity(0.3),
            widgetColor.withOpacity(0.4),
          ])),
      child: Stack(
        children: [
          Positioned(
            bottom: -50,
            right: -30,
            child: Container(
                constraints:
                    const BoxConstraints(minHeight: 200, minWidth: 200),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100)),
                  gradient: LinearGradient(colors: [
                    widgetColor.withOpacity(0.1),
                    widgetColor.withOpacity(0.3),
                    widgetColor.withOpacity(0.5),
                  ]),
                )),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: widget,
          )
        ],
      ),
    );
  }
}

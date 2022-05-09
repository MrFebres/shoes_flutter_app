import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final String text;

  const BotonNaranja({
    Key? key,
    required this.text,
    this.color = Colors.orangeAccent,
    this.height = 50.0,
    this.width = 150.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      height: height,
      width: width,
    );
  }
}

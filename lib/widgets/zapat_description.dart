import 'package:flutter/material.dart';

class ZapatoDescripcion extends StatelessWidget {
  final String title;
  final String description;

  const ZapatoDescripcion({
    Key? key,
    required this.description,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w700,
              height: 1.4,
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30),
    );
  }
}

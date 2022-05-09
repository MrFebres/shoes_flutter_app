import 'package:flutter/material.dart';

import 'package:shoes_app/widgets/index.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double amount;

  const AgregarCarritoBoton({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(
            '\$$amount',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const BotonNaranja(text: 'Add to cart'),
          const SizedBox(width: 10),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      height: 100,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      width: double.infinity,
    );
  }
}

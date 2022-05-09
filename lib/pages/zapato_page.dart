import 'package:flutter/material.dart';

import 'package:shoes_app/helpers/status_bar.dart';
import 'package:shoes_app/widgets/index.dart';

class ZapatoPage extends StatelessWidget {
  const ZapatoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    darkStatusBar();

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'For you'),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  Hero(
                    child: ZapatoSizePreview(),
                    tag: 'zapato-1',
                  ),
                  ZapatoDescripcion(
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so",
                    title: 'Nike Air Max 720',
                  ),
                ],
              ),
              physics: const BouncingScrollPhysics(),
            ),
          ),
          const AgregarCarritoBoton(amount: 180.0)
        ],
      ),
    );
  }
}

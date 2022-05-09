import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shoes_app/models/zapat_model.dart';
import 'package:shoes_app/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ZapatoSizePreview({
    Key? key,
    this.fullScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: [
            const _ZapatoConSombra(),
            if (!fullScreen) const _ZapatoTallas(),
          ],
        ),
        decoration: BoxDecoration(
          color: const Color(0xffFFCF53),
          borderRadius: fullScreen
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )
              : BorderRadius.circular(50),
        ),
        height: fullScreen ? null : 430,
        margin: EdgeInsets.symmetric(
            horizontal: fullScreen ? 5 : 30.0,
            vertical: fullScreen ? 5.0 : 0.0),
        width: double.infinity,
      ),
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ZapatoDescPage()),
          );
        }
      },
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: [
          const _SombraZapato(),
          Image(image: AssetImage(zapatoModel.currentImage)),
        ],
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  const _ZapatoTallas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      child: Row(
        children: List.generate(6, (index) {
          final number = (index * 0.5) + 7;

          return GestureDetector(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                // ignore: unnecessary_string_interpolations
                '${number.toString().replaceAll('.0', '')}',
                style: TextStyle(
                  color: number == zapatoModel.size
                      ? Colors.white
                      : const Color(0xffF1A23A),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                color: number == zapatoModel.size
                    ? const Color(0xffF1A23A)
                    : Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  if (number == zapatoModel.size)
                    const BoxShadow(
                      color: Color(0xffF1A23A),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                ],
              ),
              height: 45,
              width: 45,
            ),
            onTap: () {
              final zapatoModel =
                  Provider.of<ZapatoModel>(context, listen: false);
              zapatoModel.size = number;
            },
          );
        }),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
    );
  }
}

class _SombraZapato extends StatelessWidget {
  const _SombraZapato({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(15.0, 140.0),
      child: Transform.rotate(
        angle: -0.5,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 40,
                  color: Color.fromARGB(255, 255, 154, 40),
                )
              ]),
          height: 100,
          width: 230,
        ),
      ),
    );
  }
}

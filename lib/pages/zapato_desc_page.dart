import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/helpers/status_bar.dart';
import 'package:shoes_app/models/zapat_model.dart';

import 'package:shoes_app/widgets/index.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    lightStatusBar();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                child: ZapatoSizePreview(fullScreen: true),
                tag: 'zapato-1',
              ),
              Positioned(
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  child: const Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.white,
                    size: 60,
                  ),
                  elevation: 0,
                  highlightElevation: 0,
                  onPressed: () {
                    darkStatusBar();
                    Navigator.pop(context);
                  },
                ),
                top: 30,
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ZapatoDescripcion(
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so",
                    title: 'Nike Air Max 720',
                  ),
                  _MontoBuyNow(),
                  const _ColoresYMas(),
                  const _BotonesLikeCartSettings()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const _BotonSombreado(Icon(
            Icons.star,
            color: Colors.red,
          )),
          _BotonSombreado(Icon(
            Icons.shopping_cart_rounded,
            color: Colors.grey.withOpacity(0.4),
          )),
          _BotonSombreado(Icon(
            Icons.settings,
            color: Colors.grey.withOpacity(0.4),
          )),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;

  const _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black12,
            offset: Offset(0, 5),
            spreadRadius: -5,
          )
        ],
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      height: 45,
      width: 45,
    );
  }
}

class _ColoresYMas extends StatelessWidget {
  const _ColoresYMas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const _BotonColor(
            Color(0xff364D56),
            'assets/imgs/negro.png',
          ),
          Transform.translate(
            offset: const Offset(-05.0, 0),
            child: const _BotonColor(
              Color(0xff2099F1),
              'assets/imgs/azul.png',
            ),
          ),
          Transform.translate(
            offset: const Offset(-15.0, 0),
            child: const _BotonColor(
              Color(0xffFFAD29),
              'assets/imgs/amarillo.png',
            ),
          ),
          Transform.translate(
            offset: const Offset(-25.0, 0),
            child: const _BotonColor(
              Color(0xffC6D642),
              'assets/imgs/verde.png',
            ),
          ),
          const Spacer(),
          BotonNaranja(
            color: const Color(0xffFFC675).withOpacity(0.7),
            height: 30,
            text: 'More related items',
            width: 170,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final String assetUrl;

  const _BotonColor(this.color, this.assetUrl);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        height: 45,
        width: 45,
      ),
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);

        zapatoModel.assetImage = assetUrl;
      },
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: const [
          Text(
            '\$180.0',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          BotonNaranja(
            height: 40,
            text: 'Buy now',
            width: 120,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.symmetric(vertical: 20),
    );
  }
}

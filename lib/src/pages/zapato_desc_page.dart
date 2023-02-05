import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/zapato_model.dart';

import 'package:shoes_app/src/widgets/export_custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                const Hero(
                  tag: 'zapato-1',
                  child: ZapatoSizePreview(fullScreen: true),
                ),
                Positioned(
                  top: 1.5.h(context),
                  left: 2.w(context),
                  child: FloatingActionButton(
                    elevation: 0,
                    highlightElevation: 0,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 60.sp(context),
                    ),
                    onPressed: () {
                      cambiarStatusDark();
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const ZapatoDescripcion(
                      titulo: 'Nike Air Max 720',
                      descripcion:
                          "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    ),
                    _MontoYByNow(),
                    _ColoresYMas(),
                    _BotonesLikeCartSettings()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3.h(context),
        horizontal: 3.w(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(
            Icon(
              Icons.favorite,
              size: 25.sp(context),
              color: Colors.red,
            ),
          ),
          _BotonSombreado(
            Icon(
              Icons.add_shopping_cart,
              size: 25.sp(context),
              color: Colors.grey.withOpacity(0.4),
            ),
          ),
          _BotonSombreado(
            Icon(
              Icons.settings,
              size: 25.sp(context),
              color: Colors.grey.withOpacity(0.4),
            ),
          )
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;

  const _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h(context),
      width: 12.5.w(context),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: icon,
    );
  }
}

class _ColoresYMas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 24.w(context),
                  child: const _BotonColor(Color(0xffc6d642), 4, 'verde'),
                ),
                Positioned(
                  left: 16.w(context),
                  child: const _BotonColor(Color(0xffffad29), 3, 'amarillo'),
                ),
                Positioned(
                  left: 8.w(context),
                  child: const _BotonColor(Color(0xff2099f1), 2, 'azul'),
                ),
                const _BotonColor(Color(0xff364d56), 1, 'negro'),
              ],
            ),
          ),
          const BotonNaranja(
            texto: 'More related items',
            color: Color(0xffffc675),
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;

  const _BotonColor(this.color, this.index, this.urlImagen);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 600),
      child: GestureDetector(
        onTap: () {
          zapatoModel.assetImage = urlImagen;
        },
        child: Container(
          width: 45.sp(context),
          height: 45.sp(context),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _MontoYByNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            const Text(
              '\$ 180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Bounce(
              from: 8,
              delay: const Duration(seconds: 1),
              child: const BotonNaranja(
                texto: 'Buy now',
              ),
            )
          ],
        ),
      ),
    );
  }
}

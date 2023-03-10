import 'package:flutter/material.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';

import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/zapato_model.dart';

import 'package:shoes_app/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ZapatoSizePreview({
    super.key,
    this.fullScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ZapatoDescPage(),
            ),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (fullScreen) ? 5 : 30, vertical: (fullScreen) ? 0 : 5),
        child: Container(
          width: double.infinity,
          // height: (fullScreen) ? 49.h(context) : 48.h(context),
          decoration: BoxDecoration(
            color: const Color(0xffffcf53),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              // Zapato con su sombra
              _ZapatoConSombra(),

              if (!fullScreen) _ZapatoTallas(),
              if (!fullScreen) const SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double numero;

  const _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        zapatoModel.talla = numero;
      },
      child: Container(
        alignment: Alignment.center,
        width: 42.sp(context),
        height: 42.sp(context),
        decoration: BoxDecoration(
            color: (numero == zapatoModel.talla)
                ? const Color(0xffFF9F00)
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (numero == zapatoModel.talla)
                const BoxShadow(
                  color: Color(0xffFFA514),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 5),
                )
            ]),
        child: Text(
          numero.toString().replaceAll('.0', ''),
          style: TextStyle(
              color: (numero == zapatoModel.talla)
                  ? Colors.white
                  : const Color(0xffffcf53),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatefulWidget {
  @override
  __ZapatoConSombraState createState() => __ZapatoConSombraState();
}

class __ZapatoConSombraState extends State<_ZapatoConSombra> {
  final imagenes = [
    const AssetImage('assets/imgs/verde.png'),
    const AssetImage('assets/imgs/amarillo.png'),
    const AssetImage('assets/imgs/azul.png'),
    const AssetImage('assets/imgs/negro.png'),
  ];

  // Para precargar las imagenes usar este metodo
  @override
  void didChangeDependencies() {
    List.generate(imagenes.length, (i) => precacheImage(imagenes[i], context));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(right: 0, bottom: 0, child: _ZapatoSombra()),
          Image(
            image: AssetImage('assets/imgs/${zapatoModel.assetImage}.png'),
          ),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(color: Color(0xffeaa14e), blurRadius: 40)
          ],
        ),
      ),
    );
  }
}

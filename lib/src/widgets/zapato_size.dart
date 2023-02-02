import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/zapato_model.dart';

import 'package:shoes_app/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  ZapatoSizePreview({
    this.fullScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ZapatoDescPage(),));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullScreen) ? 5 : 30, 
          vertical: (fullScreen) ? 0 : 5
        ),
        child: Container(
          // margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          height: (fullScreen) ? 390 : 420,
          decoration: BoxDecoration(
            color: Color(0xffffcf53),
            borderRadius: (!fullScreen) ? BorderRadius.circular(50)
            : BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              // Zapato con su sombra
              _ZapatoConSombra(),

              if(!fullScreen)
                _ZapatoTallas()
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
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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

  _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        zapatoModel.talla = numero;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: (numero == zapatoModel.talla) ? Color(0xffFF9F00) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (numero == zapatoModel.talla)
                BoxShadow(
                  color: Color(0xffFFA514),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 5),
                )
            ]),
        child: Text(
          '${numero.toString().replaceAll('.0', '')}',
          style: TextStyle(
              color: (numero == zapatoModel.talla) ? Colors.white : Color(0xffffcf53),
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
    AssetImage('assets/imgs/verde.png'),
    AssetImage('assets/imgs/amarillo.png'),
    AssetImage('assets/imgs/azul.png'),
    AssetImage('assets/imgs/negro.png'),
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
      padding: EdgeInsets.all(50),
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
            boxShadow: [BoxShadow(color: Color(0xffeaa14e), blurRadius: 40)]),
      ),
    );
  }
}

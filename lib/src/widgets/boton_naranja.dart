import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final String texto;
  final double alto;
  final double ancho;
  final Color color;

  BotonNaranja({
    required this.texto,
    this.alto = 50,
    this.ancho = 150,
    this.color = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: alto,
      width: ancho,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(100)),
      child: Text(
        texto,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

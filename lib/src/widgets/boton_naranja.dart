import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final String texto;
  final double? alto;
  final double? ancho;
  final Color color;

  const BotonNaranja({
    super.key,
    required this.texto,
    this.alto,
    this.ancho,
    this.color = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (alto == null && ancho == null)
          ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
          : null,
      alignment: Alignment.center,
      height: alto,
      width: ancho,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(100)),
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

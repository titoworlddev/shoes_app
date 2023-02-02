import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;
  CustomAppBar({required this.texto});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        // Tambien puedes usar el padding del propio container pero fernando asi lo hace...
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          child: Row(
            children: [
              Text(
                texto,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              Icon(
                Icons.search,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

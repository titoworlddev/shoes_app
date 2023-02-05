import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;
  const CustomAppBar({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        // Tambien puedes usar el padding del propio container pero fernando asi lo hace...
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          child: Row(
            children: [
              Text(
                texto,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              const Icon(
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

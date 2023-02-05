import 'package:flutter/material.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:shoes_app/src/helpers/helpers.dart';

import 'package:shoes_app/src/widgets/export_custom_widgets.dart';

class ZapatoPage extends StatelessWidget {
  const ZapatoPage({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    // cambiarStatusLight();

    return Scaffold(
      // body: CustomAppBar(texto: 'For you',)
      // body: ZapatoSizePreview(),
      body: Column(
        children: [
          const CustomAppBar(texto: 'For you'),
          SizedBox(
            height: 2.h(context),
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const [
                Hero(tag: 'zapato-1', child: ZapatoSizePreview()),
                ZapatoDescripcion(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                ZapatoDescripcion(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
              ],
            ),
          )),
          const AgregarCarritoBoton(monto: 180.0)
        ],
      ),
    );
  }
}

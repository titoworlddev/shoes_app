import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shoes_app/src/models/zapato_model.dart';

import 'package:shoes_app/src/pages/zapato_page.dart';
// import 'package:shoes_app/src/pages/zapato_desc_page.dart';
 
void main() {
  runApp(
    MultiProvider(
      providers: [
        // Se pueden los dos el provider y el changenotifierprovider aunque el ejemplo dice provider
        // eso si, si pones el provider lo acepta sin y con parentesis, pero el change solo con
        // Provider(create: (context) => ZapatoModel())
        ChangeNotifierProvider(create: (context) => ZapatoModel()),
      ],
      child: MyApp()
    )
  );
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes App',
      // home: ZapatoDescPage()
      home: ZapatoPage()
    );
  }
}
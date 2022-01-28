import 'package:flutter/material.dart';
import 'package:wikidoscorno/widget/max_width_container_widget.dart';
import 'package:wikidoscorno/widget/responsive_layout_widget.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

void setPathUrlStrategy() {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wiki Dos Corno',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: MaxWidthContainer(
            child: ResponsiveLayout(
          //AQUI FICA OS 3 "SITES" CRIADOS, POIS ASSIM TEMOS CONTROLE INDIVUDIAL POR TELA, DA PRA FAZER UNS AJUSTES FINOS ASSIM.
          mobileBody: SizedBox(),
          desktopBody: SizedBox(),
          tabletBody: SizedBox(),
        )),
      ), //TODO INDEX PAGE
    );
  }
}

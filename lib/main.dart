import 'package:flutter/material.dart';
import 'package:wikidoscorno/page/cadastro_artigo_page.dart';
import 'package:wikidoscorno/widget/max_width_container_widget.dart';
import 'package:wikidoscorno/widget/mobile/mobile_body_widget.dart';
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
      title: 'Wiki Dos Cor*o',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: MaxWidthContainer(
            child: ResponsiveLayout(
          //AQUI FICA OS 3 "SITES" CRIADOS, POIS ASSIM TEMOS CONTROLE INDIVUDIAL POR TELA, DA PRA FAZER UNS AJUSTES FINOS ASSIM.
          mobileBody: CadastroArtigoPage(), // MobileBody(),
          //tabletBody: TabletBody(),
          //desktopBody: DesktopBody(),
        )),
      ),
    );
  }
}
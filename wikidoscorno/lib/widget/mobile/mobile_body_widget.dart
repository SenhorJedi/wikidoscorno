import 'package:flutter/material.dart';
import 'package:wikidoscorno/utils/estilos_texto.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blue), //COR TOSCA PRA SER ALTERADA DEPOIS
      alignment: Alignment.center,
      child: Column(
        children: [
          //titulo da pagina
          Text(
            'WIKI DOS CORNO',
            style: styleTituloNegrito,
          ),
        ],
      ),
    );
  }
}

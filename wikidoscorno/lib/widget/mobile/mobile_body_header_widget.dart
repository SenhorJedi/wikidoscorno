import 'package:flutter/material.dart';
import 'package:wikidoscorno/utils/decoration_widgets.dart';
import 'package:wikidoscorno/utils/estilos_texto.dart';

class MobileBodyHeader extends StatelessWidget {
  const MobileBodyHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 350,
      decoration: const BoxDecoration(
        color: Color(0xFF583ABC),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //titulo da pagina
          Text(
            'WIKI',
            style: styleTituloNegrito(color: Colors.white),
          ),
          Text(
            'Aqui voce encontra tudo relacionado a você!',
            style: styleTexto(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.justify,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              child: TextFormField(
                decoration: decorationTextFormField(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

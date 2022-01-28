import 'package:flutter/material.dart';
import 'package:wikidoscorno/model/api_result_artigo.dart';
import 'package:wikidoscorno/model/artigo.dart';
import 'package:wikidoscorno/utils/api_provider.dart';
import 'package:wikidoscorno/utils/custom_sliver_delegate.dart';
import 'package:wikidoscorno/utils/estilos_texto.dart';

import 'mobile_body_header_widget.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const MobileBodyHeader(),
        _buildMobileBodyConteudo(),
      ],
    );
  }

  _buildMobileBodyConteudo() async {
    ResultApiArtigo resultApiArtigos = await ApiProvider().getTodosArtigos();

    return Container(
      padding: const EdgeInsets.all(10),
      height: 350,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          height: 50,
        ),
        itemBuilder: (context, index) {
          Artigo artigo = resultApiArtigos.artigos[index];
          return InkWell(
            onHover: (isHovering) {},
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    artigo.titulo,
                    style: styleTexto(),
                  ),
                  Text(
                    artigo.conteudo,
                    style: styleTexto(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

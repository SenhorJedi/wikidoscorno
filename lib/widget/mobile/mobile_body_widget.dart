import 'package:flutter/material.dart';
import 'package:wikidoscorno/model/api_result_artigo.dart';
import 'package:wikidoscorno/utils/api_provider.dart';
import 'package:wikidoscorno/utils/custom_sliver_delegate.dart';
import 'package:wikidoscorno/utils/estilos_texto.dart';
import 'package:wikidoscorno/utils/search_notifier.dart';

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

  Widget _buildMobileBodyConteudo() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 350,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ValueListenableBuilder(
        valueListenable: SearchNotifier.searchValue,
        builder: (context, String value, child) {
          return FutureBuilder(
            future: ApiProvider().getTodosArtigos(search: value),
            builder: (BuildContext context,
                AsyncSnapshot<ResultApiArtigo> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SizedBox.square(
                    dimension: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return GridView.builder(
                  itemCount: snapshot.data!.artigos.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    height: 100,
                  ),
                  itemBuilder: (context, index) {
                    var artigo = snapshot.data!.artigos[index];
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
                );
              }
            },
          );
        },
      ),
    );
  }
}

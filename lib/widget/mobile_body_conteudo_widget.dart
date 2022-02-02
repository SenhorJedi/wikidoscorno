// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:wikidoscorno/model/api_result_artigo.dart';
import 'package:wikidoscorno/utils/api_provider.dart';
import 'package:wikidoscorno/utils/custom_sliver_delegate.dart';
import 'package:wikidoscorno/utils/estilos_texto.dart';
import 'package:wikidoscorno/utils/search_notifier.dart';

class MobileBodyConteudo extends StatelessWidget {
  const MobileBodyConteudo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int page = 1;

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
            future: ApiProvider().getTodosArtigos(search: value, page: page),
            builder: (BuildContext context,
                AsyncSnapshot<ResultApiArtigo> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SizedBox.square(
                    dimension: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data!.artigos.isNotEmpty) {
                return Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
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
                      ),
                    ),
                    Container(
                      //color: Colors.black,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.paginas.length,
                          itemBuilder: (context, index) {
                            var pagina = snapshot.data!.paginas[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: (pagina.active)
                                    ? Colors.grey.shade300
                                    : Colors.grey.shade100,
                                child: TextButton(
                                  onPressed: (pagina.url.toString() != 'null')
                                      ? () {
                                          if (pagina.label == 'Proxima') {
                                            page++;
                                          } else {
                                            page = int.tryParse(
                                                pagina.label.toString())!;
                                          }
                                          print(page);
                                          SearchNotifier().newSearchValue(
                                              newValue: value, page: page);
                                        }
                                      : null,
                                  child: Text(pagina.label.toString()),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                );
              } else {
                return const Text('NAO TEM NADA AQUI C**IO');
              }
            },
          );
        },
      ),
    );
  }
}

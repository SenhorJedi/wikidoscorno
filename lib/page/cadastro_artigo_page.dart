import 'package:flutter/material.dart';
import 'package:wikidoscorno/utils/api_provider.dart';
import 'package:wikidoscorno/utils/colors.dart';
import 'package:wikidoscorno/utils/estilos_texto.dart';
import 'package:wikidoscorno/widget/formulario_cadastro_artigo_widget.dart';

class CadastroArtigoPage extends StatefulWidget {
  const CadastroArtigoPage({Key? key}) : super(key: key);

  @override
  State<CadastroArtigoPage> createState() => _CadastroArtigoPageState();
}

class _CadastroArtigoPageState extends State<CadastroArtigoPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: websitePurple,
        // appBar: AppBar(
        //    elevation: 0,
        //    backgroundColor: Colors.transparent,
        //  ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Cadastro Artigo',
                    style: styleTituloNegrito(color: Colors.white),
                  ),
                  const FormularioCadastro(),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = !isLoading;
                      });

                      String response = await ApiProvider().insertArtigo(
                          'api apiapi',
                          'aqui é o conteudo',
                          'aqui a linguagem',
                          'tag');

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          content: Container(
                            child: Text(
                              response.toString(),
                            ),
                          ),
                        ),
                      );

                      setState(() {
                        isLoading = !isLoading;
                      });
                    },
                    style: styleElevatedButton(
                      primary: Colors.white,
                    ),
                    child: Text(
                      'Salvar',
                      style: styleTexto(
                        color: Colors.purple.shade900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            (isLoading)
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey.withOpacity(.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox(),
          ],
        ));
  }
}

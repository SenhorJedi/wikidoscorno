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
    var size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: websitePurple,
        appBar: AppBar(),
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: styleElevatedButton(
                          minimumSize: Size(size.width, 50),
                          shape: const StadiumBorder()),
                      onPressed: () => salvarButtonOnPressed(),
                      child: Text(
                        'Salvar',
                        style: styleTexto(),
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
                    color: websiteInsidePurple.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox(),
          ],
        ));
  }

  salvarButtonOnPressed() async {
    setState(() {
      isLoading = !isLoading;
    });

    await Future.delayed(const Duration(milliseconds: 500));
/*
    String response = await ApiProvider().insertArtigo(
      titulo: 'api apiapi',
      conteudo: 'aqui é o conteudo',
      linguagem: 'aqui a linguagem',
      tag: 'tag',
    );
*/
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        content: const Text(
          'teste', //response.toString(),
        ),
      ),
    );

    setState(() {
      isLoading = !isLoading;
    });
  }
}

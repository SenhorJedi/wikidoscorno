import 'package:flutter/material.dart';
import 'package:wikidoscorno/utils/colors.dart';
import 'package:wikidoscorno/utils/estilos_texto.dart';
import 'package:wikidoscorno/widget/formulario_cadastro_artigo_widget.dart';

class CadastroArtigoPage extends StatefulWidget {
  const CadastroArtigoPage({Key? key}) : super(key: key);

  @override
  State<CadastroArtigoPage> createState() => _CadastroArtigoPageState();
}

class _CadastroArtigoPageState extends State<CadastroArtigoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: websitePurple,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Cadastro Artigo',
              style: styleTituloNegrito(color: Colors.white),
            ),
            const FormularioCadastro(),
            ElevatedButton(
              onPressed: () {},
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
    );
  }
}

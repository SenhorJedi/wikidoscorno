import 'package:flutter/material.dart';
import 'package:wikidoscorno/page/cadastro_artigo_page.dart';
import 'package:wikidoscorno/utils/colors.dart';
import 'package:wikidoscorno/utils/decoration_widgets.dart';
import 'package:wikidoscorno/utils/estilos_texto.dart';
import 'package:wikidoscorno/utils/search_notifier.dart';

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
        color: websitePurple,
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
                decoration: decorationTextFormField(
                  fillColor: websiteInsidePurple,
                  label: "diga-me o'que desejas!",
                  labelStyle: styleTexto(color: Colors.white, fontSize: 18),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                onChanged: (value) =>
                    SearchNotifier().newSearchValue(newValue: value, page: 1),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CadastroArtigoPage(),
              ),
            ),
            child: Text(
              "Cadastrar artigo",
              style: styleTexto(),
            ),
          ),
        ],
      ),
    );
  }
}

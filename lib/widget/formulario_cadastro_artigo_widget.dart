import 'package:flutter/material.dart';
import 'package:wikidoscorno/utils/colors.dart';
import 'package:wikidoscorno/utils/decoration_widgets.dart';
import 'package:wikidoscorno/utils/estilos_texto.dart';

class FormularioCadastro extends StatefulWidget {
  const FormularioCadastro({
    Key? key,
  }) : super(key: key);

  @override
  State<FormularioCadastro> createState() => _FormularioCadastroState();
}

class _FormularioCadastroState extends State<FormularioCadastro> {
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  String dropdownValue = 'pt-br';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: decorationTextFormField(
                label: 'Titulo',
                fillColor: websiteInsidePurple,
                labelStyle: styleTexto(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              maxLines: 5,
              decoration: decorationTextFormField(
                label: 'Conteudo',
                fillColor: websiteInsidePurple,
                labelStyle: styleTexto(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: websiteInsidePurple,
              ),
              child: DropdownButtonFormField<String>(
                value: dropdownValue,
                items: <String>['pt-br', 'eng', 'pt', 'mandarim']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: styleTexto(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (String? novoValor) {
                  setState(() {
                    dropdownValue = novoValor!;
                  });
                },
                elevation: 0,
                style: styleTexto(),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: websiteInsidePurple,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: decorationTextFormField(
                label: 'Tag',
                fillColor: websiteInsidePurple,
                labelStyle: styleTexto(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

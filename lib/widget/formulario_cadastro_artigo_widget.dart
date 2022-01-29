import 'package:flutter/material.dart';
import 'package:wikidoscorno/utils/colors.dart';
import 'package:wikidoscorno/utils/decoration_widgets.dart';

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
                hintText: 'Titulo',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: decorationTextFormField(
                hintText: 'Conteudo',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: decorationTextFormField(
                hintText: 'Linguagem',
                fillColor: websiteInsidePurple,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: decorationTextFormField(
                hintText: 'Tag',
                fillColor: websiteInsidePurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

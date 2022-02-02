import 'package:flutter/material.dart';
import '../mobile_body_conteudo_widget.dart';
import 'mobile_body_header_widget.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        MobileBodyHeader(),
        MobileBodyConteudo(),
      ],
    );
  }
}

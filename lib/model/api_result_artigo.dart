import 'package:wikidoscorno/model/artigo.dart';

class ResultApiArtigo {
  ResultApiArtigo(
    this.artigos,
    this.status,
    this.maxpage,
  );

  final List<Artigo> artigos;
  final String status;
  final int maxpage;
}

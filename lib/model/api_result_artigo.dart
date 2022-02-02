import 'package:wikidoscorno/model/artigo.dart';
import 'package:wikidoscorno/model/pages.dart';

class ResultApiArtigo {
  ResultApiArtigo(
    this.artigos,
    this.status,
    this.maxpage,
    this.paginas,
  );

  final List<Artigo> artigos;
  final List<Pages> paginas;
  final String status;
  final int maxpage;
}
